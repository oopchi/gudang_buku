import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/presentation/pages/home/mobile/cubit.dart';
import 'package:bookstore/presentation/pages/home/mobile/state.dart';
import 'package:bookstore/presentation/widget/sliver_appbar_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMobileHeader extends StatelessWidget {
  const HomeMobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeMobileLoaded state =
        BlocProvider.of<HomeMobileCubit>(context).state as HomeMobileLoaded;

    return SizedBox(
      height: 536.0.h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            'https://media-exp1.licdn.com/dms/image/C5603AQFOaLIqjT_MHg/profile-displayphoto-shrink_200_200/0/1635511557109?e=1674691200&v=beta&t=Sn9pI4Y2rtSmuuJroZPVQkfiI9K3N2P1DyJ9im-tD1I',
          ),
          Positioned(
            bottom: 32.0.h,
            left: 10.0.w,
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 5.0.w,
          ),
          child: SizedBox(
            width: 190.0.w,
            height: 96.0.h,
          ),
        ),
        Spacing.vertical(18.0.h),
      ],
    );
  }
}
