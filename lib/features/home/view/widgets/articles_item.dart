import 'package:cached_network_image/cached_network_image.dart';
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
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              placeholder: (_, _) => LinearProgressIndicator(),
              errorWidget: (_, _, _) => Icon(Icons.broken_image_rounded),
            ),
          ),
          Text(
            article.title ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: ColorsManager.white,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 80,
                child: Text(
                  "by : ${article.author}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.grey,
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 20,
                child: Text(
                  article.publishedAt ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
