import 'package:flutter/material.dart';
import 'package:news_app/features/home/view/home_page.dart';
import 'package:news_app/features/home/view/widgets/search_page.dart';

class RoutesManager {
  static const String homePage = "/homePage";
  static const String searchPage = "/searchPage";

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => HomePage(),
    searchPage: (context) => SearchPage(),
  };
}
