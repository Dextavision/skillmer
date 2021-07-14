class User {
  User({
    required this.id,
    required this.username,
    required this.profileImage,
    required this.level,
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
  int postsCount;
  int followersCount;
  int followingCount;
}
