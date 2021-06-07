import 'package:flutter/material.dart';
import 'package:skillmer/backend/amplify_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/providers/providers.dart';

class LoginPage extends StatelessWidget {
  void login(BuildContext context) async {
    final authAWS = context.read(authAWSRepositoryProvider);
    await authAWS.signInGoogle();
    context.refresh(authUserProviderAsync);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text('Login'),
        onPressed: () {
          login(context);
        },
      ),
    );
  }
}
