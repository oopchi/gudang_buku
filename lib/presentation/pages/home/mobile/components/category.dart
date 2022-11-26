import 'package:bookstore/domain/model/genre_response.dart';
import 'package:bookstore/presentation/bloc/genre/cubit.dart';
import 'package:bookstore/presentation/bloc/genre/state.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMobileCategory extends StatefulWidget {
  const HomeMobileCategory({super.key});

  @override
  State<HomeMobileCategory> createState() => _HomeMobileCategoryState();
}

class _HomeMobileCategoryState extends State<HomeMobileCategory>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final List<GenreResponse> _genres;

  @override
  void initState() {
    super.initState();

    _genres =
        (BlocProvider.of<GenreCubit>(context).state as GenreLoaded).genres;

    _tabController = TabController(
      length: _genres.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TabBar(
          controller: _tabController,
          tabs: <Widget>[
            for (int i = 0; i < _genres.length; i++) const SizedBox.shrink(),
          ],
        ),
        const Spacing.vertical(35.0),
        // PageView.builder(itemBuilder: itemBuilder),
      ],
    );
  }
}
