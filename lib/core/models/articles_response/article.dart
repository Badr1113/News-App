import 'package:news_app/core/models/source_response/source.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(Map<String, dynamic> data) {
    source = Source.fromJson(data['source']);

    author = data['author'] as String?;
    title = data['title'] as String?;
    description = data['description'] as String?;
    url = data['url'] as String?;
    urlToImage = data['urlToImage'] as String?;
    publishedAt = data['publishedAt'] as String?;
    content = data['content'] as String?;
  }
}
