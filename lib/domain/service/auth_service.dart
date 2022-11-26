import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<void> isAuthenticated();

  Future<void> signInAnonymously();

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
