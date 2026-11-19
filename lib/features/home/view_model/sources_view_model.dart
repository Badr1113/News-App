import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/api_services/api_services.dart';
import 'package:news_app/core/models/news_category_model.dart';
import 'package:news_app/core/models/source_response/source.dart';


class SourcesViewModel extends ChangeNotifier {
  // observable

  SourcesState state = SourceInitialState();

  Future<void> loadSources(NewsCategoryModel category) async {
    state = SourcesLoadingState();
    notifyListeners();
    Either<List<Source>, String> sourceResponse = await ApiServices.getSources(
      category,
    );
    sourceResponse.fold(
      (sources) {
        state = SourcesSuccessState(sources: sources);
      },
      (message) {
        state = SourcesErrorState(message: message);
      },
    );
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
