import 'package:flutter/material.dart';
import 'package:news_app/core/api_services/api_services.dart';
import 'package:news_app/core/models/articles_response/article.dart';
import 'package:news_app/core/models/news_category_model.dart';
import 'package:news_app/core/models/source_response/source.dart';
import 'package:news_app/core/sources/colors_manager.dart';
import 'package:news_app/features/home/view/widgets/articles_item.dart';
import 'package:news_app/features/home/view_model/articles_view_model.dart';
import 'package:news_app/features/home/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.category});
  NewsCategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewModel sourcesViewModel;
  late ArticlesViewModel articlesViewModel;
  void fetchData() async {
    await sourcesViewModel.loadSources(widget.category);
    articlesViewModel.loadArticles(sourcesViewModel.sources[0]);
  }

  @override
  void initState() {
    super.initState();
    sourcesViewModel = SourcesViewModel();
    articlesViewModel = ArticlesViewModel();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewModel),
        ChangeNotifierProvider.value(value: articlesViewModel),
      ],

      child: Column(
        children: [
          Consumer<SourcesViewModel>(
            builder: (context, viewModel, _) {
              if (viewModel.isLoading) {
                return LinearProgressIndicator();
              }
              if (viewModel.errorMessage.isNotEmpty) {
                return Text(
                  "Error",
                  style: TextStyle(color: ColorsManager.white),
                );
              }
              return DefaultTabController(
                length: viewModel.sources.length,
                child: TabBar(
                  onTap: (tabIndex) {
                    articlesViewModel.loadArticles(viewModel.sources[tabIndex]);
                  },
                  labelStyle: TextStyle(color: ColorsManager.white),
                  indicatorColor: ColorsManager.white,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.white,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: viewModel.sources
                      .map((source) => Tab(text: source.name))
                      .toList(),
                ),
              );
            },
          ),
          Consumer<ArticlesViewModel>(
            builder: (context, viewModel, _) {
              if (viewModel.isLoading) {
                return LinearProgressIndicator();
              }
              if (viewModel.errorMessage.isNotEmpty) {
                return Text(
                  "Error",
                  style: TextStyle(color: ColorsManager.white),
                );
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ArticleItem(article: viewModel.articles[index]);
                    },
                    itemCount: viewModel.articles.length,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );

    // return FutureBuilder(
    //   future: ApiServices.getSources(category),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return LinearProgressIndicator();
    //     }
    //     if (snapshot.hasError) {
    //       return Center(
    //         child: Text("Error", style: TextStyle(color: Colors.white)),
    //       );
    //     }
    //     List<Source> sources = snapshot.data?.sources ?? [];
    //     return Column(
    //       children: [
    //

    //       ],
    //     );
    //   },
    // );
    //
  }
}
