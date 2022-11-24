import 'package:bookstore/domain/model/user_response.dart';
import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  const ProfileState();

  ProfileState init() {
    return const ProfileState();
  }

  ProfileState clone() {
    return const ProfileState();
  }

  @override
  List<Object?> get props => [];
}

class ProfileLoaded extends ProfileState {
  final UserResponse user;

  const ProfileLoaded({
    required this.user,
  });

  @override
  List<Object?> get props => <Object?>[
        user,
      ];
}
