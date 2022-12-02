import 'package:equatable/equatable.dart';

class RegisterMobileState extends Equatable {
  const RegisterMobileState();

  RegisterMobileState init() {
    return const RegisterMobileState();
  }

  RegisterMobileState clone() {
    return const RegisterMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class RegisterMobileFailure extends RegisterMobileState {
  const RegisterMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[
        message,
      ];
}

class RegisterMobileLoading extends RegisterMobileState {
  const RegisterMobileLoading();
  @override
  List<Object?> get props => <Object?>[];
}

class RegisterMobileSuccess extends RegisterMobileState {}

class RegisterMobileFormState extends RegisterMobileState {
  const RegisterMobileFormState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.emailErr = false,
    this.isPasswordEightCharacters = false,
    this.hasPasswordOneNumber = false,
    this.isVisible = false,
  });

  final String name;
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
        name,
        hasPasswordOneNumber,
      ];

  RegisterMobileFormState copyWith({
    String? name,
    String? email,
    String? password,
    bool? emailErr,
    bool? isVisible,
    bool? isPasswordEightCharacters,
    bool? hasPasswordOneNumber,
  }) {
    return RegisterMobileFormState(
      name: name ?? this.name,
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
