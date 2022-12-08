import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/data/repository/book_repository_fs.dart';
import 'package:bookstore/presentation/pages/add_product/mobile/state.dart';
import 'package:bookstore/presentation/widget/loading_helper.dart';
import 'package:bookstore/presentation/widget/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cubit.dart';

class AddProductMobilePage extends StatefulWidget {
  const AddProductMobilePage({super.key});

  @override
  State<AddProductMobilePage> createState() => _AddProductMobilePageState();
}

class _AddProductMobilePageState extends State<AddProductMobilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isMounted() => mounted;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddProductMobileCubit(
        bookRepository: BookRepositoryFS(),
        isMounted: _isMounted,
      ),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocConsumer<AddProductMobileCubit, AddProductMobileState>(
      buildWhen: (previous, current) =>
          current is! AddProductMobileSuccess &&
          current is! AddProductMobileFailure,
      listener: (context, state) {
        if (state is AddProductMobileSuccess) {
          context.goNamed(AppRoutes.home.name);
        }

        if (state is AddProductMobileFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: state.message,
            ));
        }
      },
      builder: (context, state) {
        if (state is AddProductMobileLoading) return const AppLoadingView();

        if (state is AddProductMobileFormState) {
          return Scaffold(
            body: _buildForm(context, state),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildForm(BuildContext context, AddProductMobileFormState state) {
    return Form(
      key: _formKey,
      child: Container(),
    );
  }
}
