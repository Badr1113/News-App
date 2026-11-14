import 'package:flutter/material.dart';
import 'package:news_app/core/api_services/api_services.dart';
import 'package:news_app/core/models/articles_response/article.dart';
import 'package:news_app/core/models/articles_response/articles_response.dart';
import 'package:news_app/core/models/source_response/source.dart';

class ArticlesViewModel extends ChangeNotifier {
  // observable
  List<Article> articles = [];
  bool isLoading = false;
  String errorMessage = "";

  void loadArticles(Source source) async {
    isLoading = true;
    notifyListeners();
    ArticlesResponse articlesResponse = await ApiServices.getArticles(source);
    isLoading = false;
    notifyListeners();
    if (articlesResponse.status == "error") {
      errorMessage = articlesResponse.message!;
    } else {
      articles = articlesResponse.articles ?? [];
    }
    notifyListeners();
  }
}
