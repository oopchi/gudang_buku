import 'package:equatable/equatable.dart';

abstract class FilterModel extends Equatable {
  const FilterModel();
}

class FilterByPriceRange extends FilterModel {
  const FilterByPriceRange({
    required this.minimumPrice,
    required this.maximumPrice,
  });
  final int minimumPrice;
  final int maximumPrice;

  @override
  List<Object?> get props => <Object?>[
        maximumPrice,
        minimumPrice,
      ];
}

class FilterByRatingRange extends FilterModel {
  const FilterByRatingRange({
    required this.maximumRating,
    required this.minimumRating,
  });

  final double minimumRating;
  final double maximumRating;

  @override
  List<Object?> get props => <Object?>[
        minimumRating,
        maximumRating,
      ];
}

class FilterByAuthor extends FilterModel {
  const FilterByAuthor({
    required this.authorName,
  });

  final String authorName;

  @override
  List<Object?> get props => <Object?>[
        authorName,
      ];
}
