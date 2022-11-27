import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/presentation/pages/home/mobile/cubit.dart';
import 'package:bookstore/presentation/pages/home/mobile/state.dart';
import 'package:bookstore/presentation/widget/sliver_appbar_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMobileHeader extends StatelessWidget {
  const HomeMobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeMobileLoaded state =
        BlocProvider.of<HomeMobileCubit>(context).state as HomeMobileLoaded;
    return SliverPersistentHeader(
      delegate: SliverAppBarDelegate(
        height: 102.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome back, ${state.userResponse.name ?? 'user'}!',
                style: CustomTextStyles.textBase.regular.copyWith(
                  color: AppColor.body,
                ),
              ),
              const Spacing.vertical(2.0),
              Text(
                'What do you want to\nread today?',
                style: CustomTextStyles.textXl.regular.copyWith(
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
