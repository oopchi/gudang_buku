import 'package:bookstore/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class LoginMobilePage extends StatelessWidget {
  const LoginMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginMobileCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final LoginMobileCubit cubit = BlocProvider.of<LoginMobileCubit>(context);
    cubit.state;

    return ResponsiveLayout(
      mobileBody: Container(),
      tabletBody: Container(),
      desktopBody: Container(),
    );
  }
}
