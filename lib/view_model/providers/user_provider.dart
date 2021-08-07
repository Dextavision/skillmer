// ###############################
// USER PROVIDER
// ###############################
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:skillmer/model/database.dart';
import 'package:skillmer/model/services/user_service.dart';
import 'package:skillmer/shared/models/user_model.dart';

final userProviderAsync =
    StateNotifierProvider<UserAsyncNotifier, AsyncValue<User>>(
  (ref) => UserAsyncNotifier(ref.read),
);

class UserAsyncNotifier extends StateNotifier<AsyncValue<User>> {
  UserAsyncNotifier(this.read) : super(AsyncLoading()) {
    _init();
  }

  final Reader read;
  late MySqlConnection _conn;

  void _init() async {
    _conn = await read(databaseProvider).initDatabase();

    User user = await read(userProvider).loadUser(_conn);

    state = AsyncData(user);
  }

  void uploadUserProfileImage() async {
    // Upload to S3
    String imageURL = await read(userProvider).uploadProfileImage();
    // Update User Entry in Database
    User user = await read(userProvider).updateUserProfileImage(imageURL);

    state = AsyncData(user);
  }

  void likePost(int postID) async {
    User user = await read(userProvider).likePost(postID);

    state = AsyncData(user);
  }

  void bookmarkPost(int postID) async {
    User user = await read(userProvider).bookmarkPost(postID);

    state = AsyncData(user);
  }
}
