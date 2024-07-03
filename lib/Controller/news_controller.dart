import 'dart:convert';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsy/Model/news_model.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> appleNews5 = <NewsModel>[].obs;
  RxList<NewsModel> cryptoNewsList = <NewsModel>[].obs;
  RxList<NewsModel> cryptoNews5 = <NewsModel>[].obs;
  RxList<NewsModel> wsjNewsList = <NewsModel>[].obs;
  RxList<NewsModel> wsjNews5 = <NewsModel>[].obs;
  RxBool isTrendingLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isAppleNewsLoading = false.obs;
  RxBool isCryptoNewsLoading = false.obs;
  RxBool isWSJNewsLoading = false.obs;
  RxBool isSpeaking = false.obs;

  FlutterTts flutterTts = FlutterTts();

  @override
  void onInit() async {
    super.onInit();
    getTrendingNews();
    getNewsForYou();
    getappleNews();
    getcryptoNews();
    getwsjNews();
  }

  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    try {
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
      isTrendingLoading.value = false;
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> getNewsForYou() async {
    isNewsForYouLoading.value = true;
    try {
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
        newsForYou5.value = newsForYouList.sublist(0, 5).obs;
      }
      isNewsForYouLoading.value = false;
    } catch (ex) {
      printError(info: ex.toString());
    }
  }

  Future<void> getappleNews() async {
    isAppleNewsLoading.value = true;
    try {
      var baseURL =
          "https://newsapi.org/v2/everything?q=apple&from=2024-07-01&to=2024-07-01&sortBy=popularity&apiKey=e19b38ac5aaf490f916b8d040367d3c0";
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        for (var articles in body["articles"]) {
          appleNewsList.add(NewsModel(
            author: articles["author"],
            content: articles["content"],
            description: articles["description"].toString(),
            publishedAt: articles["publishedAt"],
            title: articles["title"],
            url: articles["url"],
            urlToImage: articles["urlToImage"],
          ));
        }
        appleNews5.value = appleNewsList.sublist(0, 5).obs;
      }
      isAppleNewsLoading.value = false;
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> getcryptoNews() async {
    isCryptoNewsLoading.value = true;
    try {
      var baseURL =
          "https://newsapi.org/v2/everything?q=crypto&from=2024-07-01&sortBy=publishedAt&apiKey=e19b38ac5aaf490f916b8d040367d3c0";
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        for (var articles in body["articles"]) {
          cryptoNewsList.add(NewsModel(
            author: articles["author"],
            content: articles["content"],
            description: articles["description"].toString(),
            publishedAt: articles["publishedAt"],
            title: articles["title"],
            url: articles["url"],
            urlToImage: articles["urlToImage"],
          ));
        }
        cryptoNews5.value = cryptoNewsList.sublist(0, 5).obs;
      }
      isCryptoNewsLoading.value = false;
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> getwsjNews() async {
    isWSJNewsLoading.value = true;

    try {
      var baseURL =
          "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=e19b38ac5aaf490f916b8d040367d3c0";
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        for (var articles in body["articles"]) {
          wsjNewsList.add(NewsModel(
            author: articles["author"],
            content: articles["content"],
            description: articles["description"].toString(),
            publishedAt: articles["publishedAt"],
            title: articles["title"],
            url: articles["url"],
            urlToImage: articles["urlToImage"],
          ));
        }
        wsjNews5 = wsjNewsList.sublist(0, 5).obs;
      }
      isWSJNewsLoading.value = false;
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> searchNews(String query) async {
    isNewsForYouLoading.value = true;
    try {
      var baseURL =
          "https://newsapi.org/v2/everything?q=$query&sortBy=publishedAt&apiKey=e19b38ac5aaf490f916b8d040367d3c0";
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        newsForYouList.clear();
        int i = 0;
        for (var articles in body["articles"]) {
          i++;
          newsForYouList.add(NewsModel(
            author: articles["author"],
            content: articles["content"],
            description: articles["description"].toString(),
            publishedAt: articles["publishedAt"],
            title: articles["title"],
            url: articles["url"],
            urlToImage: articles["urlToImage"],
          ));
          if (i == 10) break;
        }
      }
      isNewsForYouLoading.value = false;
    } catch (ex) {
      printError(info: ex.toString());
    }
  }

  Future<void> speak(String text) async {
    isSpeaking.value = true;
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(0.8);
    await flutterTts.speak(text);
    flutterTts.setCompletionHandler(() {
      isSpeaking.value = false;
    });
  }
}
