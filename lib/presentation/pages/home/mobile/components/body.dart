import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/presentation/bloc/profile/cubit.dart';
import 'package:bookstore/presentation/bloc/profile/state.dart';
import 'package:bookstore/presentation/pages/home/mobile/cubit.dart';
import 'package:bookstore/presentation/widget/sliver_appbar_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            SliverPersistentHeader(
              delegate: SliverAppBarDelegate(
                height: 102.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoaded) {
                            return Text(
                              'Welcome back, ${state.user.name ?? 'user'}!',
                              style: CustomTextStyles.textBase.regular.copyWith(
                                color: AppColor.body,
                              ),
                            );
                          }

                          return const SizedBox.shrink();
                        },
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
            ),
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                toolbarHeight: 83.0,
                backgroundColor: AppColor.background,
                flexibleSpace: _buildSearchBar(),
              ),
            ),
          ],
          body: Builder(
            builder: (context) {
              return CustomScrollView(
                key: const PageStorageKey<String>('HomeViewCustomScrollView'),
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverToBoxAdapter(
                    child: _buildMainContent(),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(
                      top: 102.0,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          bottom: .0,
          left: .0,
          right: .0,
          child: _buildBottomNavBar(),
        ),
      ],
    );
  }
}
