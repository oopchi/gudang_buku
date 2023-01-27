import 'package:equatable/equatable.dart';
import 'package:gudang_buku/domain/dto/image_data.pb.dart';
import 'package:gudang_buku/domain/model/author_model.dart';
import 'package:gudang_buku/domain/model/genre_model.dart';

class BookModel extends Equatable {
  const BookModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.averageRating,
    required this.createdAt,
    this.description,
    this.files,
    required this.genres,
    required this.isRated,
    required this.numOfBought,
    required this.numOfRating,
    required this.price,
    required this.productStatus,
    this.stock,
    this.updatedAt,
    this.weight,
  });

  final int id;
  final List<GenreModel> genres;
  final String title;
  final String? description;
  final double price;
  final int? stock;
  final double? weight;
  final String productStatus;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final double averageRating;
  final int numOfRating;
  final int numOfBought;
  final bool isRated;
  final List<AuthorModel> authors;
  final List<ImageData>? files;

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        authors,
        averageRating,
        createdAt,
        description,
        files,
        genres,
        isRated,
        numOfBought,
        numOfRating,
        price,
        productStatus,
        stock,
        updatedAt,
        weight,
      ];
}
