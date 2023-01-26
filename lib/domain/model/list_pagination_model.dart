import 'package:equatable/equatable.dart';
import 'package:gudang_buku/domain/model/pagination_model.dart';

class ListPaginationModel<T extends Equatable> extends Equatable {
  const ListPaginationModel({
    required this.contents,
    required this.paginationModel,
  });

  final List<T> contents;
  final PaginationModel paginationModel;

  @override
  List<Object?> get props => <Object?>[
        contents,
        paginationModel,
      ];
}
