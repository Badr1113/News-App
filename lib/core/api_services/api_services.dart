// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/models/articles_responce/articles_response.dart';
import 'package:news_app/core/models/news_category_model.dart';
import 'package:news_app/core/models/source_response/source.dart';
import 'package:news_app/core/models/source_response/source_response.dart';

class ApiServices {
  static const String _baseUrl = "newsapi.org";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articlesEndPoint = "/v2/top-headlines";
  static const String _APIKEY = "826640e0e5834997927b69ba60234b67";
  static const String _language = "en";

  static Future<SourceResponse> getSources(NewsCategoryModel category) async {
    final Map<String, String> queryParameters = {
      "apiKey": _APIKEY,
      "category": category.id,
      "language": _language,
    };
    Uri url = Uri.http(_baseUrl, _sourcesEndPoint, queryParameters);
    http.Response serveResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serveResponse.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }

  static Future<ArticlesResponse> getArticles(Source source) async {
    final Map<String, String> queryParameters = {
      "apiKey": _APIKEY,
      "sources": source.id ?? "",
      "language": _language,
      "sortBy": "popularity",
    };
    Uri url = Uri.https(_baseUrl, _articlesEndPoint, queryParameters);
    http.Response serveResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serveResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}

//this is another way but more complex
// http.get(   Uri.parse("https://${baseUrl + sourcesEndPoint}?apiKey=${APIKEY}&category=${category.id}&language=$language",),   );
