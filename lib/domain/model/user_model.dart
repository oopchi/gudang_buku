import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  const UserModel({
    required this.uid,
    this.photoUrl,
    this.email,
  });

  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String? photoUrl;
  @HiveField(2)
  final String? email;

  static UserModel from(User user) => UserModel(
        uid: user.uid,
        photoUrl: user.photoURL,
        email: user.email,
      );
}
