import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/news_controller.dart';
import 'package:news_app/Pages/HomePage/tile_news.dart';
import 'package:news_app/Pages/HomePage/trending_card.dart';
import 'package:news_app/Pages/NewsDetail/news_details.dart';
import 'package:news_app/Widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.dashboard),
                    ),
                    const Text(
                      "NEWSY",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                        fontFamily: "Poppins",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        newsController.getTrendingNews();
                        newsController.getNewsForYou();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.person),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hot News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      children: newsController.trendingNewsList
                          .map((e) => TrendingCard(
                              onTap: () {
                                Get.to(() => NewsDetailsPage(news: e));
                              },
                              imageUrl: e.urlToImage ??
                                  "https://images.indianexpress.com/2024/07/PTI07_01_2024_000315B.jpg",
                              title: e.title ?? "Unknown",
                              author: e.author ?? "Unknown",
                              tag: "Ayusj",
                              time: e.publishedAt ?? "Ayush"))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "News For you ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "See All",
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Column(
                    children: newsController.newsForYouList
                        .map((e) => NewsTile(
                              onTap: () {
                                Get.to(NewsDetailsPage(news: e));
                              },
                              imageUrl: e.urlToImage ??
                                  "https://www.hindustantimes.com/ht-img/img/2024/06/21/400x225/Narendra_Modi_1718983105228_1718983105530.jpg",
                              author: e.author ?? "Unknown",
                              time: e.publishedAt ?? "Unknown",
                              title: e.title ?? "No Title",
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
