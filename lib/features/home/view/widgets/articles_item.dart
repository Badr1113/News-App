import 'package:flutter/material.dart';
import 'package:news_app/core/models/articles_response/article.dart';
import 'package:news_app/core/sources/colors_manager.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({required this.article});
  Article article;
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
            child: Image.asset(article.urlToImage!),
          ),
          Text(
            article.title!,
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
                article.publishedAt!,
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
