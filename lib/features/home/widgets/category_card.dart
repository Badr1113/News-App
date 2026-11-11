import 'package:flutter/material.dart';
import 'package:news_app/core/models/news_category_model.dart';

import '../../../core/sources/colors_manager.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final NewsCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsManager.white,
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 104,
        child: Row(
          children: [
            SizedBox(
              width: 112,
              height: double.infinity,
              child: Image.asset(category.imageAsset, fit: BoxFit.fill),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 12, 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: const TextStyle(
                        color: ColorsManager.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsManager.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            color: ColorsManager.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
