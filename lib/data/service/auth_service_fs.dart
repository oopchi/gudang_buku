import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceFS {
  AuthServiceFS._internal();

  factory AuthServiceFS() => _instance;

  static final AuthServiceFS _instance = AuthServiceFS._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoggedIn() => _auth.currentUser != null;
}
