class PresignedObject {
  String path;
  String imageName;

  PresignedObject(this.path, this.imageName);

  PresignedObject.fromJson(Map<String, dynamic> json)
      : path = json['uploadURL'],
        imageName = json['imageName'];

  Map<String, dynamic> toJson() => {
        'uploadURL': path,
        'imageName': imageName,
      };
}
