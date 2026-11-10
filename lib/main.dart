import 'package:flutter/material.dart';
import 'package:news_app/config/theme/theme_manager.dart';
import 'package:news_app/core/provider/home_provider.dart';
import 'package:news_app/core/sources/routes_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider())],
      child: NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News",
      debugShowCheckedModeBanner: true,
      themeMode: ThemeMode.light,
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.homePage,
      locale: Locale("en"),
      supportedLocales: [Locale("en"), Locale("ar")],
    );
  }
}
