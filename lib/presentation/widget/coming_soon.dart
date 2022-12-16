import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang_buku/config/constant/colors.dart';
import 'package:gudang_buku/config/constant/routes.dart';
import 'package:gudang_buku/domain/controller/newsletter_controller.dart';
import 'package:gudang_buku/presentation/widget/button_helper.dart';
import 'package:gudang_buku/presentation/widget/form_input_helper.dart';
import 'package:gudang_buku/presentation/widget/snackbar_helper.dart';
import 'package:gudang_buku/presentation/widget/spacing.dart';
import 'package:gudang_buku/util/form_helper.dart';
import 'package:gudang_buku/util/text_helper.dart';
import 'package:provider/provider.dart';

class ComingSoonView extends StatefulWidget {
  const ComingSoonView({super.key});

  @override
  State<ComingSoonView> createState() => _ComingSoonViewState();
}

class _ComingSoonViewState extends State<ComingSoonView> {
  final TextEditingController _textEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isErr = true;

  void _addEmailToDatabase() => Provider.of<NewsletterController>(
        context,
        listen: false,
      )
          .addNewsletterSubscriber(
            email: _textEditingController.text,
          )
          .then((value) => ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: 'Thank you! We will reach to you soon.',
              backgroundColor: Colors.green,
            )));

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hey!',
              style: CustomTextStyles.black.size(40.0),
              textAlign: TextAlign.center,
            ),
            Spacing.vertical(8.0.sp),
            Text(
              'We are cooking it up...',
              style: CustomTextStyles.black.size(40.0),
              textAlign: TextAlign.center,
            ),
            Spacing.vertical(12.0.sp),
            Text(
              'We are just a few days from our big launch. Sign up to be notified!',
              style: CustomTextStyles.regular.size(12.0),
              textAlign: TextAlign.center,
            ),
            Spacing.vertical(30.0.sp),
            AppTextFormField(
              controller: _textEditingController,
              onChanged: (value) {
                setState(() {
                  _isErr = !FormValidator.validateEmail(value);
                });
              },
              label: 'Email',
              hintText: 'Enter your email',
              validator: (String? value) =>
                  FormValidator.validateEmail(value ?? '')
                      ? null
                      : 'Invalid email address',
              suffixIcon: _isErr
                  ? Icon(
                      Icons.warning,
                      size: 24.0.sp,
                      color: AppColor.error,
                    )
                  : Icon(
                      Icons.check,
                      size: 24.0.sp,
                      color: Colors.green,
                    ),
            ),
            Spacing.vertical(15.0.sp),
            AppButton(
              text: 'NOTIFY ME',
              textStyle: CustomTextStyles.medium.size(
                30.0.sp,
                Colors.white,
              ),
              width: 200.0.sp,
              height: 54.0.sp,
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  _addEmailToDatabase();
                } else {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        AppSnackBar(content: 'Invalid email address'));
                }
              },
            ),
            Spacing.vertical(10.0.sp),
            AppOutlineButton(
              text: 'GO HOME',
              textStyle: CustomTextStyles.regular.size(24.0.sp),
              width: 100.0.sp,
              height: 40.0.sp,
              onPressed: () {
                context.goNamed(AppRoutes.home.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
