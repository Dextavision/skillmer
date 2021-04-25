import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:skillmer/backend/database.dart';
import 'package:skillmer/services/user_post_service.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

// ###############################
// USER POST PROVIDER
// ###############################
final postProvider =
    StateNotifierProvider<PostAsyncNotifier, AsyncValue<List<UserPost>>>(
  (ref) => PostAsyncNotifier(ref.read),
);

class PostAsyncNotifier extends StateNotifier<AsyncValue<List<UserPost>>> {
  PostAsyncNotifier(this.read) : super(AsyncLoading()) {
    _init();
  }

  final Reader read;

  void _init() async {
    MySqlConnection conn = await Database().get();
    List<UserPost> userPosts = await read(userPostProvider).loadUserPosts(conn);
    state = AsyncData(userPosts);
  }
}
