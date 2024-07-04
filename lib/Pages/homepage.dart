import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsy/Controller/news_controller.dart';
import 'package:newsy/Pages/HomePage/tile_news.dart';
import 'package:newsy/Pages/HomePage/trending_card.dart';
import 'package:newsy/Pages/NewsDetail/news_details.dart';
import 'package:newsy/Pages/Profile/profilepage.dart';
import 'package:newsy/Widgets/tile_news_shimmer.dart';
import 'package:newsy/Widgets/trendingCardShimmer.dart';

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
                      child: InkWell(
                        onTap: () {
                          Get.to(() => Profilepage());
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(Icons.person),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
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
                    () => newsController.isTrendingLoading.value
                        ? Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                const TrendingcardShimmer(),
                            ],
                          )
                        : Row(
                            children: newsController.trendingNewsList
                                .map(
                                  (e) => TrendingCard(
                                    onTap: () {
                                      Get.to(() => NewsDetailsPage(news: e));
                                    },
                                    imageUrl: e.urlToImage ??
                                        "https://images.indianexpress.com/2024/07/PTI07_01_2024_000315B.jpg",
                                    title: e.title ?? "Unknown",
                                    author: e.author ?? "Unknown",
                                    tag: "Ayusj",
                                    time: e.publishedAt ?? "Ayush",
                                  ),
                                )
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
                  () => newsController.isNewsForYouLoading.value
                      ? Column(
                          children: [
                            for (int i = 0; i < 5; i++) const TileNewsShimmer()
                          ],
                        )
                      : Column(
                          children: newsController.newsForYou5
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Apple News",
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
                Obx(
                  () => newsController.isAppleNewsLoading.value
                      ? Column(
                          children: [
                            for (int i = 0; i < 5; i++) const TileNewsShimmer()
                          ],
                        )
                      : Column(
                          children: newsController.appleNews5
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Wall Street Journal News",
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
                    () => newsController.isWSJNewsLoading.value
                        ? Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                const TrendingcardShimmer(),
                            ],
                          )
                        : Row(
                            children: newsController.wsjNews5
                                .map(
                                  (e) => TrendingCard(
                                    onTap: () {
                                      Get.to(() => NewsDetailsPage(news: e));
                                    },
                                    imageUrl: e.urlToImage ??
                                        "https://images.indianexpress.com/2024/07/PTI07_01_2024_000315B.jpg",
                                    title: e.title ?? "Unknown",
                                    author: e.author ?? "Unknown",
                                    tag: "Ayusj",
                                    time: e.publishedAt ?? "Ayush",
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Crypto News",
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
                Obx(
                  () => newsController.isCryptoNewsLoading.value
                      ? Column(
                          children: [
                            for (int i = 0; i < 5; i++) const TileNewsShimmer()
                          ],
                        )
                      : Column(
                          children: newsController.cryptoNews5
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
