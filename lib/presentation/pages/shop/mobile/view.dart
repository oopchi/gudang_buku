import 'package:gudang_buku/inter/repository/author_book_repository_fs.dart';
import 'package:gudang_buku/inter/repository/author_repository_fs.dart';
import 'package:gudang_buku/inter/repository/book_genre_repository_fs.dart';
import 'package:gudang_buku/inter/repository/book_repository_fs.dart';
import 'package:gudang_buku/inter/repository/favorite_repository_fs.dart';
import 'package:gudang_buku/inter/repository/genre_repository_fs.dart';
import 'package:gudang_buku/inter/repository/media_repository_fs.dart';
import 'package:gudang_buku/inter/repository/review_repository_fs.dart';
import 'package:gudang_buku/inter/repository/transaction_detail_repository_fs.dart';
import 'package:gudang_buku/service/auth_service_impl.dart';
import 'package:gudang_buku/domain/controller/shop_view_controller.dart';
import 'package:gudang_buku/domain/model/filter_model.dart';
import 'package:gudang_buku/presentation/pages/shop/mobile/components/body.dart';
import 'package:gudang_buku/presentation/pages/shop/mobile/state.dart';
import 'package:gudang_buku/util/list_type_helper.dart';
import 'package:gudang_buku/util/sort_helper.dart';
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
            authService: Provider.of<AuthServiceImpl>(context, listen: false),
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
