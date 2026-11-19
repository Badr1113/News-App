import 'article.dart';

class ArticlesResponse {
  String? status;
  int? totalResults;
  String? code;
  String? message;
  List<Article>? articles;

  ArticlesResponse.fromJson(Map<String, dynamic> data) {
    status = data['status'];
    code = data["code"];
    message = data["message"];
    totalResults = data['totalResults'];
    articles = (data['articles'] as List<dynamic>?)
        ?.map((article) => Article.fromJson(article as Map<String, dynamic>))
        .toList();
  }
}
