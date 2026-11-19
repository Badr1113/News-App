import 'package:flutter/material.dart';
import 'package:news_app/features/home/view/home_page.dart';

class RoutesManager {
  static const String homePage = "/homePage";

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => HomePage(),
  };
}
