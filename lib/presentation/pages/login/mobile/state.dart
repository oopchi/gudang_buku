import 'package:equatable/equatable.dart';

class LoginMobileState extends Equatable {
  const LoginMobileState();

  LoginMobileState init() {
    return const LoginMobileState();
  }

  LoginMobileState clone() {
    return const LoginMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class LoginMobileFailure extends LoginMobileState {
  const LoginMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[
        message,
      ];
}

class LoginMobileLoading extends LoginMobileState {
  const LoginMobileLoading();
  @override
  List<Object?> get props => <Object?>[];
}

class LoginMobileSuccess extends LoginMobileState {}

class LoginMobileFormState extends LoginMobileState {
  const LoginMobileFormState({
    this.email = '',
    this.password = '',
    this.emailErr = false,
    this.isPasswordEightCharacters = false,
    this.hasPasswordOneNumber = false,
    this.isVisible = false,
  });

  final String email;
  final String password;

  final bool emailErr;

  final bool isVisible;
  final bool isPasswordEightCharacters;
  final bool hasPasswordOneNumber;

  @override
  List<Object?> get props => <Object?>[
        emailErr,
        isVisible,
        isPasswordEightCharacters,
        email,
        password,
        hasPasswordOneNumber,
      ];

  LoginMobileFormState copyWith({
    String? email,
    String? password,
    bool? emailErr,
    bool? isVisible,
    bool? isPasswordEightCharacters,
    bool? hasPasswordOneNumber,
  }) {
    return LoginMobileFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailErr: emailErr ?? this.emailErr,
      isVisible: isVisible ?? this.isVisible,
      isPasswordEightCharacters:
          isPasswordEightCharacters ?? this.isPasswordEightCharacters,
      hasPasswordOneNumber: hasPasswordOneNumber ?? this.hasPasswordOneNumber,
    );
  }
}
