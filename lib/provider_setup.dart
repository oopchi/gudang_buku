import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:bookstore/core/apis/search_api.dart';
import 'package:bookstore/core/services/dio_service.dart';

final providers = <SingleChildWidget>[
  Provider(
    create: (_) => DioService(),
  ),
  ProxyProvider<DioService, SearchApi>(
    update: (_, DioService dio, __) => SearchApi(dio.dio),
  ),
];
