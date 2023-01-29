import 'package:equatable/equatable.dart';
import 'package:gudang_buku/domain/dto/author_response.pb.dart';

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

extension AuthorResponseExt on List<AuthorResponse> {
  List<AuthorModel> toAuthorModels() => asMap().entries.map(
        (e) {
          final DateTime? updatedAt =
              e.value.hasUpdatedAt() ? e.value.updatedAt.toDateTime() : null;

          return AuthorModel(
            name: e.value.name,
            id: e.value.id.toInt(),
            createdAt: e.value.createdAt.toDateTime(),
            updatedAt: updatedAt,
          );
        },
      ).toList();
}
