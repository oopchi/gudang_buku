import 'package:gudangBuku/data/local/local_storage_hive.dart';
import 'package:gudangBuku/data/repository/author_book_repository_fs.dart';
import 'package:gudangBuku/data/repository/author_repository_fs.dart';
import 'package:gudangBuku/data/repository/book_repository_fs.dart';
import 'package:gudangBuku/data/repository/favorite_repository_fs.dart';
import 'package:gudangBuku/data/repository/media_repository_fs.dart';
import 'package:gudangBuku/data/repository/review_repository_fs.dart';
import 'package:gudangBuku/data/repository/user_repository_fs.dart';
import 'package:gudangBuku/data/service/auth_service_fs.dart';
import 'package:gudangBuku/domain/controller/product_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  Provider<AuthServiceFS>(
    create: (context) => AuthServiceFS(
      localStorage: LocalStorageHive(),
      userRepository: UserRepositoryFS(),
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
];
