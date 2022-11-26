import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookstore/domain/model/user_response.dart';
import 'package:bookstore/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const ProfileState().init());

  final UserRepository _userRepository;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> load() async {
    final User? user = _auth.currentUser;

    if (user == null) {
      await _auth.signInAnonymously();

      emit(const ProfileLoaded(
        user: UserResponse(),
      ));

      return;
    }

    final Either<Failure, UserResponse> res =
        await _userRepository.fetchUserWithId(uid: user.uid);

    res.fold(
      (l) => null,
      (UserResponse userResponse) {
        emit(ProfileLoaded(
          user: userResponse,
        ));
      },
    );
  }
}
