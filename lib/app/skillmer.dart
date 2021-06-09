import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/app/theme.dart';
import 'package:skillmer/providers/providers.dart';
import 'package:skillmer/views/login/login.dart';
import 'package:skillmer/views/navigation/navigation.dart';
import 'package:skillmer/views/profile/profile.dart';
import 'package:skillmer/views/profile/profile_settings.dart';

import '../amplifyconfiguration.dart';

class Skillmer extends StatefulWidget {
  @override
  _SkillmerState createState() => _SkillmerState();
}

class _SkillmerState extends State<Skillmer> {
  bool _amplifyConfigured = false;

  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    Amplify.addPlugins([authPlugin]);

    try {
      await Amplify.configure(amplifyconfig);
    } catch (error) {
      print(error);
    }

    setState(() {
      _amplifyConfigured = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skillmer',
      theme: AppTheme.dark(),
      initialRoute: '/',
      home: _amplifyConfigured
          ? Consumer(builder: (context, watch, child) {
              final currentUser = watch(authUserProviderAsync);
              return currentUser.when(data: (data) {
                if (data == '') {
                  return LoginPage();
                }
                return Navigation();
              }, loading: () {
                return Text('Loading');
              }, error: (e, st) {
                return Text('ERROR');
              });
            })
          : Text('Amplify not yet configured'),
      routes: {
        // '/': (context) => Navigation(),
        '/profile': (context) => Profile(),
        '/profile-settings': (context) => ProfileSettings(),
      },
    );
  }
}
