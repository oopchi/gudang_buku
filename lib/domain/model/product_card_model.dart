import 'package:bookstore/domain/model/favorite_button_model.dart';
import 'package:equatable/equatable.dart';

class ProductCardModel extends Equatable {
  const ProductCardModel({
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
      ];
}
