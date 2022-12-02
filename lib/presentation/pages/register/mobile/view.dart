import 'package:bookstore/config/constant/assets.dart';
import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/data/service/auth_service_fs.dart';
import 'package:bookstore/presentation/pages/register/mobile/state.dart';
import 'package:bookstore/presentation/widget/appbar_helper.dart';
import 'package:bookstore/presentation/widget/button_helper.dart';
import 'package:bookstore/presentation/widget/form_input_helper.dart';
import 'package:bookstore/presentation/widget/loading_helper.dart';
import 'package:bookstore/presentation/widget/snackbar_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/form_helper.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'cubit.dart';

class RegisterMobilePage extends StatefulWidget {
  const RegisterMobilePage({super.key});

  @override
  State<RegisterMobilePage> createState() => _RegisterMobilePageState();
}

class _RegisterMobilePageState extends State<RegisterMobilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterMobileCubit(
        authServiceFS: Provider.of<AuthServiceFS>(
          context,
          listen: false,
        ),
      ),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBarHelper(
        height: 130.0.h,
        child: _buildTopBar(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildTopBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
          iconSize: 30.0.sp,
          padding: EdgeInsets.all(8.0.sp),
          constraints: const BoxConstraints(),
        ),
        Spacing.vertical(18.0.h),
        Padding(
          padding: EdgeInsets.only(
            left: 14.0.w,
          ),
          child: Text(
            'Sign Up',
            style: CustomTextStyles.bold.size(
              34.0,
              AppColor.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return BlocConsumer<RegisterMobileCubit, RegisterMobileState>(
      buildWhen: (previous, current) =>
          current is! RegisterMobileSuccess &&
          current is! RegisterMobileFailure,
      listener: (context, state) {
        if (state is RegisterMobileSuccess) {
          context.goNamed(AppRoutes.home.name);
        }

        if (state is RegisterMobileFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: state.message,
            ));
        }
      },
      builder: (context, state) {
        if (state is RegisterMobileLoading) return const AppLoadingView();

        if (state is RegisterMobileFormState) {
          return _buildForm(context, state);
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildForm(BuildContext context, RegisterMobileFormState state) {
    final RegisterMobileCubit cubit =
        BlocProvider.of<RegisterMobileCubit>(context);
    cubit.state;
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.w,
        ),
        children: <Widget>[
          Spacing.vertical(12.0.h),
          _buildNameTextField(context, state),
          _buildEmailTextField(context, state),
          _buildPasswordTextField(context, state),
          Spacing.vertical(16.0.h),
          _buildPasswordHint(
            isSatisfied: state.isPasswordEightCharacters,
            hint: 'Contains at least 8 characters',
          ),
          Spacing.vertical(16.0.h),
          _buildPasswordHint(
            isSatisfied: state.hasPasswordOneNumber,
            hint: 'Contains at least 1 number',
          ),
          Spacing.vertical(32.0.h),
          _buildRegisterButton(
            context,
            state.email,
            state.password,
            state.name,
          ),
          Spacing.vertical(20.0.h),
          _buildGoogleRegisterButton(context),
        ],
      ),
    );
  }

  Widget _buildPasswordHint({
    required bool isSatisfied,
    required String hint,
  }) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(
            milliseconds: 500,
          ),
          width: 20.0.sp,
          height: 20.0.sp,
          decoration: BoxDecoration(
              color: isSatisfied ? Colors.green : Colors.transparent,
              border: isSatisfied
                  ? Border.all(color: Colors.transparent)
                  : Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(50.0.r)),
          child: Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 15.0.sp,
            ),
          ),
        ),
        Spacing.horizontal(10.0.w),
        Text(
          hint,
          style: CustomTextStyles.regular.size(18.0),
        )
      ],
    );
  }

  Widget _buildNameTextField(
      BuildContext context, RegisterMobileFormState state) {
    final RegisterMobileCubit cubit =
        BlocProvider.of<RegisterMobileCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0.h,
      ),
      child: AppTextFormField(
        onChanged: (name) => cubit.checkName(name),
        validator: (String? name) {
          if (name == null) return null;
          if (name.isEmpty || name.trim() == '') {
            return 'Name cannot be empty';
          }

          return null;
        },
        autofocus: true,
        errorText: (state.name.trim() == '') ? 'Name cannot be empty' : null,
        hintText: 'Mr. example',
        label: 'Name',
        suffixIcon: state.name.trim() == ''
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
    );
  }

  Widget _buildEmailTextField(
    BuildContext context,
    RegisterMobileFormState state,
  ) {
    final RegisterMobileCubit cubit =
        BlocProvider.of<RegisterMobileCubit>(context);
    return AppTextFormField(
      onChanged: (email) => cubit.checkEmail(email),
      validator: (String? value) => FormValidator.validateEmail(value ?? '')
          ? null
          : 'Invalid email address',
      errorText: state.emailErr ? 'Invalid email address' : null,
      hintText: 'example@mail.com',
      label: 'Email',
      suffixIcon: state.emailErr
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
    );
  }

  Widget _buildPasswordTextField(
      BuildContext context, RegisterMobileFormState state) {
    final RegisterMobileCubit cubit =
        BlocProvider.of<RegisterMobileCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0.h,
      ),
      child: AppTextFormField(
        onChanged: (password) => cubit.checkPassword(password),
        validator: (String? password) {
          if (password == null) return null;
          final RegExp numericRegex = RegExp(r'[0-9]');

          if (password.length < 8) {
            return 'Password needs to have 8 or more characters';
          }

          if (!numericRegex.hasMatch(password)) {
            return 'Password needs to have at least one number';
          }

          return null;
        },
        errorText:
            !(state.hasPasswordOneNumber && state.isPasswordEightCharacters)
                ? 'Invalid password'
                : null,
        hintText: 'Password123',
        label: 'Password',
        obscureText: !(state).isVisible,
        suffixIcon: IconButton(
          iconSize: 20.0.sp,
          onPressed: () => cubit.toggleVisible(),
          icon: state.isVisible
              ? const Icon(
                  Icons.visibility,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton(
    BuildContext context,
    String email,
    String password,
    String name,
  ) {
    return SizedBox(
      width: 343.0.w,
      child: AppButton(
        text: 'SIGN UP',
        padding: 34.0.h,
        textStyle: CustomTextStyles.regular.size(
          14.0,
          Colors.white,
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            BlocProvider.of<RegisterMobileCubit>(context)
                .registerWithEmailAndPassword(
              name: name,
              email: email,
              password: password,
            );
          }
        },
      ),
    );
  }

  Widget _buildGoogleRegisterButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Or sign up with social account',
          style: CustomTextStyles.regular.size(14.0),
        ),
        Spacing.vertical(12.0.h),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0.r),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 8.0.sp,
                  offset: Offset(
                    .0,
                    1.0.sp,
                  ),
                ),
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => BlocProvider.of<RegisterMobileCubit>(context)
                  .loginWithGoogle(),
              borderRadius: BorderRadius.circular(24.0.r),
              child: Container(
                width: 92.0.sp,
                height: 64.0.sp,
                alignment: Alignment.center,
                color: Colors.transparent,
                child: Image.asset(
                  AppAssets.google,
                  width: 24.0.sp,
                  height: 24.0.sp,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Spacing.vertical(47.0.h),
      ],
    );
  }
}
