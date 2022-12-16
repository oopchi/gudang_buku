import 'package:gudang_buku/domain/model/event_model.dart';
import 'package:gudang_buku/presentation/pages/home/mobile/cubit.dart';
import 'package:gudang_buku/presentation/pages/home/mobile/state.dart';
import 'package:gudang_buku/presentation/widget/event_banner.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMobileHeader extends StatelessWidget {
  const HomeMobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeMobileLoaded state =
        BlocProvider.of<HomeMobileCubit>(context).state as HomeMobileLoaded;

    return CarouselSlider(
      items: <Widget>[
        for (final EventModel eventModel in state.events)
          EventBanner(
            eventModel: eventModel,
          ),
      ],
      options: CarouselOptions(
        padEnds: false,
        aspectRatio: 376.0.w / 536.0.h,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 2,
        ),
      ),
    );
  }
}
