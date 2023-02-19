class SocialImage {
  String id;
  String name;
  String path;
  String author;
  SocialImage({
    this.id = '',
    this.name = '',
    this.path = '',
    this.author = '',
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'path': path,
      'author': author,
    };
  }

  factory SocialImage.fromJson(Map<String, dynamic> json, String id) {
    return SocialImage(
      id: id,
      name: json['name'] ?? '',
      path: json['path'] ?? '',
      author: json['author'] ?? '',
    );
  }
}
