import 'package:gudangBuku/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class LoginDesktopPage extends StatelessWidget {
  const LoginDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginDesktopCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final LoginDesktopCubit cubit = BlocProvider.of<LoginDesktopCubit>(context);
    cubit.state;

    return ResponsiveLayout(
      mobileBody: Container(),
      tabletBody: Container(),
      desktopBody: Container(),
    );
  }
}
