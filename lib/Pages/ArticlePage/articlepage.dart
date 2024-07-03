import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newsy/Controller/news_controller.dart';
import 'package:newsy/Pages/HomePage/tile_news.dart';
import 'package:newsy/Pages/NewsDetail/news_details.dart';
import 'package:newsy/Widgets/search_bar.dart';

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
              Obx(
                () => Column(
                  children: newsController.newsForYouList
                      .map(
                        (e) => NewsTile(
                          onTap: () {
                            Get.to(NewsDetailsPage(news: e));
                          },
                          imageUrl: e.urlToImage ??
                              "https://www.hindustantimes.com/ht-img/img/2024/06/21/400x225/Narendra_Modi_1718983105228_1718983105530.jpg",
                          author: e.author ?? "Unknown ",
                          time: e.publishedAt ?? "Unknown",
                          title: e.title ?? "Unknown",
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
