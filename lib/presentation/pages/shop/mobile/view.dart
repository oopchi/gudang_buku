import 'package:bookstore/data/repository/author_book_repository_fs.dart';
import 'package:bookstore/data/repository/author_repository_fs.dart';
import 'package:bookstore/data/repository/book_genre_repository_fs.dart';
import 'package:bookstore/data/repository/book_repository_fs.dart';
import 'package:bookstore/data/repository/favorite_repository_fs.dart';
import 'package:bookstore/data/repository/genre_repository_fs.dart';
import 'package:bookstore/data/repository/media_repository_fs.dart';
import 'package:bookstore/data/repository/review_repository_fs.dart';
import 'package:bookstore/data/repository/transaction_detail_repository_fs.dart';
import 'package:bookstore/data/service/auth_service_fs.dart';
import 'package:bookstore/domain/controller/shop_view_controller.dart';
import 'package:bookstore/domain/model/filter_model.dart';
import 'package:bookstore/presentation/pages/shop/mobile/components/body.dart';
import 'package:bookstore/presentation/pages/shop/mobile/state.dart';
import 'package:bookstore/util/list_type_helper.dart';
import 'package:bookstore/util/sort_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'cubit.dart';

class ShopMobilePage extends StatefulWidget {
  const ShopMobilePage({
    super.key,
    this.filterModels = const <FilterModel>[],
    this.sortBy,
    required this.listType,
    this.genreId = '',
  });
  final SortBy? sortBy;
  final List<FilterModel> filterModels;
  final ListType listType;
  final String genreId;

  @override
  State<ShopMobilePage> createState() => _ShopMobilePageState();
}

class _ShopMobilePageState extends State<ShopMobilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ShopMobileCubit(
          isMounted: () => mounted,
          shopViewController: ShopViewController(
            genreRepository: GenreRepositoryFS(),
            authServiceFS: Provider.of<AuthServiceFS>(context, listen: false),
            authorBookRepository: AuthorBookRepositoryFS(),
            authorRepository: AuthorRepositoryFS(),
            bookRepository: BookRepositoryFS(),
            favoriteRepository: FavoriteRepositoryFS(),
            mediaRepository: MediaRepositoryFS(),
            reviewRepository: ReviewRepositoryFS(),
            bookGenreRepository: BookGenreRepositoryFS(),
            transactionDetailRepository: TransactionDetailRepositoryFS(),
          ),
        )..load(
            genreId: widget.genreId,
            listType: widget.listType,
            filterModels: widget.filterModels,
            sortBy: widget.sortBy,
          );
      },
      child: Builder(
        builder: (context) => ShopMobileBody(
          listType: widget.listType,
          filterModels: widget.filterModels,
          genreId: widget.genreId,
          sortBy: widget.sortBy,
        ),
      ),
    );
  }
}
