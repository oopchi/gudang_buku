import 'package:bookstore/data/local/local_storage_hive.dart';
import 'package:bookstore/data/repository/book_repository_fs.dart';
import 'package:bookstore/data/repository/genre_repository_fs.dart';
import 'package:bookstore/data/repository/transaction_repository_fs.dart';
import 'package:bookstore/data/repository/user_repository_fs.dart';
import 'package:bookstore/domain/controller/book_controller.dart';
import 'package:bookstore/domain/controller/transaction_controller.dart';
import 'package:bookstore/domain/controller/user_controller.dart';
import 'package:bookstore/presentation/pages/home/mobile/components/app_bar.dart';
import 'package:bookstore/presentation/pages/home/mobile/components/body.dart';
import 'package:bookstore/presentation/pages/home/mobile/state.dart';
import 'package:bookstore/presentation/widget/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeMobileCubit(
        bookRepository: BookRepositoryFS(),
        genreRepository: GenreRepositoryFS(),
        bookController: BookController(
          bookRepository: BookRepositoryFS(),
          localStorage: LocalStorageHive(),
          transactionController: TransactionController(
            transactionRepository: TransactionRepositoryFS(),
            localStorage: LocalStorageHive(),
          ),
        ),
        userController: UserController(
          localStorage: LocalStorageHive(),
          userRepository: UserRepositoryFS(),
        ),
      )..load(),
      child: Builder(
        builder: (context) => _buildPage(context),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocBuilder<HomeMobileCubit, HomeMobileState>(
      buildWhen: (previous, current) =>
          current is HomeMobileLoaded || current is HomeMobileLoading,
      builder: (context, state) {
        if (state is HomeMobileLoaded) {
          return const Scaffold(
            appBar: HomeMobileAppBar(),
            body: HomeMobileBody(),
          );
        }

        return const AppLoadingView();
      },
    );
  }
}
