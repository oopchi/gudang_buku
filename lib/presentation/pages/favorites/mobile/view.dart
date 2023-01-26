import 'package:gudang_buku/inter/repository/author_book_repository_fs.dart';
import 'package:gudang_buku/inter/repository/author_repository_fs.dart';
import 'package:gudang_buku/inter/repository/book_genre_repository_fs.dart';
import 'package:gudang_buku/inter/repository/book_repository_fs.dart';
import 'package:gudang_buku/inter/repository/favorite_repository_fs.dart';
import 'package:gudang_buku/inter/repository/genre_repository_fs.dart';
import 'package:gudang_buku/inter/repository/media_repository_fs.dart';
import 'package:gudang_buku/inter/repository/review_repository_fs.dart';
import 'package:gudang_buku/inter/repository/transaction_detail_repository_fs.dart';
import 'package:gudang_buku/inter/repository/transaction_repository_fs.dart';
import 'package:gudang_buku/service/auth_service_impl.dart';
import 'package:gudang_buku/domain/controller/favorites_view_controller.dart';
import 'package:gudang_buku/domain/model/filter_model.dart';
import 'package:gudang_buku/presentation/pages/favorites/mobile/components/body.dart';
import 'package:gudang_buku/util/list_type_helper.dart';
import 'package:gudang_buku/util/sort_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'cubit.dart';

class FavoritesMobilePage extends StatefulWidget {
  const FavoritesMobilePage({
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
  State<FavoritesMobilePage> createState() => _FavoritesMobilePageState();
}

class _FavoritesMobilePageState extends State<FavoritesMobilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return FavoritesMobileCubit(
          isMounted: () => mounted,
          favoritesViewController: FavoritesViewController(
            genreRepository: GenreRepositoryFS(),
            authServiceFS: Provider.of<AuthServiceImpl>(context, listen: false),
            authorBookRepository: AuthorBookRepositoryFS(),
            authorRepository: AuthorRepositoryFS(),
            bookRepository: BookRepositoryFS(),
            favoriteRepository: FavoriteRepositoryFS(),
            mediaRepository: MediaRepositoryFS(),
            reviewRepository: ReviewRepositoryFS(),
            bookGenreRepository: BookGenreRepositoryFS(),
            transactionDetailRepository: TransactionDetailRepositoryFS(),
            transactionRepository: TransactionRepositoryFS(),
          ),
        )..load(
            genreId: widget.genreId,
            listType: widget.listType,
            filterModels: widget.filterModels,
            sortBy: widget.sortBy,
          );
      },
      child: Builder(
        builder: (context) => FavoritesMobileBody(
          listType: widget.listType,
          filterModels: widget.filterModels,
          genreId: widget.genreId,
          sortBy: widget.sortBy,
        ),
      ),
    );
  }
}
