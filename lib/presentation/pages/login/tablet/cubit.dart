import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class LoginTabletCubit extends Cubit<LoginTabletState> {
  LoginTabletCubit() : super(LoginTabletState().init());
}
