import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/shared/models/user_model.dart';
import 'package:skillmer/view_model/providers/user_provider.dart';
import 'package:skillmer/views/profile/widgets/settings_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: 110.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        user.profileImage,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: accentColor,
                  ),
                  onPressed: () {
                    // TODO: Pick Image
                    context
                        .read(userProviderAsync.notifier)
                        .uploadUserProfileImage();
                  },
                ),
              ],
            ),
            SettingTextfield(
              textLabel: "Name",
              textValue: "Dextavision",
              isMultiline: false,
            ),
            SettingTextfield(
              textLabel: "Favourite Games",
              textValue: "Hearthstone, CoD, Final Fantasy",
              isMultiline: true,
            ),
            SettingTextfield(
              textLabel: "Followed Hashtags",
              textValue: "multiplayer, ps5, fps, mobile",
              isMultiline: true,
            ),
            SizedBox(
              height: 50.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: <Color>[
                            accentColor,
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
