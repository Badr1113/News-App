import 'package:news_app/core/sources/assets_manager.dart';

class ArticlesModel {
  String imageUrl;
  String title;
  String author;
  String date;

  ArticlesModel({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.date,
  });

  static List<ArticlesModel> articles = [
    ArticlesModel(
      imageUrl: AssetsManager.technologyCategory,
      title: "Padl;skfjl;ajdlkjfal;skjdflasjf;asjldfks;ldfkjalfkjds;afjka;fjkdas;fs;fj;asfjdk",
      author: "Badr",
      date: "15 , 12 ",
    ),
  ];
}
