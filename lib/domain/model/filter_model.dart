import 'package:equatable/equatable.dart';

enum FilterType {
  price,
  rating,
  noFilter,
}

abstract class FilterModel extends Equatable {
  const FilterModel();

  factory FilterModel.fromParam(FilterType filterType, double min, double max) {
    switch (filterType) {
      case FilterType.price:
        return FilterByPriceRange(
          minimumPrice: min.toInt(),
          maximumPrice: max.toInt(),
        );
      case FilterType.rating:
        return FilterByRatingRange(
          minimumRating: min,
          maximumRating: max,
        );
      default:
    }

    return NoFilter();
  }
}

class NoFilter extends FilterModel {
  @override
  List<Object?> get props => <Object?>[];
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
