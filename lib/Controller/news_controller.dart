import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/news_model.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    getTrendingNews();
    getNewsForYou();
  }

  Future<void> getTrendingNews() async {
    var baseURL =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=e19b38ac5aaf490f916b8d040367d3c0";
    var response = await http.get(Uri.parse(baseURL));
    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      for (var articles in body["articles"]) {
       
        trendingNewsList.add(NewsModel(
          author: articles["author"],
          content: articles["content"],
          description: articles["description"].toString(),
          publishedAt: articles["publishedAt"],
          title: articles["title"],
          url: articles["url"],
          urlToImage: articles["urlToImage"],
        ));
      }
    }
  }

  Future<void> getNewsForYou() async {
    var baseURL =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e19b38ac5aaf490f916b8d040367d3c0";
    var response = await http.get(Uri.parse(baseURL));
    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      for (var articles in body["articles"]) {
        newsForYouList.add(NewsModel(
          author: articles["author"],
          content: articles["content"],
          description: articles["description"].toString(),
          publishedAt: articles["publishedAt"],
          title: articles["title"],
          url: articles["url"],
          urlToImage: articles["urlToImage"],
        ));
      }
    }
  }
}
