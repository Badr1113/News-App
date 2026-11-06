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
      id: "",
    ),
    NewsCategoryModel(
      title: 'Business',
      imageAsset: AssetsManager.businessCategory,
      id: "",
    ),
    NewsCategoryModel(
      title: 'Sports',
      imageAsset: AssetsManager.sportsCategory,
      id: "",
    ),
    NewsCategoryModel(
      title: 'Technology',
      imageAsset: AssetsManager.technologyCategory,
      id: "",
    ),
    NewsCategoryModel(
      title: 'Entertainment',
      imageAsset: AssetsManager.entertainmentCategory,
      id: "",
    ),
    NewsCategoryModel(
      title: 'Health',
      imageAsset: AssetsManager.healthCategory,
      id: "",
    ),
    NewsCategoryModel(
      title: 'Science',
      imageAsset: AssetsManager.scienceCategory,
      id: "",
    ),
  ];
}
