import 'package:bookstore/presentation/pages/home/mobile/components/app_bar.dart';
import 'package:bookstore/presentation/pages/home/mobile/components/body.dart';
import 'package:bookstore/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import 'state.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeMobileCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final HomeMobileCubit cubit = BlocProvider.of<HomeMobileCubit>(context);
    cubit.state;

    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomeBody(),
    );
  }
}
