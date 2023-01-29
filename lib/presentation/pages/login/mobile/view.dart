import 'package:gudang_buku/config/constant/assets.dart';
import 'package:gudang_buku/config/constant/colors.dart';
import 'package:gudang_buku/config/constant/routes.dart';
import 'package:gudang_buku/service/auth_service_impl.dart';
import 'package:gudang_buku/presentation/pages/login/mobile/state.dart';
import 'package:gudang_buku/presentation/widget/appbar_helper.dart';
import 'package:gudang_buku/presentation/widget/button_helper.dart';
import 'package:gudang_buku/presentation/widget/form_input_helper.dart';
import 'package:gudang_buku/presentation/widget/loading_helper.dart';
import 'package:gudang_buku/presentation/widget/snackbar_helper.dart';
import 'package:gudang_buku/presentation/widget/spacing.dart';
import 'package:gudang_buku/util/form_helper.dart';
import 'package:gudang_buku/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'cubit.dart';

class LoginMobilePage extends StatefulWidget {
  const LoginMobilePage({super.key});

  @override
  State<LoginMobilePage> createState() => _LoginMobilePageState();
}

class _LoginMobilePageState extends State<LoginMobilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginMobileCubit(
        authService: Provider.of<AuthServiceImpl>(
          context,
          listen: false,
        ),
      ),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocConsumer<LoginMobileCubit, LoginMobileState>(
      buildWhen: (previous, current) =>
          current is! LoginMobileSuccess && current is! LoginMobileFailure,
      listener: (context, state) {
        if (state is LoginMobileSuccess) {
          context.goNamed(AppRoutes.home.name);
        }

        if (state is LoginMobileFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: state.message,
            ));
        }
      },
      builder: (context, state) {
        if (state is LoginMobileLoading) return const AppLoadingView();

        if (state is LoginMobileFormState) {
          return Scaffold(
            appBar: AppBarHelper(
              height: 130.0.h,
              child: _buildTopBar(),
            ),
            body: _buildForm(context, state),
          );
        }

        return const SizedBox.shrink();
      },
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
            'Login',
            style: CustomTextStyles.bold.size(
              34.0,
              AppColor.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context, LoginMobileFormState state) {
    final LoginMobileCubit cubit = BlocProvider.of<LoginMobileCubit>(context);
    cubit.state;
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.w,
        ),
        children: <Widget>[
          Spacing.vertical(73.0.h),
          _buildEmailTextField(context, state),
          _buildPasswordTextField(context, state),
          _buildForgotButton(context),
          Spacing.vertical(32.0.h),
          _buildLoginButton(
            context,
            state.email,
            state.password,
          ),
          Spacing.vertical(20.0.h),
          _buildGoogleLoginButton(context),
          Spacing.vertical(20.0.h),
          _buildSignUpButton(context),
        ],
      ),
    );
  }

  Widget _buildEmailTextField(
    BuildContext context,
    LoginMobileFormState state,
  ) {
    final LoginMobileCubit cubit = BlocProvider.of<LoginMobileCubit>(context);
    return AppTextFormField(
      onChanged: (email) => cubit.checkEmail(email),
      validator: (String? value) => FormValidator.validateEmail(value ?? '')
          ? null
          : 'Invalid email address',
      autofocus: true,
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
      BuildContext context, LoginMobileFormState state) {
    final LoginMobileCubit cubit = BlocProvider.of<LoginMobileCubit>(context);
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

  Widget _buildSignUpButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            context.goNamed(AppRoutes.landingPageToSignUp.name);
          },
          child: Center(
            child: Text(
              'Don\'t have an account?',
              style: CustomTextStyles.medium.size(14.0, AppColor.red).copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () => context.goNamed(AppRoutes.loginToForgotPassword.name),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Forgot your password?',
                style: CustomTextStyles.medium.size(14.0),
              ),
              Spacing.horizontal(3.0.w),
              Icon(
                Icons.arrow_right_alt,
                size: 24.0.sp,
                color: AppColor.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(
    BuildContext context,
    String email,
    String password,
  ) {
    return SizedBox(
      width: 343.0.w,
      child: AppButton(
        text: 'LOGIN',
        padding: 34.0.h,
        textStyle: CustomTextStyles.regular.size(
          14.0,
          Colors.white,
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            BlocProvider.of<LoginMobileCubit>(context)
                .loginWithEmailAndPassword(
              email: email,
              password: password,
            );
          }
        },
      ),
    );
  }

  Widget _buildGoogleLoginButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Or login with social account',
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
              onTap: () =>
                  BlocProvider.of<LoginMobileCubit>(context).loginWithGoogle(),
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
      ],
    );
  }
}
