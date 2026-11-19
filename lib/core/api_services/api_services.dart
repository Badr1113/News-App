// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/models/articles_response/article.dart';
import 'package:news_app/core/models/articles_response/articles_response.dart';
import 'package:news_app/core/models/news_category_model.dart';
import 'package:news_app/core/models/source_response/source.dart';
import 'package:news_app/core/models/source_response/source_response.dart';

class ApiServices {
  static const String _baseUrl = "newsapi.org";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articlesEndPoint = "/v2/top-headlines";
  static const String _APIKEY = "826640e0e5834997927b69ba60234b67";
  static const String _language = "en";

  static Future<Either<List<Source>, String>> getSources(
    NewsCategoryModel category,
  ) async {
    final Map<String, String> queryParameters = {
      "apiKey": _APIKEY,
      "category": category.id,
      "language": _language,
    };
    Uri url = Uri.http(_baseUrl, _sourcesEndPoint, queryParameters);
    try {
      http.Response serveResponse = await http.get(url);
      Map<String, dynamic> json = jsonDecode(serveResponse.body);
      SourceResponse sourceResponse = SourceResponse.fromJson(json);
      if (sourceResponse.status == "error") {
        return right(sourceResponse.message ?? "");
      } else {
        return left(sourceResponse.sources ?? []);
      }
    } catch (exception) {
      if (exception is SocketException) {
        Right('No internet connection. Please check your network.');
      }
      if (exception is TimeoutException) {
        Right('The connection timed out. Please try again.');
      }
      if (exception is FormatException) {
        Right('Invalid response format from the server.');
      }
      return Right('An unexpected error occurred: $exception');
    }
  }

  static Future<Either<List<Article>, String>> getArticles(
    Source source,
  ) async {
    final Map<String, String> queryParameters = {
      "apiKey": _APIKEY,
      "sources": source.id ?? "",
      "language": _language,
      "sortBy": "popularity",
    };
    Uri url = Uri.https(_baseUrl, _articlesEndPoint, queryParameters);
    try {
      http.Response serveResponse = await http.get(url);
      Map<String, dynamic> json = jsonDecode(serveResponse.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == "error") {
        return right(articlesResponse.status ?? "Error");
      } else {
        return left(articlesResponse.articles ?? []);
      }
    } catch (exception) {
      if (exception is SocketException) {
        Right('No internet connection. Please check your network.');
      }
      if (exception is TimeoutException) {
        Right('The connection timed out. Please try again.');
      }
      if (exception is FormatException) {
        Right('Invalid response format from the server.');
      }
      return Right('An unexpected error occurred: $exception');
    }
  }
}

//this is another way but more complex
// http.get(   Uri.parse("https://${baseUrl + sourcesEndPoint}?apiKey=${APIKEY}&category=${category.id}&language=$language",),   );
