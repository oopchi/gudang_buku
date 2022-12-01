import 'package:bookstore/domain/model/event_model.dart';
import 'package:bookstore/presentation/widget/button_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventBanner extends StatelessWidget {
  const EventBanner({
    super.key,
    required this.eventModel,
    this.onNavigateTap,
  });

  final VoidCallback? onNavigateTap;
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          eventModel.imageUrl,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 32.0.h,
          left: 10.0.w,
          child: _buildContent(),
        ),
      ],
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
            child: Text(
              eventModel.name,
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 48.0.sp,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Spacing.vertical(18.0.h),
        _buildButton(),
      ],
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: 160.0.w,
      child: AppButton(
        onPressed: onNavigateTap,
        text: 'Check',
        padding: 12.0,
        textStyle: const TextStyle(
          fontFamily: 'Metropolis',
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
