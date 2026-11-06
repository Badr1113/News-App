import 'package:flutter/material.dart';
import 'package:news_app/core/config/theme/theme_manager.dart';
import 'package:news_app/features/home/home_page.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      home: HomePage(),
    );
  }
}
