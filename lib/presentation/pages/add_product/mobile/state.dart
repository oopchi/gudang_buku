import 'package:equatable/equatable.dart';

class AddProductMobileState extends Equatable {
  const AddProductMobileState();

  AddProductMobileState init() {
    return const AddProductMobileState();
  }

  AddProductMobileState clone() {
    return const AddProductMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class AddProductMobileFailure extends AddProductMobileState {
  const AddProductMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[
        message,
      ];
}

class AddProductMobileLoading extends AddProductMobileState {
  const AddProductMobileLoading();
  @override
  List<Object?> get props => <Object?>[];
}

class AddProductMobileSuccess extends AddProductMobileState {}

class AddProductMobileFormState extends AddProductMobileState {
  const AddProductMobileFormState({
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

  AddProductMobileFormState copyWith({
    String? email,
    String? password,
    bool? emailErr,
    bool? isVisible,
    bool? isPasswordEightCharacters,
    bool? hasPasswordOneNumber,
  }) {
    return AddProductMobileFormState(
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
