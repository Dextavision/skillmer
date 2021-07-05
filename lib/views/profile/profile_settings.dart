import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skillmer/model/api/api.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/views/profile/widgets/settings_textfield.dart';
import 'package:http/http.dart' as http;

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  void uploadProfileImage() async {
    // Get presigned URL to upload File directly to S3
    http.Response presignedURL = await http.post(
      Uri.parse(
        API_URL,
      ),
    );

    String presignedURLResponse = presignedURL.body;
    Map<String, dynamic> presignedURLObject = jsonDecode(presignedURLResponse);
    UploadObject uploadObject = UploadObject.fromJson(presignedURLObject);
    print(uploadObject.path);

    // Load Asset File for testing purpose, later Image Picker
    File f = await getImageFileFromAssets('images/dany_profile.png');

    // Upload directly to S3
    await http.put(Uri.parse(uploadObject.path), body: await f.readAsBytes());
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = await File('${(await getTemporaryDirectory()).path}/$path')
        .create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Profile Settings",
                      style: profileText,
                    ),
                  ),
                  flex: 3,
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  child: Icon(
                    Icons.account_circle_sharp,
                    size: 110.0,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: accentColor,
                  ),
                  onPressed: () {
                    // TODO: Pick Image
                    // TODO: Upload Profile Image
                    uploadProfileImage();
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

class UploadObject {
  final String path;
  final String imageName;

  UploadObject(this.path, this.imageName);

  UploadObject.fromJson(Map<String, dynamic> json)
      : path = json['uploadURL'],
        imageName = json['imageName'];

  Map<String, dynamic> toJson() => {
        'uploadURL': path,
        'imageName': imageName,
      };
}
