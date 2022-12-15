import 'package:gudangBuku/domain/model/filter_model.dart';
import 'package:gudangBuku/presentation/pages/shop/mobile/view.dart';
import 'package:gudangBuku/presentation/widget/responsive_helper.dart';
import 'package:gudangBuku/util/list_type_helper.dart';
import 'package:gudangBuku/util/sort_helper.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({
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
      mobileBody: ShopMobilePage(
        listType: listType,
        sortBy: sortBy,
        filterModels: filterModels,
        genreId: genreId,
      ),
      tabletBody: ShopMobilePage(
        listType: listType,
        sortBy: sortBy,
        filterModels: filterModels,
        genreId: genreId,
      ),
      desktopBody: ShopMobilePage(
        listType: listType,
        sortBy: sortBy,
        filterModels: filterModels,
        genreId: genreId,
      ),
    );
  }
}
