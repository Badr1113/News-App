import 'package:flutter/material.dart';

import '../sources/assets_manager.dart';

class NewsCategory {
  const NewsCategory({
    required this.title,
    required this.imageAsset,
    required this.icon,
  });

  final String title;
  final String imageAsset;
  final IconData icon;

  static const items = <NewsCategory>[
    NewsCategory(
      title: 'General',
      imageAsset: AssetsManager.generalCategory,
      icon: Icons.public,
    ),
    NewsCategory(
      title: 'Business',
      imageAsset: AssetsManager.businessCategory,
      icon: Icons.business_center_outlined,
    ),
    NewsCategory(
      title: 'Sports',
      imageAsset: AssetsManager.sportsCategory,
      icon: Icons.sports_basketball_outlined,
    ),
    NewsCategory(
      title: 'Technology',
      imageAsset: AssetsManager.technologyCategory,
      icon: Icons.memory_outlined,
    ),
    NewsCategory(
      title: 'Entertainment',
      imageAsset: AssetsManager.entertainmentCategory,
      icon: Icons.movie_outlined,
    ),
    NewsCategory(
      title: 'Health',
      imageAsset: AssetsManager.healthCategory,
      icon: Icons.health_and_safety_outlined,
    ),
    NewsCategory(
      title: 'Science',
      imageAsset: AssetsManager.scienceCategory,
      icon: Icons.science_outlined,
    ),
  ];
}
