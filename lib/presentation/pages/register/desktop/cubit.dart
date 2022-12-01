import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class LoginDesktopCubit extends Cubit<LoginDesktopState> {
  LoginDesktopCubit() : super(LoginDesktopState().init());
}
