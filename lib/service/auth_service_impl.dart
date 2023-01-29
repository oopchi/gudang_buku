import 'dart:ffi';
import 'dart:io';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:gudang_buku/domain/dto/image_data.pb.dart';
import 'package:gudang_buku/domain/model/token_model.dart';
import 'package:http/http.dart' as http;

import 'package:grpc/src/client/common.dart';
import 'package:gudang_buku/domain/dto/user_request.pb.dart';
import 'package:gudang_buku/domain/dto/user_response.pb.dart';
import 'package:gudang_buku/domain/dto/user_service.pbgrpc.dart';
import 'package:gudang_buku/domain/model/user_model.dart';
import 'package:gudang_buku/infra/local/local_storage.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gudang_buku/util/file_streamer.dart';
import 'package:gudang_buku/config/constant/file.dart';

class AuthServiceImpl {
  AuthServiceImpl({
    required LocalStorage localStorage,
    required UserServiceClient service,
  })  : _localStorage = localStorage,
        _service = service {
    _init();
  }

  final LocalStorage _localStorage;
  final UserServiceClient _service;

  bool ready = false;
  UserModel? _currentUser;

  UserModel? getUser() => _currentUser;

  bool isLoggedIn() => _currentUser != null;

  Future<void> _init() async {
    _currentUser =
        await _localStorage.readAt<UserModel>(LocalStoragePath.user, 0);
    ready = true;
  }

  Future<Either<Failure, UserModel>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final ResponseStream<LoginUserResponse> stream =
          _service.loginUser(LoginUserRequest(
        content: LoginUserRequestContent(
          email: email,
          password: password,
        ),
      ));

      final Either<Failure, UserModel> res = await _receiveLoginUser(stream);
      if (res.isLeft()) {
        return Left(res.asLeft());
      }

      final UserModel userModel = res.asRight();

      await _localStorage.overwrite<UserModel>(
          LocalStoragePath.user, userModel);

      _currentUser = userModel;

      return Right(userModel);
    } on GrpcError catch (e) {
      return Left(handleGRPCFailure(e));
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  Future<Either<Failure, UserModel>> _receiveLoginUser(
      ResponseStream<LoginUserResponse> responseStream) async {
    try {
      final LoginUserResponse response = LoginUserResponse();

      await for (final LoginUserResponse res in responseStream) {
        switch (res.whichData()) {
          case LoginUserResponse_Data.content:
            response.content = res.content;
            break;
          case LoginUserResponse_Data.userData:
            final UserResponse ud = response.userData;
            switch (res.userData.whichData()) {
              case UserResponse_Data.content:
                ud.content = res.userData.content;
                break;
              case UserResponse_Data.imageData:
                final ImageData id = ud.imageData;
                final Either<Failure, void> r = id.add(res.userData.imageData);
                if (r.isLeft()) {
                  return Left(r.asLeft());
                }
                ud.imageData = id;
                break;
              case UserResponse_Data.notSet:
                return const Left(
                    ServerFailure('Invalid response from server'));
            }
            response.userData = ud;
            break;
          case LoginUserResponse_Data.notSet:
            return const Left(ServerFailure('Invalid response from server'));
        }
      }

      final TokenModel accessToken = TokenModel(
        token: response.content.accessToken,
        expiresAt: response.content.accessTokenExpiresAt.toDateTime(),
      );

      final TokenModel refreshToken = TokenModel(
        token: response.content.refreshToken,
        expiresAt: response.content.refreshTokenExpiresAt.toDateTime(),
      );

      final UserModel userModel = UserModel(
        createdAt: response.userData.content.createdAt.toDateTime(),
        id: response.id.toInt(),
        name: response.userData.content.name,
        email: response.userData.content.hasEmail()
            ? response.userData.content.email
            : null,
        emailVerified: response.userData.content.hasEmailVerified()
            ? response.userData.content.emailVerified
            : false,
        phoneNum: response.userData.content.hasPhoneNumber()
            ? response.userData.content.phoneNumber
            : null,
        phoneNumVerified: response.userData.content.hasPhoneNumberVerified()
            ? response.userData.content.phoneNumberVerified
            : false,
        updatedAt: response.userData.content.hasUpdatedAt()
            ? response.userData.content.updatedAt.toDateTime()
            : null,
        accessToken: accessToken,
        refreshToken: refreshToken,
        profilePicture: response.userData.imageData.hasChunk()
            ? response.userData.imageData.chunk
            : null,
      );

      return Right(userModel);
    } on GrpcError catch (e) {
      return Left(handleGRPCFailure(e));
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  // Thread with care as this interrupts with the UI
  Future<Either<Failure, UserModel>> loginWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser;

      googleUser = await GoogleSignIn(
        scopes: <String>[
          'email',
        ],
      ).signInSilently();

      // If there is no previously signed in user
      // Trigger the authentication flow
      googleUser ??= await GoogleSignIn(
        scopes: <String>[
          'email',
        ],
      ).signIn();

      if (googleUser == null) {
        return const Left(ServerFailure("No user logged in"));
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final ResponseStream<LoginUserResponse> responseStream =
          _service.loginUser(LoginUserRequest(
        googleContent: LoginGoogleUserContent(
          idToken: googleAuth.accessToken,
        ),
      ));

      final Either<Failure, UserModel> res =
          await _receiveLoginUser(responseStream);

      if (res.isLeft()) {
        return Left(res.asLeft());
      }

      final UserModel userModel = res.asRight();

      List<int>? profilePicture;

      if (googleUser.photoUrl != null) {
        final String url = googleUser.photoUrl!;
        profilePicture = await _getImage(url);
      }

      final UserModel result = UserModel(
        createdAt: userModel.createdAt,
        id: userModel.id,
        name: userModel.name,
        accessToken: userModel.accessToken,
        refreshToken: userModel.refreshToken,
        email: userModel.email,
        emailVerified: userModel.emailVerified,
        password: userModel.password,
        phoneNum: userModel.phoneNum,
        phoneNumVerified: userModel.phoneNumVerified,
        updatedAt: userModel.updatedAt,
        profilePicture: profilePicture,
      );

      await _localStorage.overwrite<UserModel>(
          LocalStoragePath.user, userModel);

      _currentUser = userModel;

      return Right(result);
    } on GrpcError catch (e) {
      return Left(handleGRPCFailure(e));
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  Future<List<int>?> _getImage(String url) async {
    var uri = Uri.parse(url);

    try {
      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
      );

      if (response.contentLength == 0) {
        return null;
      }

      return response.bodyBytes;
    } catch (e) {}

    return null;
  }

  Stream<CreateUserRequest> _createUser(String email, String password,
      String name, Uint8List? profilePicture) async* {
    yield CreateUserRequest(
      content: CreateUserContent(
        email: email,
        password: password,
        name: name,
      ),
    );

    yield CreateUserRequest(
      imageData: ImageData(
        imageID: Int64(1),
        metaData: ImageMetaData(
          imageExtension: 'jpg',
          mimeType: 'image/jpg',
        ),
      ),
    );

    if (profilePicture != null) {
      final ReadBuffer readBuffer =
          ReadBuffer(ByteData.view(profilePicture.buffer));

      while (readBuffer.hasRemaining) {
        final Uint8List byte = readBuffer.getUint8List(AppFile.maxByte);
        yield CreateUserRequest(
          imageData: ImageData(
            imageID: Int64(1),
            chunk: byte,
          ),
        );
      }
    }
  }

  Future<Either<Failure, UserModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    Uint8List? profilePicture,
  }) async {
    try {
      final ResponseStream<UserResponse> stream = _service
          .createUser(_createUser(email, password, name, profilePicture));

      final UserResponse userResponse = UserResponse();

      await for (final UserResponse res in stream) {
        switch (res.whichData()) {
          case UserResponse_Data.content:
            userResponse.content = res.content;
            break;
          case UserResponse_Data.imageData:
            final Either<Failure, void> result =
                userResponse.imageData.add(res.imageData);

            if (result.isLeft()) {
              return Left(result.asLeft());
            }
            break;
          case UserResponse_Data.notSet:
            break;
        }
      }

      return loginWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on GrpcError catch (e) {
      return Left(handleGRPCFailure(e));
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  Future<void> logout() async {
    if (isLoggedIn()) {
      _currentUser = null;

      await _localStorage.delete(LocalStoragePath.accessToken, 0);
      await _localStorage.delete(LocalStoragePath.refreshToken, 0);
      await _localStorage.delete(LocalStoragePath.email, 0);
      await _localStorage.delete(LocalStoragePath.password, 0);
      await _localStorage.delete(LocalStoragePath.googleToken, 0);
    }
  }
}
