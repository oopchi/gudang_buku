import 'package:bloc/bloc.dart';

import 'state.dart';

class HomeMobileCubit extends Cubit<HomeMobileState> {
  HomeMobileCubit() : super(HomeMobileState().init());
}
