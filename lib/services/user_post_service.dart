import 'package:mysql1/mysql1.dart';
import 'package:skillmer/backend/database.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

class UserPostService {
  late MySqlConnection _conn;

  List<UserPost> _userPosts = [];

  List<UserPost> getUserPosts() {
    return _userPosts;
  }

  Future<void> connectDatabase() async {
    _conn = await Database.connectDatabase();
  }

  void loadUserPosts() async {
    final userPost = await _conn.query('select * from Post;');
    print(userPost);
    // this.userPosts = new UserPost(username: userPost.fields, avatar: avatar, textPost: )
  }

  void addUserPost(String postText) async {
    // TODO: UserService getting Name and ID of current User
    await connectDatabase();
    await _conn.query(
      'INSERT INTO POST (user_id,likes,post_text) VALUES (1,0,?);',
      [postText],
    );
  }
}
