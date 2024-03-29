import 'dart:io';

import 'package:gudang_buku/config/constant/routes.dart';
import 'package:gudang_buku/domain/dto/user_response.dart';
import 'package:gudang_buku/domain/local/local_storage.dart';
import 'package:gudang_buku/domain/repository/user_repository.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServiceFS {
  AuthServiceFS({
    required LocalStorage localStorage,
    required UserRepository userRepository,
  })  : _localStorage = localStorage,
        _userRepository = userRepository;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final LocalStorage _localStorage;
  final UserRepository _userRepository;

  User getUser() {
    return _auth.currentUser!;
  }

  bool isLoggedIn() => _auth.currentUser != null;

  Future<bool> isAdmin() async {
    if (!isLoggedIn()) return false;

    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      return await users.doc(getUser().uid).get().then(
        (DocumentSnapshot<Object?> result) async {
          if (!result.exists) return false;

          final UserResponse userResponse =
              UserResponse.fromJson(result.data() as Map<String, dynamic>);

          return userResponse.role != null && userResponse.role == 'admin';
        },
        onError: (e) => Left(DatabaseFailure(e.toString())),
      );
    } on ServerException {
      return false;
    } on SocketException {
      return false;
    }
  }

  Future<void> verify(AppRoutes currentRoute) async {
    await _auth.currentUser?.sendEmailVerification(
      ActionCodeSettings(
        url: currentRoute.fullPath,
      ),
    );
  }

  Future<Either<Failure, UserCredential>> _loginWithCredential(
      AuthCredential credential) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthFailure(e));
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  Future<Either<Failure, UserCredential>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      (credential as EmailAuthCredential).email;

      final Either<Failure, UserCredential> credentialRes =
          await _loginWithCredential(credential);

      if (credentialRes.isLeft()) {
        return Left(credentialRes.asLeft());
      }

      final UserCredential userCredential = credentialRes.asRight();

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
  Future<Either<Failure, UserCredential>> loginWithGoogle() async {
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

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      late final UserCredential userCredential;

      // Once signed in, return the UserCredential
      userCredential = await _auth.signInWithCredential(credential);

      final UserResponse userResponse = UserResponse(
        id: userCredential.user?.uid,
        meritAmount: 0,
      );

      final Either<Failure, void> userRes =
          await _userRepository.addOrUpdateUser(
        userResponse: userResponse,
      );

      if (userRes.isLeft()) {
        return Left(userRes.asLeft());
      }

      final User user = userCredential.user!;

      for (final UserInfo userInfo in user.providerData) {
        if (user.displayName == null) {
          await user.updateDisplayName(userInfo.displayName);
        }
        if (user.email == null) {
          await user.updateEmail(userInfo.email!);
        }
        if (user.photoURL == null) {
          await user.updatePhotoURL(userInfo.photoURL);
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

  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(userCredential);
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
      await _auth.signOut();

      await _localStorage.delete(LocalStoragePath.credential, 0);
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
