import 'package:flutter/material.dart';
import 'package:news_app/core/api_services/api_services.dart';
import 'package:news_app/core/models/news_category_model.dart';
import 'package:news_app/core/models/source_response/source.dart';
import 'package:news_app/core/models/source_response/source_response.dart';

class SourcesViewModel extends ChangeNotifier {
  // observable

  SourcesState state = SourceInitialState();

  Future<void> loadSources(NewsCategoryModel category) async {
    state = SourcesLoadingState();
    notifyListeners();
    SourceResponse sourceResponse = await ApiServices.getSources(category);
    if (sourceResponse.status == "error") {
      state = SourcesErrorState(message: sourceResponse.message);
    } else {
      state = SourcesSuccessState(sources: sourceResponse.sources ?? []);
    }
    notifyListeners();
  }
}

sealed class SourcesState {
  const SourcesState();
}

class SourceInitialState extends SourcesState {
  const SourceInitialState();
}

class SourcesLoadingState extends SourcesState {
  const SourcesLoadingState();
}

class SourcesErrorState extends SourcesState {
  final String? message;
  const SourcesErrorState({this.message});
}

class SourcesSuccessState extends SourcesState {
  final List<Source> sources;
  const SourcesSuccessState({required this.sources});
}
