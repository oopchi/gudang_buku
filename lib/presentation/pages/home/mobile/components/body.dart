import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/domain/model/promo_model.dart';
import 'package:bookstore/presentation/pages/home/mobile/components/header.dart';
import 'package:bookstore/presentation/pages/home/mobile/components/section.dart';
import 'package:bookstore/presentation/pages/home/mobile/cubit.dart';
import 'package:bookstore/presentation/pages/home/mobile/state.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeMobileBody extends StatelessWidget {
  const HomeMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: _buildBody(),
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
