import 'package:flutter/material.dart';
import 'package:news_app/core/models/source_response/source.dart';
import 'package:news_app/core/sources/colors_manager.dart';
import 'package:news_app/features/home/view/widgets/articles_item.dart';
import 'package:news_app/features/home/view_model/articles_view_model.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late ArticlesViewModel articlesViewModel;
  late TextEditingController _searchBarController;

  @override
  void initState() {
    super.initState();
    articlesViewModel = ArticlesViewModel();
    _searchBarController = TextEditingController();
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    articlesViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          color: ColorsManager.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: ColorsManager.black,
      body: MultiProvider(
        providers: [ChangeNotifierProvider.value(value: articlesViewModel)],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _searchBarController,
                      validator: (value) {
                        if (value == null) {
                          return "This Field is Required";
                        }
                        if (value.trim().isEmpty) {
                          return "This Field is Required";
                        }
                        return null;
                      },
                      cursorColor: ColorsManager.white,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: ColorsManager.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorsManager.white),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hint: Text(
                          "Enter Your Search",
                          style: TextStyle(color: Colors.white),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        debugPrint("=======================\nhere");
                        articlesViewModel.loadArticles(
                          searchWord: _searchBarController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.white,
                      ),
                      child: Text(
                        "Search",
                        style: TextStyle(color: ColorsManager.black),
                      ),
                    ),
                  ],
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
                                return ArticleItem(
                                  article: state.articles[index],
                                );
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
          ),
        ),
      ),
    );
  }
}
