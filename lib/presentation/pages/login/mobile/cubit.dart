import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookstore/config/router/middleware/auth.dart';
import 'package:bookstore/data/local/local_storage_hive.dart';

import 'state.dart';

class LoginMobileCubit extends Cubit<LoginMobileState> {
  LoginMobileCubit() : super(LoginMobileState().init());

  Future<void> load() async {}
}
