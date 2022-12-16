import 'package:gudang_buku/config/constant/colors.dart';
import 'package:gudang_buku/config/constant/dimensions.dart';
import 'package:gudang_buku/config/constant/routes.dart';
import 'package:gudang_buku/domain/model/promo_model.dart';
import 'package:gudang_buku/presentation/pages/home/mobile/components/header.dart';
import 'package:gudang_buku/presentation/pages/home/mobile/components/section.dart';
import 'package:gudang_buku/presentation/pages/home/mobile/cubit.dart';
import 'package:gudang_buku/presentation/pages/home/mobile/state.dart';
import 'package:gudang_buku/presentation/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeMobileBody extends StatefulWidget {
  const HomeMobileBody({super.key});

  @override
  State<HomeMobileBody> createState() => _HomeMobileBodyState();
}

class _HomeMobileBodyState extends State<HomeMobileBody> {
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeMobileCubit cubit = BlocProvider.of<HomeMobileCubit>(context);
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: () => cubit.onRefresh(
        onComplete: () {
          _refreshController.refreshCompleted();
        },
      ),
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
      ),
      header: const MaterialClassicHeader(
        backgroundColor: AppColor.secondary,
        color: AppColor.neutral,
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: <Widget>[
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HomeMobileCubit, HomeMobileState>(
      buildWhen: (previous, current) => current is HomeMobileLoaded,
      builder: (context, state) {
        if (state is HomeMobileLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const HomeMobileHeader(),
              Spacing.vertical(15.0.h),
              for (final PromoModel promo in state.promos)
                HomeMobileSection(
                  title: promo.title,
                  subtitle: promo.description,
                  onViewAllTap: () => context.goNamed(
                    AppRoutes.homeToShop.name,
                    queryParams: <String, dynamic>{
                      'promoId': promo.id,
                    },
                  ),
                  models: promo.productCardModels,
                ),
              Spacing.vertical(15.0.h),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
