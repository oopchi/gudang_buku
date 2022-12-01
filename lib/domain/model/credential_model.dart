import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class CredentialModel {
  const CredentialModel({
    required this.providerId,
    required this.signInMethod,
    this.token,
    this.accessToken,
  });

  @HiveField(0)

  /// The authentication provider ID for the credential. For example,
  /// 'facebook.com', or 'google.com'.
  final String providerId;

  @HiveField(1)

  /// The authentication sign in method for the credential. For example,
  /// 'password', or 'emailLink'. This corresponds to the sign-in method
  /// identifier returned in [fetchSignInMethodsForEmail].
  final String signInMethod;

  @HiveField(2)

  /// A token used to identify the AuthCredential on native platforms.
  final int? token;

  @HiveField(3)

  /// The OAuth access token associated with the credential if it belongs to an
  /// OAuth provider, such as `facebook.com`, `twitter.com`, etc.
  /// Using the OAuth access token, you can call the provider's API.
  final String? accessToken;

  AuthCredential toAuthCredential() {
    return AuthCredential(
      providerId: providerId,
      signInMethod: signInMethod,
      accessToken: accessToken,
      token: token,
    );
  }

  static CredentialModel fromAuthCredential(AuthCredential credential) {
    return CredentialModel(
      providerId: credential.providerId,
      signInMethod: credential.signInMethod,
      accessToken: credential.accessToken,
      token: credential.token,
    );
  }
}
