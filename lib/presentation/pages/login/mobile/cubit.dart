import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class LoginMobileCubit extends Cubit<LoginMobileState> {
  LoginMobileCubit() : super(LoginMobileState().init());

  Future<void> load() async {}
}
