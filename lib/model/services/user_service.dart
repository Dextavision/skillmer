import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skillmer/model/api/api.dart';
import 'package:skillmer/shared/models/presigned_object.dart';
import 'package:skillmer/shared/models/user_model.dart';
import 'package:http/http.dart' as http;

final userProvider = Provider<UserService>((ref) => UserService());

class UserService {
  Future<User> loadUser(MySqlConnection conn) async {
    final query = await conn.query('select * from User;');

    // ? Testing with Dummy Data
    User user = User(
      id: 1,
      profileImage:
          'https://d2kwbumlh5wa1i.cloudfront.net/190d0995-7479-4f52-badc-0b8483a4a09b.png',
      rank: 'Noob',
      username: 'Dextavision',
      followersCount: 70,
      followingCount: 32,
      postsCount: 1337,
    );

    return user;
  }

  Future<String> uploadProfileImage() async {
    // Get presigned URL to upload File directly to S3
    http.Response presignedURL = await http.post(
      Uri.parse(
        API_URL,
      ),
    );

    String presignedURLResponse = presignedURL.body;
    Map<String, dynamic> presignedURLObject = jsonDecode(presignedURLResponse);
    PresignedObject uploadObject = PresignedObject.fromJson(presignedURLObject);

    // Load Asset File for testing purpose, later Image Picker
    File f = await _getImageFileFromAssets('images/dany_profile.png');

    // Upload directly to S3
    await http.put(
      Uri.parse(uploadObject.path),
      body: await f.readAsBytes(),
    );

    return ('CLOUDFRONT_DOMAIN / uploadObject.imageName');
  }

  Future<void> updateUserProfileImage(
      MySqlConnection conn, int userID, String profileImageURL) async {
    await conn.query(
      'UPDATE User SET profileImage = ? WHERE user_id = ?;',
      [profileImageURL, userID],
    );
    // TODO: Implement Utility get User Method and update User in Provider
  }

  // #################
  // UTILITY FUNCTIONS
  // #################
  Future<File> _getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = await File('${(await getTemporaryDirectory()).path}/$path')
        .create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}
