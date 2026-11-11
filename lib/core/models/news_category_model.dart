import 'package:flutter/material.dart';

import '../sources/assets_manager.dart';

class NewsCategoryModel {
  const NewsCategoryModel({
    required this.title,
    required this.imageAsset,
    required this.id,
  });

  final String title;
  final String imageAsset;
  final String id;

  static const news = <NewsCategoryModel>[
    NewsCategoryModel(
      title: 'General',
      imageAsset: AssetsManager.generalCategory,
      id: "general",
    ),
    NewsCategoryModel(
      title: 'Business',
      imageAsset: AssetsManager.businessCategory,
      id: "business",
    ),
    NewsCategoryModel(
      title: 'Sports',
      imageAsset: AssetsManager.sportsCategory,
      id: "sports",
    ),
    NewsCategoryModel(
      title: 'Technology',
      imageAsset: AssetsManager.technologyCategory,
      id: "technology",
    ),
    NewsCategoryModel(
      title: 'Entertainment',
      imageAsset: AssetsManager.entertainmentCategory,
      id: "entertainment",
    ),
    NewsCategoryModel(
      title: 'Health',
      imageAsset: AssetsManager.healthCategory,
      id: "health",
    ),
    NewsCategoryModel(
      title: 'Science',
      imageAsset: AssetsManager.scienceCategory,
      id: "science",
    ),
  ];
}
