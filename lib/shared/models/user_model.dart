import 'package:skillmer/shared/models/game_model.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

class User {
  User({
    required this.id,
    required this.username,
    required this.profileImage,
    required this.level,
    this.bookmarkedPosts = const [],
    this.skilledPosts = const [],
    this.favouriteGames = const [],
    this.followedHashtags = const [],
    this.awsUserID = '',
    this.postsCount = 0,
    this.followersCount = 0,
    this.followingCount = 0,
  });

  int id;
  String awsUserID;
  String username;
  String profileImage;
  String level;
  List<UserPost> bookmarkedPosts;
  List<UserPost> skilledPosts;
  List<Game> favouriteGames;
  List<String> followedHashtags;
  int postsCount;
  int followersCount;
  int followingCount;
}
