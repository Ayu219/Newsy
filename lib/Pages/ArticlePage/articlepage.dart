import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/news_controller.dart';
import 'package:news_app/Pages/HomePage/tile_news.dart';
import 'package:news_app/Pages/NewsDetail/news_details.dart';
import 'package:news_app/Widgets/search_bar.dart';

class Articlepage extends StatelessWidget {
  const Articlepage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const MySearchBar(),
              const SizedBox(
                height: 20,
              ),
              ...newsController.newsForYouList
                  .map(
                    (e) => NewsTile(
                      onTap: () {
                        Get.to(NewsDetailsPage(news: e));
                      },
                      imageUrl:e.urlToImage! ,
                      author: e.author!,
                      time: e.publishedAt!,
                      title:
                          e.title!,
                    ),
                  )
                  
            ],
          ),
        ),
      ),
    );
  }
}
