import 'article.dart';

class ArticlesResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;

  ArticlesResponse({this.status, this.totalResults, this.articles});

  ArticlesResponse.fromJson(Map<String, dynamic> data) {
    status = data['status'];
    totalResults = data['totalResults'];
    articles = (data['articles'] as List<dynamic>?)
        ?.map((article) => Article.fromJson(article as Map<String, dynamic>))
        .toList();
  }
}
