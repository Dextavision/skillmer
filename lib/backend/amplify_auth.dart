import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authAWSRepositoryProvider =
    Provider<AWSAuthRepository>((ref) => AWSAuthRepository());

class AWSAuthRepository {
  // Stream of [User] which will emit the current user when
  // the authentication state changes.
  Future<String> get user async {
    try {
      final awsUser = await Amplify.Auth.getCurrentUser();
      return awsUser.userId;
    } catch (e) {
      print("not signed in");
      return '';
    }
  }

  // Creates a new user with the provided [email] and [password].
  Future<void> signInGoogle() async {
    try {
      await Amplify.Auth.signInWithWebUI(provider: AuthProvider.google);
    } on AmplifyException catch (e) {
      print(e.message);
    }
  }

  // Signs out the current user which will emit
  // [User.empty] from the [user] Stream.
  Future<void> logOut() async {}
}
