import 'package:flutter/material.dart';
import 'package:news_app/core/models/news_category_model.dart';
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
    if (sourcesViewModel.state is SourcesSuccessState) {
      {
        articlesViewModel.loadArticles(
          source: (sourcesViewModel.state as SourcesSuccessState).sources[0],
        );
      }
    }
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
              SourcesState state = viewModel.state;
              switch (state) {
                case SourcesLoadingState():
                  return LinearProgressIndicator();
                case SourcesErrorState():
                  return Text(
                    state.message ?? "",
                    style: TextStyle(color: ColorsManager.white),
                  );
                case SourcesSuccessState():
                  return DefaultTabController(
                    length: state.sources.length,
                    child: TabBar(
                      onTap: (tabIndex) {
                        articlesViewModel.loadArticles(
                          source: state.sources[tabIndex],
                        );
                      },
                      labelStyle: TextStyle(color: ColorsManager.white),
                      indicatorColor: ColorsManager.white,
                      dividerColor: Colors.transparent,
                      unselectedLabelColor: Colors.white,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: state.sources
                          .map((source) => Tab(text: source.name))
                          .toList(),
                    ),
                  );
                case SourceInitialState():
                  return Container();
              }
            },
          ),
          Consumer<ArticlesViewModel>(
            builder: (context, viewModel, _) {
              ArticleState state = viewModel.state;
              switch (state) {
                case ArticleLoadingState():
                  return LinearProgressIndicator();
                case ArticleErrorState():
                  return Text(
                    state.message ?? "",
                    style: TextStyle(color: ColorsManager.white),
                  );
                case ArticleSuccessState():
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        right: 16,
                        left: 16,
                      ),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ArticleItem(article: state.articles[index]);
                        },
                        itemCount: state.articles.length,
                      ),
                    ),
                  );
                case ArticleInitialState():
                  return Container();
              }
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
