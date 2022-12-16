import 'package:gudang_buku/domain/model/author_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class AddProductMobileState extends Equatable {
  const AddProductMobileState();

  AddProductMobileState init() {
    return const AddProductMobileState();
  }

  AddProductMobileState clone() {
    return const AddProductMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class AddProductMobileFailure extends AddProductMobileState {
  const AddProductMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[
        message,
      ];
}

class AddProductMobileLoading extends AddProductMobileState {
  const AddProductMobileLoading();
  @override
  List<Object?> get props => <Object?>[];
}

class AddProductMobileSuccess extends AddProductMobileState {}

class AddProductMobileFormState extends AddProductMobileState {
  const AddProductMobileFormState({
    required this.title,
    this.overview,
    required this.authors,
    required this.selectedAuthors,
    required this.images,
    required this.videos,
    required this.price,
    required this.stock,
  });
  final String title;
  final String? overview;
  final List<AuthorModel> authors;
  final List<AuthorModel> selectedAuthors;
  final int price;
  final int stock;

  final List<Uint8List> images;
  final List<Uint8List> videos;

  @override
  List<Object?> get props => <Object?>[
        title,
        overview,
        authors,
        selectedAuthors,
        images,
        videos,
        price,
        stock,
      ];
}
