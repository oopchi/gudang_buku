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
import 'package:gudang_buku/domain/controller/product_view_controller.dart';
import 'package:gudang_buku/presentation/pages/product/mobile/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'cubit.dart';

class ProductMobilePage extends StatefulWidget {
  const ProductMobilePage({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  State<ProductMobilePage> createState() => _ProductMobilePageState();
}

class _ProductMobilePageState extends State<ProductMobilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ProductMobileCubit(
          isMounted: () => mounted,
          productViewController: ProductViewController(
            bookGenreRepository: BookGenreRepositoryFS(),
            genreRepository: GenreRepositoryFS(),
            transactionDetailRepository: TransactionDetailRepositoryFS(),
            bookRepository: BookRepositoryFS(),
            reviewRepository: ReviewRepositoryFS(),
            authorBookRepository: AuthorBookRepositoryFS(),
            authorRepository: AuthorRepositoryFS(),
            favoriteRepository: FavoriteRepositoryFS(),
            mediaRepository: MediaRepositoryFS(),
            authService: Provider.of<AuthServiceImpl>(
              context,
              listen: false,
            ),
            transactionRepository: TransactionRepositoryFS(),
          ),
        )..load(productId: widget.productId);
      },
      child: Builder(
        builder: (context) => ProductMobileBody(
          productId: widget.productId,
        ),
      ),
    );
  }
}
