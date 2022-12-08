import 'package:bookstore/domain/model/filter_model.dart';
import 'package:bookstore/presentation/pages/favorites/mobile/view.dart';
import 'package:bookstore/presentation/widget/responsive_helper.dart';
import 'package:bookstore/util/list_type_helper.dart';
import 'package:bookstore/util/sort_helper.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
    this.sortBy,
    this.filterModels = const <FilterModel>[],
    this.listType = ListType.list,
    this.genreId = '',
  });
  final SortBy? sortBy;
  final List<FilterModel> filterModels;
  final ListType listType;
  final String genreId;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: FavoritesMobilePage(
        listType: listType,
        sortBy: sortBy,
        filterModels: filterModels,
        genreId: genreId,
      ),
      tabletBody: FavoritesMobilePage(
        listType: listType,
        sortBy: sortBy,
        filterModels: filterModels,
        genreId: genreId,
      ),
      desktopBody: FavoritesMobilePage(
        listType: listType,
        sortBy: sortBy,
        filterModels: filterModels,
        genreId: genreId,
      ),
    );
  }
}
