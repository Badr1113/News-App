import 'package:flutter/material.dart';
import 'package:news_app/core/models/news_category_model.dart';
import 'package:news_app/core/sources/colors_manager.dart';
import 'package:news_app/features/home/widgets/category_card.dart';

class CategoryView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 30, 22, 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Here is Some News For You',

                      style: TextStyle(
                        fontSize: 14,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 28),
              sliver: SliverList.separated(
                itemCount: NewsCategoryModel.news.length,
                itemBuilder: (context, index) => CategoryCard(
                  category: NewsCategoryModel.news[index],
                  onTap: () {},
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
              ),
            ),
          ],
        ),
      );
  }
}