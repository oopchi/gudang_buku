import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:bookstore/src/data/dio_service.dart';

final providers = <SingleChildWidget>[
  Provider(
    create: (_) => DioService(),
  ),
];
