class News {
  late final String source;
  late final String? author;
  late final String title;
  late final String description;
  late final String url;
  late final String? urlToImage;
  late final String publishedAt;

  News(
      {required this.source,
      this.author,
      required this.title,
      required this.description,
      required this.url,
      this.urlToImage,
      required this.publishedAt});

  News.fromJson(Map<String, dynamic> json) {
    source = json['source']['name'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
  }
}
