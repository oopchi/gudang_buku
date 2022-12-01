import 'package:bookstore/data/local/local_storage_hive.dart';
import 'package:bookstore/data/repository/user_repository_fs.dart';
import 'package:bookstore/data/service/auth_service_fs.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  Provider<AuthServiceFS>(
    create: (context) => AuthServiceFS(
      localStorage: LocalStorageHive(),
      userRepository: UserRepositoryFS(),
    ),
  ),
];
