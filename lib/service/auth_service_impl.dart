import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:gudang_buku/domain/dto/image_data.pb.dart';
import 'package:http/http.dart' as http;

import 'package:grpc/src/client/common.dart';
import 'package:gudang_buku/config/constant/routes.dart';
import 'package:gudang_buku/domain/dto/user_request.pb.dart';
import 'package:gudang_buku/domain/dto/user_response.pb.dart';
import 'package:gudang_buku/domain/dto/user_service.pbgrpc.dart';
import 'package:gudang_buku/domain/model/user_model.dart';
import 'package:gudang_buku/infra/local/local_storage.dart';
import 'package:gudang_buku/infra/repository/user_repository.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gudang_buku/util/file_streamer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gudang_buku/config/constant/file.dart';

class AuthServiceImpl {
  AuthServiceImpl({
    required LocalStorage localStorage,
    required UserServiceClient service,
  })  : _localStorage = localStorage,
        _service = service;

  final LocalStorage _localStorage;
  final UserServiceClient _service;

  UserModel? _currentUser;

  UserModel? getUser() => _currentUser;

  bool isLoggedIn() => _currentUser != null;

  Future<Either<Failure, UserModel>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final ResponseStream<LoginUserResponse> stream = _service.loginUser(LoginUserRequest(
        content: LoginUserRequestContent(
          email: email,
          password: password,
        ),
      ));

      await for (final LoginUserResponse res in stream) {
        switch (res.whichData()) {
          case LoginUserResponse_Data.content:
            res.content.
            break;
          case LoginUserResponse_Data.userData:
            break;
          case LoginUserResponse_Data.notSet:
            break;
        }
      }

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthFailure(e));
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

      final LoginUserResponse response = LoginUserResponse();

      await for (final LoginUserResponse res in responseStream) {
        switch (res.whichData()) {
          case LoginUserResponse_Data.content:
            response.content = res.content;
            break;
          case LoginUserResponse_Data.userData:
            switch (res.userData.whichData()) {
              case UserResponse_Data.content:
                response.userData.content = res.userData.content;
                break;
              case UserResponse_Data.imageData:
                final Either<Failure, void> r =
                    response.userData.imageData.add(res.userData.imageData);
                if (r.isLeft()) {
                  return Left(r.asLeft());
                }
                break;
              case UserResponse_Data.notSet:
                return const Left(
                    ServerFailure('Invalid response from server'));
            }
            break;
          case LoginUserResponse_Data.notSet:
            return const Left(ServerFailure('Invalid response from server'));
        }
      }

      List<Uint8>? profilePicture;

      //TODO(CALVIN): add google authentication here
      // if (googleUser.photoUrl != null) {
      // final String url = googleUser.photoUrl!;
      // final Uri uri = Uri.parse(url);
      // }

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
        accessToken: response.content.accessToken,
        refreshToken: response.content.refreshToken,
        profilePicture: profilePicture,
      );

      await _localStorage.overwrite<UserModel>(
          LocalStoragePath.user, userModel);

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthFailure(e));
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  void _getImage(String url) async {
    var uri = Uri.parse(url);

    try {
      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
      );

      if (response.contentLength == 0) {
        return;
      }
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      File file = File('$tempPath/profile.png');
      await file.writeAsBytes(response.bodyBytes);
    } catch (e) {}
  }

  Stream<CreateUserRequest> _createUser(String email, String password,
      String name, List<Uint8>? profilePicture) async* {
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

    final Uint8List bytes = profilePicture as Uint8List;
    final ReadBuffer readBuffer = ReadBuffer(ByteData.view(bytes.buffer));

    if (profilePicture != null) {
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
    List<Uint8>? profilePicture,
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
    } on FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthFailure(e));
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

  Failure _handleFirebaseAuthFailure(FirebaseAuthException e) {
    AuthFailureException authFailureException =
        AuthFailureException.invalidCredential;

    switch (e.code) {
      case 'provider-already-linked':
        authFailureException = AuthFailureException.providerAlreadyLinked;
        break;
      case 'credential-already-in-use':
        authFailureException = AuthFailureException.credentialAlreadyInUse;
        break;
      case 'email-already-in-use':
        authFailureException = AuthFailureException.emailAlreadyInUse;
        break;

      case 'account-exists-with-different-credential':
        authFailureException =
            AuthFailureException.accountExistsWithDifferentCredential;
        break;
      case 'invalid-credential':
        authFailureException = AuthFailureException.invalidCredential;
        break;
      case 'operation-not-allowed':
        authFailureException = AuthFailureException.operationNotAllowed;
        break;
      case 'user-disabled':
        authFailureException = AuthFailureException.userDisabled;
        break;
      case 'user-not-found':
        authFailureException = AuthFailureException.userNotFound;
        break;
      case 'wrong-password':
        authFailureException = AuthFailureException.wrongPassword;
        break;
      case 'weak-password':
        authFailureException = AuthFailureException.weakPassword;
        break;
      case 'invalid-verification-code':
        authFailureException = AuthFailureException.invalidVerificationCode;
        break;
      case 'invalid-verification-id':
        authFailureException = AuthFailureException.invalidVerificationId;
        break;
      default:
    }

    return AuthFailure(
      e.message ?? 'Authentication Failure',
      authFailureException: authFailureException,
    );
  }
}
