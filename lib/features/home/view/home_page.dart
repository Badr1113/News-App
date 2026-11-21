import 'package:flutter/material.dart';
import 'package:news_app/core/provider/home_provider.dart';
import 'package:news_app/core/sources/colors_manager.dart';
import 'package:news_app/core/sources/routes_manager.dart';
import 'package:news_app/features/home/view/widgets/home_drawer.dart';
import 'package:news_app/features/home/view/widgets/sources_view/sources_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: _appBar(homeProvider),
      drawer: HomeDrawer(),
      body: homeProvider.selectedWidget,
    );
  }

  AppBar _appBar(HomeProvider homeProvider) {
    return AppBar(
      backgroundColor: ColorsManager.black,
      title: Text(
        homeProvider.title,
        style: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      foregroundColor: ColorsManager.white,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesManager.searchPage);
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}
