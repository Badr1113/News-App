import 'package:flutter/material.dart';
import 'package:news_app/core/api_services/api_services.dart';
import 'package:news_app/core/models/news_category_model.dart';
import 'package:news_app/core/models/source_response/source.dart';
import 'package:news_app/core/models/source_response/source_response.dart';

class SourcesViewModel extends ChangeNotifier {
  // observable
  List<Source> sources = [];
  bool isLoading = false;
  String errorMessage = "";

  Future<void> loadSources(NewsCategoryModel category) async {
    isLoading = true;
    notifyListeners();
    SourceResponse sourceResponse = await ApiServices.getSources(category);
    isLoading = false;
    notifyListeners();
    if (sourceResponse.status == "error") {
      errorMessage = sourceResponse.message!;
    } else {
      sources = sourceResponse.sources ?? [];
    }
    notifyListeners();
  }
}
