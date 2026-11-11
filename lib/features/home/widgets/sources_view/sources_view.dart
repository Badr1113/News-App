import 'package:flutter/material.dart';
import 'package:news_app/core/api_services/api_services.dart';
import 'package:news_app/core/models/articles_model.dart';
import 'package:news_app/core/models/news_category_model.dart';
import 'package:news_app/core/models/source_response/source.dart';
import 'package:news_app/core/sources/colors_manager.dart';
import 'package:news_app/features/home/widgets/sources_view/widgets/articles_item.dart';

class SourcesView extends StatelessWidget {
  SourcesView({super.key, required this.category});
  NewsCategoryModel category;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getSources(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error", style: TextStyle(color: Colors.white)),
          );
        }
        List<Source> sources = snapshot.data?.sources ?? [];
        return Column(
          children: [
            DefaultTabController(
              length: sources.length,
              child: TabBar(
                labelStyle: TextStyle(color: ColorsManager.white),
                indicatorColor: ColorsManager.white,
                dividerColor: Colors.transparent,
                unselectedLabelColor: Colors.white,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                tabs: sources.map((source) => Tab(text: source.name)).toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ArticleItem(article: ArticlesModel.articles[index]);
                  },
                  itemCount: ArticlesModel.articles.length,
                ),
              ),
            ),
          ],
        );
      },
    );
    //
  }
}
