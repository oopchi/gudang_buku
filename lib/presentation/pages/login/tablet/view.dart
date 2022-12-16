import 'package:gudang_buku/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class LoginTabletPage extends StatelessWidget {
  const LoginTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginTabletCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final LoginTabletCubit cubit = BlocProvider.of<LoginTabletCubit>(context);
    cubit.state;

    return ResponsiveLayout(
      mobileBody: Container(),
      tabletBody: Container(),
      desktopBody: Container(),
    );
  }
}
