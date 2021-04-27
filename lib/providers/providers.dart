import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:skillmer/backend/database.dart';
import 'package:skillmer/services/user_post_service.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

// ###############################
// USER POST PROVIDER
// ###############################
final postProviderAsync =
    StateNotifierProvider<PostAsyncNotifier, AsyncValue<List<UserPost>>>(
  (ref) => PostAsyncNotifier(ref.read),
);

class PostAsyncNotifier extends StateNotifier<AsyncValue<List<UserPost>>> {
  PostAsyncNotifier(this.read) : super(AsyncLoading()) {
    _init();
  }

  final Reader read;
  late MySqlConnection _conn;

  void _init() async {
    _conn = await read(databaseProvider).initDatabase();
    List<UserPost> userPosts =
        await read(userPostProvider).loadUserPosts(_conn);
    state = AsyncData(userPosts);
  }

  void addUserPost(String postText) async {
    // MySqlConnection conn = await Database().get();
    state = AsyncLoading();
    // Add Post in Database and get the refreshed list
    List<UserPost> posts =
        await read(userPostProvider).addUserPost(_conn, postText);
    state = AsyncData(posts);
  }
}
