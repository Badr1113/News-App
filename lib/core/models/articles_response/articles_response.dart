import 'article.dart';

class ArticlesResponce {
  String? status;
  int? totalResults;
  List<Article>? articles;

  ArticlesResponce({this.status, this.totalResults, this.articles});

  ArticlesResponce.fromJson(Map<String, dynamic> data) {
    status = data['status'];
    totalResults = data['totalResults'];
    articles = (data['articles'] as List<dynamic>?)
        ?.map((article) => Article.fromJson(article as Map<String, dynamic>))
        .toList();
  }
}
