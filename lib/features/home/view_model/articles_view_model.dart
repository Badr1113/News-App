import 'package:flutter/material.dart';
import 'package:news_app/core/api_services/api_services.dart';
import 'package:news_app/core/models/articles_response/article.dart';
import 'package:news_app/core/models/articles_response/articles_response.dart';
import 'package:news_app/core/models/source_response/source.dart';

class ArticlesViewModel extends ChangeNotifier {
  // observable

  ArticleState state = ArticleInitialState();

  void loadArticles(Source source) async {
    state = ArticleLoadingState();
    notifyListeners();
    ArticlesResponse articlesResponse = await ApiServices.getArticles(source);

    if (articlesResponse.status == "error") {
      state = ArticleErrorState(message: articlesResponse.message);
    } else {
      state = ArticleSuccessState(articles: articlesResponse.articles ?? []);
    }
    notifyListeners();
  }
}

sealed class ArticleState {}

class ArticleInitialState extends ArticleState {}

class ArticleSuccessState extends ArticleState {
  List<Article> articles = [];
  ArticleSuccessState({required this.articles});
}

class ArticleErrorState extends ArticleState {
  String? message;
  ArticleErrorState({this.message});
}

class ArticleLoadingState extends ArticleState {}
