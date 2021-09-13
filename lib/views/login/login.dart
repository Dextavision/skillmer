import 'package:flutter/material.dart';
import 'package:skillmer/model/services/amplify_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/view_model/providers/authentication_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void login(BuildContext context) async {
    final authAWS = context.read(authAWSRepositoryProvider);
    await authAWS.signInGoogle();
    context.refresh(authUserProviderAsync);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Login'),
      onPressed: () {
        login(context);
      },
    );
  }
}
