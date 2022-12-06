import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/domain/model/event_model.dart';
import 'package:bookstore/presentation/widget/button_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventBanner extends StatefulWidget {
  const EventBanner({
    super.key,
    required this.eventModel,
    this.onNavigateTap,
  });

  final VoidCallback? onNavigateTap;
  final EventModel eventModel;

  @override
  State<EventBanner> createState() => _EventBannerState();
}

class _EventBannerState extends State<EventBanner> {
  late final UniqueKey _uniqueKey;

  late String _url;

  void _reloadImage() {
    setState(() {
      _url =
          '${_url.split('?r')[0]}?r=${DateTime.now().millisecondsSinceEpoch}';
    });
  }

  @override
  void initState() {
    super.initState();
    _uniqueKey = UniqueKey();
    _url = widget.eventModel.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          key: _uniqueKey,
          _url,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress?.expectedTotalBytes ==
                loadingProgress?.cumulativeBytesLoaded) {
              return child;
            }

            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.red,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Center(
            child: Material(
              child: IconButton(
                onPressed: _reloadImage,
                icon: const Icon(
                  Icons.refresh_rounded,
                ),
                iconSize: 40.0.sp,
                color: AppColor.error,
                padding: EdgeInsets.all(8.0.sp),
                constraints: const BoxConstraints(),
                visualDensity: const VisualDensity(
                  horizontal: -4.0,
                  vertical: -4.0,
                ),
              ),
            ),
          ),
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
              widget.eventModel.name,
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
        onPressed: widget.onNavigateTap,
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
