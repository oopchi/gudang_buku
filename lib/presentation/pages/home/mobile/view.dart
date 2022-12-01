import 'package:bookstore/data/local/local_storage_hive.dart';
import 'package:bookstore/data/repository/amount_type_repository_fs.dart';
import 'package:bookstore/data/repository/author_book_repository_fs.dart';
import 'package:bookstore/data/repository/author_repository_fs.dart';
import 'package:bookstore/data/repository/book_repository_fs.dart';
import 'package:bookstore/data/repository/event_repository_fs.dart';
import 'package:bookstore/data/repository/favorite_repository_fs.dart';
import 'package:bookstore/data/repository/media_repository_fs.dart';
import 'package:bookstore/data/repository/promo_repository_fs.dart';
import 'package:bookstore/data/repository/review_repository_fs.dart';
import 'package:bookstore/data/service/auth_service_fs.dart';
import 'package:bookstore/domain/controller/home_view_controller.dart';
import 'package:bookstore/presentation/pages/home/mobile/components/body.dart';
import 'package:bookstore/presentation/pages/home/mobile/state.dart';
import 'package:bookstore/presentation/widget/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'cubit.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeMobileCubit(
        homeViewController: HomeViewController(
          localStorage: LocalStorageHive(),
          bookRepository: BookRepositoryFS(),
          promoRepository: PromoRepositoryFS(),
          eventRepository: EventRepositoryFS(),
          reviewRepository: ReviewRepositoryFS(),
          amountTypeRepository: AmountTypeRepositoryFS(),
          authorBookRepository: AuthorBookRepositoryFS(),
          authorRepository: AuthorRepositoryFS(),
          favoriteRepository: FavoriteRepositoryFS(),
          mediaRepository: MediaRepositoryFS(),
          authServiceFS: Provider.of<AuthServiceFS>(context),
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
          return const HomeMobileBody();
        }

        return const AppLoadingView();
      },
    );
  }
}
