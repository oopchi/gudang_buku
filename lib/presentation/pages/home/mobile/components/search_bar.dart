import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/config/constant/text_styles.dart';
import 'package:flutter/material.dart';

class HomeMobileSearchBar extends StatelessWidget {
  const HomeMobileSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        automaticallyImplyLeading: false,
        pinned: true,
        toolbarHeight: 83.0,
        backgroundColor: AppColor.background,
        flexibleSpace: _buildSearchBar(),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Search',
        hintStyle: AppTextStyles.textBase.thin.copyWith(
          color: AppColor.accent,
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 16.0,
          color: AppColor.accent,
        ),
        fillColor: AppColor.accent.withOpacity(.15),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 13.0,
          horizontal: 16.0,
        ),
      ),
      style: AppTextStyles.textBase.thin.copyWith(
        color: AppColor.primary,
      ),
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.search,
    );
  }
}
