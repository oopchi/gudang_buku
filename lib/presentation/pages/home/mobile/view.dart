import 'package:bookstore/data/repository/book_repository_fs.dart';
import 'package:bookstore/data/repository/genre_repository_fs.dart';
import 'package:bookstore/presentation/pages/home/mobile/components/app_bar.dart';
import 'package:bookstore/presentation/pages/home/mobile/components/body.dart';
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
      ),
      child: Builder(
        builder: (context) => _buildPage(context),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final HomeMobileCubit cubit = BlocProvider.of<HomeMobileCubit>(context);
    cubit.state;

    return const Scaffold(
      appBar: HomeMobileAppBar(),
      body: HomeMobileBody(),
    );
  }
}
