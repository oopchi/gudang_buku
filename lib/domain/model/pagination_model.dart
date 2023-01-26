import 'package:equatable/equatable.dart';

class PaginationModel extends Equatable {
  const PaginationModel({
    required this.totalElements,
    required this.currElements,
    required this.currPage,
  });
  final int totalElements;
  final int currPage;
  final int currElements;

  @override
  List<Object?> get props => <Object?>[
        totalElements,
        currElements,
        currPage,
      ];
}
