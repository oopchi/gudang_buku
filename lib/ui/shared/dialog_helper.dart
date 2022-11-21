import 'package:flutter/material.dart';
import 'package:bookstore/ui/shared/spacing.dart';
import 'package:bookstore/utils/text_helper.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({
    super.key,
    required this.onConfirm,
    this.subTitle,
    this.onCancel,
  });

  final String? subTitle;
  final VoidCallback? onCancel;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.0),
                  topRight: Radius.circular(6.0),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(
                24.0,
                24.0,
                24.0,
                16.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Icons.warning,
                    size: 24.0,
                    color: Colors.red,
                  ),
                  const Spacing.horizontal(8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Oops!',
                          style: CustomTextStyle.textXl.semiBold,
                        ),
                        if (subTitle != null && subTitle != '') ...<Widget>[
                          const Spacing.vertical(8.0),
                          Text(
                            subTitle!,
                            style: CustomTextStyle.textSm.regular.copyWith(
                              color: Colors.grey,
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
              constraints: const BoxConstraints(
                minWidth: 85.0,
                minHeight: 32.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(.12),
                    blurRadius: 2.0,
                    offset: const Offset(
                      .0,
                      1.0,
                    ),
                  ),
                ],
              ),
              child: Material(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(6.0),
                  onTap: onConfirm,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: CustomTextStyle.textLg.medium.copyWith(
                          color: Colors.white,
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
