import 'package:equatable/equatable.dart';

class GenreModel extends Equatable {
  const GenreModel({
    required this.name,
    required this.id,
  });

  final String name;
  final String id;

  @override
  List<Object?> get props => <Object?>[
        name,
        id,
      ];
}
