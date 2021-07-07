import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:skillmer/shared/models/user_model.dart';

final userProvider = Provider<UserService>((ref) => UserService());

class UserService {
  Future<User> loadUser(MySqlConnection conn) async {
    final userQuery = await conn.query('select * from User;');

    // ? Testing with Dummy Data
    User user = User(
      id: 1,
      avatar: 'test',
      rank: 'noob',
      username: 'Dextavision',
      followersCount: 70,
      followingCount: 32,
      postsCount: 1337,
    );

    return user;
  }
}
