import 'package:equatable/equatable.dart';
import 'package:gudang_buku/domain/dto/image_data.pb.dart';
import 'package:gudang_buku/domain/model/book_model.dart';

class DiscoveryModel extends Equatable {
  const DiscoveryModel({
    required this.id,
    required this.displayOrder,
    required this.createdAt,
    this.file,
    this.updatedAt,
    required this.books,
  });

  final int id;
  final int displayOrder;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final ImageData? file;
  final List<BookModel> books;

  @override
  List<Object?> get props => <Object?>[
        id,
        displayOrder,
        createdAt,
        updatedAt,
        file,
      ];
}
