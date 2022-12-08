import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/domain/model/filter_model.dart';
import 'package:bookstore/domain/model/genre_model.dart';
import 'package:bookstore/domain/model/product_model.dart';
import 'package:bookstore/presentation/pages/favorites/mobile/cubit.dart';
import 'package:bookstore/presentation/pages/favorites/mobile/state.dart';
import 'package:bookstore/presentation/widget/appbar_helper.dart';
import 'package:bookstore/presentation/widget/card_helper.dart';
import 'package:bookstore/presentation/widget/loading_helper.dart';
import 'package:bookstore/presentation/widget/modal_sheet_helper.dart';
import 'package:bookstore/presentation/widget/snackbar_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/list_type_helper.dart';
import 'package:bookstore/util/sort_helper.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FavoritesMobileBody extends StatefulWidget {
  const FavoritesMobileBody({
    super.key,
    this.filterModels = const <FilterModel>[],
    this.sortBy,
    required this.listType,
    this.genreId = '',
  });
  final SortBy? sortBy;
  final List<FilterModel> filterModels;
  final ListType listType;
  final String genreId;

  @override
  State<FavoritesMobileBody> createState() => _FavoritesMobileBodyState();
}

class _FavoritesMobileBodyState extends State<FavoritesMobileBody> {
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    return BlocConsumer<FavoritesMobileCubit, FavoritesMobileState>(
      listener: (context, state) {
        if (state is FavoritesMobileFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: state.message,
            ));
        }

        if (state is FavoritesMobileRefresh) {
          context.goNamed(
            AppRoutes.favorites.name,
            queryParams: state.params,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is FavoritesMobileLoaded || current is FavoritesMobileLoading,
      builder: (context, state) {
        if (state is FavoritesMobileLoaded) {
          return _buildScaffold(context, state);
        }

        return const AppLoadingView();
      },
    );
  }

  Widget _buildScaffold(BuildContext context, FavoritesMobileLoaded state) {
    final FavoritesMobileCubit cubit =
        BlocProvider.of<FavoritesMobileCubit>(context);
    return Scaffold(
      appBar: AppBarHelper(
        height: 234.0.h,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            offset: Offset(
              .0,
              4.0.sp,
            ),
            blurRadius: 12.0.sp,
          ),
        ],
        color: Colors.white,
        child: _buildTopBar(context, state),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: () => cubit.onRefresh(
          onComplete: () {
            _refreshController.refreshCompleted();
          },
          genreId: widget.genreId,
          filterModels: widget.filterModels,
          sortBy: widget.sortBy,
          listType: widget.listType,
        ),
        footer: const ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
        header: const MaterialClassicHeader(
          backgroundColor: AppColor.secondary,
          color: AppColor.neutral,
        ),
        child: widget.listType == ListType.list
            ? _buildListBody(context, state)
            : _buildGridBody(context, state),
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context, FavoritesMobileLoaded state) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search_rounded),
      iconSize: 30.0.sp,
      padding: EdgeInsets.all(12.0.sp),
      constraints: const BoxConstraints(),
    );
  }

  Widget _buildTopBar(BuildContext context, FavoritesMobileLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: _buildSearchButton(context, state),
        ),
        Spacing.vertical(18.0.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.0.w,
          ),
          child: Text(
            'Favorites',
            style: CustomTextStyles.bold.size(
              34.0,
              AppColor.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildTopChips(context, state),
        _buildTopOptions(context, state),
      ],
    );
  }

  Widget _buildTopOptions(BuildContext context, FavoritesMobileLoaded state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildFilterButton(context, state),
        _buildSortButton(context, state),
        _buildListButton(context, state),
      ],
    );
  }

  Widget _buildListButton(BuildContext context, FavoritesMobileLoaded state) {
    final FavoritesMobileCubit cubit =
        BlocProvider.of<FavoritesMobileCubit>(context);
    return IconButton(
      onPressed: () => cubit.refreshPageWithParam(
        listType:
            widget.listType == ListType.list ? ListType.grid : ListType.list,
        filterModels: widget.filterModels,
        genreId: widget.genreId,
        sortBy: widget.sortBy,
      ),
      icon:
          Icon(widget.listType == ListType.list ? Icons.grid_view : Icons.list),
      iconSize: 30.0.sp,
      color: AppColor.black,
      constraints: const BoxConstraints(),
      padding: EdgeInsets.symmetric(
        vertical: 10.0.h,
        horizontal: 16.0.w,
      ),
    );
  }

  Widget _buildSortButton(BuildContext context, FavoritesMobileLoaded state) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(100.0.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(100.0.r),
        onTap: () => showModalBottomSheet<SortBy>(
          useRootNavigator: true,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(34.0.r),
            ),
          ),
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return BottomSortBySheet(
              selectedSort: widget.sortBy,
            );
          },
        ).then((SortBy? value) {
          if (value != null) {
            BlocProvider.of<FavoritesMobileCubit>(context).refreshPageWithParam(
              listType: widget.listType,
              genreId: widget.genreId,
              filterModels: widget.filterModels,
              sortBy: value,
            );
          }
        }),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0.h,
            horizontal: 16.0.w,
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.swap_vert,
                size: 30.0.sp,
                color: AppColor.black,
              ),
              Spacing.horizontal(7.0.sp),
              Text(
                widget.sortBy?.text ?? 'Relevance',
                style: CustomTextStyles.regular.size(
                  11.0,
                  AppColor.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context, FavoritesMobileLoaded state) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(100.0.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(100.0.r),
        onTap: () => showModalBottomSheet<List<FilterModel>>(
          useRootNavigator: true,
          backgroundColor: Colors.white,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return FilterBySheet(
              appliedFilterModels: widget.filterModels,
            );
          },
        ).then((List<FilterModel>? value) {
          if (value == null) return;
          BlocProvider.of<FavoritesMobileCubit>(context).refreshPageWithParam(
            listType: widget.listType,
            genreId: widget.genreId,
            sortBy: widget.sortBy,
            filterModels: value,
          );
        }),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0.h,
            horizontal: 16.0.w,
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.filter_list_rounded,
                size: 30.0.sp,
                color: AppColor.black,
              ),
              Spacing.horizontal(7.0.sp),
              Text(
                'Filters',
                style: CustomTextStyles.regular.size(
                  11.0,
                  AppColor.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopChips(BuildContext context, FavoritesMobileLoaded state) {
    return Container(
      height: 60.0.sp,
      alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: <Widget>[
          Spacing.horizontal(16.0.w),
          for (final GenreModel genreModel in state.genres)
            Padding(
              padding: EdgeInsets.only(
                right: 7.0.w,
              ),
              child: _buildGenreButton(genreModel, state),
            ),
          Spacing.horizontal(9.0.w),
        ],
      ),
    );
  }

  Widget _buildGenreButton(GenreModel model, FavoritesMobileLoaded state) {
    final bool isSelected = state.selectedGenre == model;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.black,
          borderRadius: BorderRadius.circular(100.0.r),
          border: isSelected
              ? null
              : Border.all(
                  color: AppColor.black,
                  width: 1.0.sp,
                ),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100.0.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(100.0.r),
            onTap: isSelected
                ? null
                : () => BlocProvider.of<FavoritesMobileCubit>(context)
                        .refreshPageWithParam(
                      listType: widget.listType,
                      genreId: model.id,
                      sortBy: widget.sortBy,
                      filterModels: widget.filterModels,
                    ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0.h,
                horizontal: 12.0.sp,
              ),
              child: Text(
                model.name,
                style: CustomTextStyles.medium.size(
                  14.0,
                  isSelected ? Colors.white : AppColor.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridBody(BuildContext context, FavoritesMobileLoaded state) {
    final FavoritesMobileCubit cubit =
        BlocProvider.of<FavoritesMobileCubit>(context);
    return GridView.count(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16.0.h,
        horizontal: 17.0.w,
      ),
      mainAxisSpacing: 26.0.h,
      crossAxisSpacing: 16.0.w,
      childAspectRatio: 164 / 260,
      crossAxisCount: 2,
      children: <Widget>[
        for (final ProductModel model in state.products)
          FittedBox(
            child: ProductCard.favorite(
              model: model,
              listType: ListType.grid,
              onProductTap: () => context.goNamed(
                AppRoutes.shopToProduct.name,
                params: <String, String>{
                  'product': model.id,
                },
              ),
              onDeleteButtonTap: () => cubit.removeFromFavorites(
                genres: state.genres,
                products: state.products,
                selectedGenre: state.selectedGenre,
                productModel: model,
              ),
              onCartTap: () => cubit.addToCart(
                productId: model.id,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildListBody(BuildContext context, FavoritesMobileLoaded state) {
    final FavoritesMobileCubit cubit =
        BlocProvider.of<FavoritesMobileCubit>(context);
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 16.0.h,
      ),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: <Widget>[
        for (final ProductModel model in state.products)
          Padding(
            padding: EdgeInsets.only(
              left: 16.0.w,
              right: 16.0.w,
              bottom: 26.0.h,
            ),
            child: ProductCard.favorite(
              model: model,
              listType: ListType.list,
              onProductTap: () => context.goNamed(
                AppRoutes.shopToProduct.name,
                params: <String, String>{
                  'product': model.id,
                },
              ),
              onDeleteButtonTap: () => cubit.removeFromFavorites(
                genres: state.genres,
                products: state.products,
                selectedGenre: state.selectedGenre,
                productModel: model,
              ),
              onCartTap: () => cubit.addToCart(
                productId: model.id,
              ),
            ),
          ),
      ],
    );
  }
}
