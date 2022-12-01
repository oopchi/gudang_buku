import 'package:equatable/equatable.dart';

class FavoriteButtonModel extends Equatable {
  const FavoriteButtonModel({
    required this.showButton,
    required this.isFavorite,
  });

  final bool showButton;
  final bool isFavorite;

  @override
  List<Object?> get props => <Object?>[
        showButton,
        isFavorite,
      ];
}
