import 'package:flutter/material.dart';
import 'package:news_app/core/models/articles_model.dart';
import 'package:news_app/core/sources/colors_manager.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({required this.article});
  ArticlesModel article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.white),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(article.imageUrl),
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: ColorsManager.white,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "by : ${article.author}",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.grey,
                ),
              ),
              Spacer(),
              Text(
                article.date,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
