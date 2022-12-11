import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<T?> showAppDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required Widget child,
  Color barrierColor = Colors.white,
}) {
  if (barrierColor == Colors.white) {
    barrierColor = barrierColor.withAlpha(116);
  }

  return showGeneralDialog(
    context: context,
    pageBuilder: (_, __, ___) {
      return SafeArea(
        child: KeyboardAvoiding(
          child: child,
        ),
      );
    },
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 150),
    useRootNavigator: true,
  );
}

/// Avoid keyboard covering dialog when focusing on text field
/// Taken from https://github.com/flutter/flutter/issues/7032#issuecomment-459136584
class KeyboardAvoiding extends StatelessWidget {
  const KeyboardAvoiding({
    Key? key,
    this.child,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 200),
    this.kFactor = 1.0,
  }) : super(key: key);

  final Widget? child;
  final Curve curve;
  final Duration duration;
  final double kFactor;

  @override
  Widget build(BuildContext context) {
    final double verticalOffset =
        MediaQuery.of(context).viewInsets.bottom * -kFactor;

    return AnimatedContainer(
      duration: duration,
      curve: curve,
      transform: Matrix4.translationValues(
        0.0,
        verticalOffset,
        0.0,
      ),
      child: child,
    );
  }
}

class AppConfirmationDialog extends StatelessWidget {
  const AppConfirmationDialog({
    super.key,
    this.title = 'Are you sure?',
    this.subTitle,
  });

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0.r),
        ),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(6.0.r),
                ),
              ),
              padding: EdgeInsets.fromLTRB(
                24.0.sp,
                24.0.sp,
                24.0.sp,
                16.0.sp,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.warning,
                    size: 24.0.sp,
                    color: Colors.red,
                  ),
                  Spacing.horizontal(8.0.sp),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: CustomTextStyles.semiBold.size(24.0),
                        ),
                        if (subTitle != null && subTitle != '') ...<Widget>[
                          Spacing.vertical(8.0.sp),
                          Text(
                            subTitle!,
                            style: CustomTextStyles.regular.size(
                              16.0,
                              Colors.grey,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                minWidth: 85.0.sp,
                minHeight: 32.0.sp,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0.r),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(.12),
                    blurRadius: 2.0.sp,
                    offset: Offset(
                      .0,
                      1.0.sp,
                    ),
                  ),
                ],
              ),
              child: Material(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0.r),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(6.0.r),
                  onTap: () =>
                      Navigator.of(context, rootNavigator: true).pop(true),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0.sp,
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: CustomTextStyles.medium.size(
                          14.0,
                          Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
