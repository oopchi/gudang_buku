import 'package:bookstore/data/repository/author_book_repository_fs.dart';
import 'package:bookstore/data/repository/author_repository_fs.dart';
import 'package:bookstore/data/repository/book_genre_repository_fs.dart';
import 'package:bookstore/data/repository/book_repository_fs.dart';
import 'package:bookstore/data/repository/favorite_repository_fs.dart';
import 'package:bookstore/data/repository/genre_repository_fs.dart';
import 'package:bookstore/data/repository/media_repository_fs.dart';
import 'package:bookstore/data/repository/review_repository_fs.dart';
import 'package:bookstore/data/repository/transaction_detail_repository_fs.dart';
import 'package:bookstore/data/repository/transaction_repository_fs.dart';
import 'package:bookstore/data/service/auth_service_fs.dart';
import 'package:bookstore/domain/controller/product_view_controller.dart';
import 'package:bookstore/presentation/pages/product/mobile/components/body.dart';
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
            authServiceFS: Provider.of<AuthServiceFS>(
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
