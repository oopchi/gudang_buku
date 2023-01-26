import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:gudang_buku/inter/local/local_storage_hive.dart';
import 'package:gudang_buku/inter/repository/author_book_repository_fs.dart';
import 'package:gudang_buku/inter/repository/author_repository_fs.dart';
import 'package:gudang_buku/inter/repository/book_repository_fs.dart';
import 'package:gudang_buku/inter/repository/discount_repository_fs.dart';
import 'package:gudang_buku/inter/repository/favorite_repository_fs.dart';
import 'package:gudang_buku/inter/repository/media_repository_fs.dart';
import 'package:gudang_buku/inter/repository/newsletter_repository_fs.dart';
import 'package:gudang_buku/inter/repository/review_repository_fs.dart';
import 'package:gudang_buku/inter/repository/user_discount_repository_fs.dart';
import 'package:gudang_buku/inter/repository/user_repository_fs.dart';
import 'package:gudang_buku/service/auth_service_impl.dart';
import 'package:gudang_buku/domain/controller/discount_controller.dart';
import 'package:gudang_buku/domain/controller/newsletter_controller.dart';
import 'package:gudang_buku/domain/controller/product_controller.dart';
import 'package:gudang_buku/domain/dto/book_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/discount_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/discovery_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/promo_code_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/session_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/user_service.pbgrpc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  Provider<AuthServiceImpl>(
    create: (context) => AuthServiceImpl(
      localStorage: LocalStorageHive(),
      userRepository: UserRepositoryFS(),
    ),
  ),
  Provider<ClientChannel>(
    create: (context) => ClientChannel(
      dotenv.env['BASE_URL'] ?? 'localhost',
      port: int.tryParse(dotenv.env['BASE_PORT'] ?? '9090') ?? 9090,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
  ),
  ProxyProvider<ClientChannel, BookServiceClient>(
    update: (context, value, previous) => BookServiceClient(value),
  ),
  ProxyProvider<ClientChannel, PromoCodeServiceClient>(
    update: (context, value, previous) => PromoCodeServiceClient(value),
  ),
  ProxyProvider<ClientChannel, UserServiceClient>(
    update: (context, value, previous) => UserServiceClient(value),
  ),
  ProxyProvider<ClientChannel, SessionServiceClient>(
    update: (context, value, previous) => SessionServiceClient(value),
  ),
  ProxyProvider<ClientChannel, DiscoveryServiceClient>(
    update: (context, value, previous) => DiscoveryServiceClient(value),
  ),
  ProxyProvider<ClientChannel, DiscountServiceClient>(
    update: (context, value, previous) => DiscountServiceClient(value),
  ),
  Provider<NewsletterController>(
    create: (context) => NewsletterController(
      newsletterRepository: NewsletterRepositoryFS(),
    ),
  ),
  ProxyProvider<AuthServiceImpl, ProductController>(
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
  ProxyProvider<AuthServiceImpl, DiscountController>(
    update: (context, value, previous) => DiscountController(
      authServiceFS: value,
      discountRepository: DiscountRepositoryFS(),
      userDiscountRepository: UserDiscountRepositoryFS(),
    ),
  ),
];
