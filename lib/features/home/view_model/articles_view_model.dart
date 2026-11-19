import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/api_services/api_services.dart';
import 'package:news_app/core/models/articles_response/article.dart';
import 'package:news_app/core/models/source_response/source.dart';

class ArticlesViewModel extends ChangeNotifier {
  // observable

  ArticleState state = ArticleInitialState();

  void loadArticles(Source source) async {
    state = ArticleLoadingState();
    notifyListeners();
    Either<List<Article>, String> articlesResponse =
        await ApiServices.getArticles(source);
    articlesResponse.fold(
      (articles) {
        state = ArticleSuccessState(articles: articles);
      },
      (message) {
        state = ArticleErrorState(message: message);
      },
    );

    notifyListeners();
  }
}

sealed class ArticleState {
  const ArticleState();
}

class ArticleInitialState extends ArticleState {
  const ArticleInitialState();
}

class ArticleSuccessState extends ArticleState {
  final List<Article> articles;
  const ArticleSuccessState({required this.articles});
}

class ArticleErrorState extends ArticleState {
  final String? message;
  const ArticleErrorState({this.message});
}

class ArticleLoadingState extends ArticleState {
  const ArticleLoadingState();
}
