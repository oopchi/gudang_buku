import 'package:equatable/equatable.dart';

class AuthorModel extends Equatable {
  const AuthorModel({
    required this.id,
    required this.name,
    this.description,
  });

  final String id;
  final String name;
  final String? description;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        description,
      ];
}
