import 'package:equatable/equatable.dart';

class AuthorModel extends Equatable {
  const AuthorModel({
    required this.name,
    required this.id,
    required this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => <Object?>[
        name,
        id,
        createdAt,
        updatedAt,
      ];
}
