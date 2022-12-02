import 'package:bookstore/data/repository/author_book_repository_fs.dart';
import 'package:bookstore/data/repository/author_repository_fs.dart';
import 'package:bookstore/data/repository/book_repository_fs.dart';
import 'package:bookstore/data/repository/favorite_repository_fs.dart';
import 'package:bookstore/data/repository/genre_repository_fs.dart';
import 'package:bookstore/data/repository/media_repository_fs.dart';
import 'package:bookstore/data/repository/review_repository_fs.dart';
import 'package:bookstore/data/service/auth_service_fs.dart';
import 'package:bookstore/domain/controller/shop_view_controller.dart';
import 'package:bookstore/presentation/pages/shop/mobile/state.dart';
import 'package:bookstore/presentation/widget/appbar_helper.dart';
import 'package:bookstore/presentation/widget/loading_helper.dart';
import 'package:bookstore/presentation/widget/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'cubit.dart';

class ShopMobilePage extends StatefulWidget {
  const ShopMobilePage({super.key});

  @override
  State<ShopMobilePage> createState() => _ShopMobilePageState();
}

class _ShopMobilePageState extends State<ShopMobilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopMobileCubit(
        isMounted: () => mounted,
        shopViewController: ShopViewController(
          genreRepository: GenreRepositoryFS(),
          authServiceFS: Provider.of<AuthServiceFS>(context),
          authorBookRepository: AuthorBookRepositoryFS(),
          authorRepository: AuthorRepositoryFS(),
          bookRepository: BookRepositoryFS(),
          favoriteRepository: FavoriteRepositoryFS(),
          mediaRepository: MediaRepositoryFS(),
          reviewRepository: ReviewRepositoryFS(),
        ),
      )..load(),
      child: Builder(
        builder: (context) => _buildPage(context),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocConsumer<ShopMobileCubit, ShopMobileState>(
      listener: (context, state) {
        if (state is ShopMobileFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: state.message,
            ));
        }
      },
      buildWhen: (previous, current) =>
          current is ShopMobileLoaded || current is ShopMobileLoading,
      builder: (context, state) {
        if (state is ShopMobileLoaded) {
          return _buildScaffold(context);
        }

        return const AppLoadingView();
      },
    );
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBarHelper(
        height: 234.0.h,
        child: _buildTopBar(context),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_left),
            iconSize: 30.0.sp,
            padding: EdgeInsets.all(8.0.sp),
            constraints: const BoxConstraints(),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container();
  }
}
