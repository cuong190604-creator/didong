class New {
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String content;

  New({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
    required this.content,
  });

  factory New.fromJson(Map<String, dynamic> json) {
    return New(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      urlToImage: json["urlToImage"] ?? "",
      url: json["url"] ?? "",
      content: json["content"] ?? "",
    );
  }
}
