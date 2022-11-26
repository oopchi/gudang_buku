import 'package:bookstore/data/repository/genre_repository_fs.dart';
import 'package:bookstore/data/repository/user_repository_fs.dart';
import 'package:bookstore/presentation/bloc/genre/cubit.dart';
import 'package:bookstore/presentation/bloc/profile/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:bookstore/data/dio_service.dart';

final providers = <SingleChildWidget>[
  Provider(
    create: (_) => DioService(),
  ),
  BlocProvider(
    create: (context) => GenreCubit(
      genreRepository: GenreRepositoryFS(),
    )..load(),
  ),
  BlocProvider(
    create: (context) => ProfileCubit(
      userRepository: UserRepositoryFS(),
    )..load(),
  ),
];
