import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/models/articles_response/article.dart';
import 'package:news_app/core/sources/colors_manager.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: article.urlToImage ?? "",
                        placeholder: (_, _) => LinearProgressIndicator(),
                        errorWidget: (_, _, _) =>
                            Icon(Icons.broken_image_rounded),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      article.description ?? "Has no description",
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        Uri url = Uri.parse(article.url!);
                        await launchUrl(url);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: ColorsManager.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                      ),
                      child: Text(
                        "View Full Article",
                        style: TextStyle(color: ColorsManager.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
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
      ),
    );
  }
}
