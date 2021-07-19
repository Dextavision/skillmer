class UserPost {
  UserPost({
    required this.id,
    required this.username,
    required this.profileImage,
    this.likes = 0,
    this.textPost,
    this.postImage,
    this.hashtags,
  });

  int id;
  String profileImage;
  String username;
  int likes;
  String? textPost;
  String? postImage;
  List<String>? hashtags;
}
