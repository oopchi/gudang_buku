import 'package:gudang_buku/data/local/local_storage_hive.dart';
import 'package:gudang_buku/data/repository/author_book_repository_fs.dart';
import 'package:gudang_buku/data/repository/author_repository_fs.dart';
import 'package:gudang_buku/data/repository/book_repository_fs.dart';
import 'package:gudang_buku/data/repository/discount_repository_fs.dart';
import 'package:gudang_buku/data/repository/favorite_repository_fs.dart';
import 'package:gudang_buku/data/repository/media_repository_fs.dart';
import 'package:gudang_buku/data/repository/newsletter_repository_fs.dart';
import 'package:gudang_buku/data/repository/review_repository_fs.dart';
import 'package:gudang_buku/data/repository/user_discount_repository_fs.dart';
import 'package:gudang_buku/data/repository/user_repository_fs.dart';
import 'package:gudang_buku/data/service/auth_service_fs.dart';
import 'package:gudang_buku/domain/controller/discount_controller.dart';
import 'package:gudang_buku/domain/controller/newsletter_controller.dart';
import 'package:gudang_buku/domain/controller/product_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  Provider<AuthServiceFS>(
    create: (context) => AuthServiceFS(
      localStorage: LocalStorageHive(),
      userRepository: UserRepositoryFS(),
    ),
  ),
  Provider<NewsletterController>(
    create: (context) => NewsletterController(
      newsletterRepository: NewsletterRepositoryFS(),
    ),
  ),
  ProxyProvider<AuthServiceFS, ProductController>(
    update: (context, value, previous) => ProductController(
      authServiceFS: value,
      authorBookRepository: AuthorBookRepositoryFS(),
      authorRepository: AuthorRepositoryFS(),
      bookRepository: BookRepositoryFS(),
      favoriteRepository: FavoriteRepositoryFS(),
      mediaRepository: MediaRepositoryFS(),
      reviewRepository: ReviewRepositoryFS(),
    ),
  ),
  ProxyProvider<AuthServiceFS, DiscountController>(
    update: (context, value, previous) => DiscountController(
      authServiceFS: value,
      discountRepository: DiscountRepositoryFS(),
      userDiscountRepository: UserDiscountRepositoryFS(),
    ),
  ),
];
