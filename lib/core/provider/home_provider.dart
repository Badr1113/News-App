import 'package:flutter/material.dart';
import 'package:news_app/core/models/news_category_model.dart';
import 'package:news_app/features/home/widgets/category_view/category_view.dart';
import 'package:news_app/features/home/widgets/sources_view/sources_view.dart';

class HomeProvider extends ChangeNotifier {
  Widget selectedWidget = CategoryView(); // observable
  NewsCategoryModel? selectedCategory; // helper

  String title = "Home"; // observable

  // observers
  // Home Screen or The Hole App

  // goToHome
  void goToHome() {
    selectedWidget = CategoryView();
    title = "Home";
    notifyListeners();
  }

  // goToSources
  void goToSources() {
    selectedWidget = SourcesView();
    title = selectedCategory!.title;
    notifyListeners();
  }
}
