class UserPost {
  UserPost({
    required this.id,
    required this.username,
    required this.profileImage,
    this.textPost,
    this.hashtags,
  });

  int id;
  String profileImage;
  String username;
  String? textPost;
  List<String>? hashtags;
}
