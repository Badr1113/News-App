import 'package:flutter/material.dart';
import 'package:news_app/core/sources/colors_manager.dart';
import 'package:news_app/features/home/widgets/home_drawer.dart';
import 'package:news_app/features/home/widgets/sources_view/sources_view.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: _appBar(),
      drawer: HomeDrawer(),
      body: SourcesView(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: ColorsManager.black,
      title: Text(
        "Home",
        style: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      foregroundColor: ColorsManager.white,
      centerTitle: true,
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    );
  }
}
