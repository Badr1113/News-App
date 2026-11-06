import 'package:flutter/material.dart';
import 'package:news_app/core/models/articles_model.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/core/sources/colors_manager.dart';
import 'package:news_app/features/home/widgets/sources_view/widgets/articles_item.dart';

class SourcesView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: SourceModel.sources.length,
          child: TabBar(
            labelStyle: TextStyle(color: ColorsManager.white),
            indicatorColor: ColorsManager.white,
            dividerColor: Colors.transparent,
            unselectedLabelColor: ColorsManager.white,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: SourceModel.sources
                .map((source) => Tab(text: source.title))
                .toList(),
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
  }
}
