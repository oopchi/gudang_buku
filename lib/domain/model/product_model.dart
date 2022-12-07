import 'package:bookstore/domain/model/favorite_button_model.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  const ProductModel({
    required this.id,
    required this.favoriteButtonModel,
    required this.imageUrl,
    required this.author,
    this.discountString,
    this.discountedPrice,
    required this.numOfRating,
    required this.price,
    required this.rating,
    required this.title,
    this.authorOverviews,
    this.description,
    required this.imageUrls,
  });
  final String id;
  final String? discountString;
  final FavoriteButtonModel favoriteButtonModel;
  final String imageUrl;
  final double rating;
  final int numOfRating;
  final String author;
  final String title;
  final int price;
  final int? discountedPrice;
  final String? description;
  final Map<String, String>? authorOverviews;
  final List<String> imageUrls;

  @override
  List<Object?> get props => <Object?>[
        id,
        favoriteButtonModel,
        imageUrl,
        author,
        discountString,
        discountedPrice,
        numOfRating,
        price,
        rating,
        title,
        authorOverviews,
        description,
        imageUrls,
      ];

  ProductModel copyWith({
    String? id,
    String? discountString,
    FavoriteButtonModel? favoriteButtonModel,
    String? imageUrl,
    double? rating,
    int? numOfRating,
    String? author,
    String? title,
    int? price,
    int? discountedPrice,
    String? description,
    Map<String, String>? authorOverviews,
    List<String>? imageUrls,
  }) =>
      ProductModel(
        id: id ?? this.id,
        favoriteButtonModel: favoriteButtonModel ?? this.favoriteButtonModel,
        imageUrl: imageUrl ?? this.imageUrl,
        author: author ?? this.author,
        numOfRating: numOfRating ?? this.numOfRating,
        price: price ?? this.price,
        rating: rating ?? this.rating,
        title: title ?? this.title,
        imageUrls: imageUrls ?? this.imageUrls,
        discountString: discountString ?? this.discountString,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        description: description ?? this.description,
        authorOverviews: authorOverviews ?? this.authorOverviews,
      );
}
