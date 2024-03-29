import 'package:gudang_buku/data/local/local_storage_hive.dart';
import 'package:gudang_buku/data/repository/amount_type_repository_fs.dart';
import 'package:gudang_buku/data/repository/author_book_repository_fs.dart';
import 'package:gudang_buku/data/repository/author_repository_fs.dart';
import 'package:gudang_buku/data/repository/book_repository_fs.dart';
import 'package:gudang_buku/data/repository/event_repository_fs.dart';
import 'package:gudang_buku/data/repository/favorite_repository_fs.dart';
import 'package:gudang_buku/data/repository/media_repository_fs.dart';
import 'package:gudang_buku/data/repository/promo_repository_fs.dart';
import 'package:gudang_buku/data/repository/review_repository_fs.dart';
import 'package:gudang_buku/data/service/auth_service_fs.dart';
import 'package:gudang_buku/domain/controller/home_view_controller.dart';
import 'package:gudang_buku/presentation/pages/home/mobile/components/body.dart';
import 'package:gudang_buku/presentation/pages/home/mobile/state.dart';
import 'package:gudang_buku/presentation/widget/loading_helper.dart';
import 'package:gudang_buku/presentation/widget/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'cubit.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
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
          authServiceFS: Provider.of<AuthServiceFS>(
            context,
            listen: false,
          ),
        ),
        isMounted: () => mounted,
      )..load(),
      child: Builder(
        builder: (context) => _buildPage(context),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocConsumer<HomeMobileCubit, HomeMobileState>(
      listener: (context, state) {
        if (state is HomeMobileFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: state.message,
            ));
        }
      },
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
