import 'package:flutter/material.dart';
import 'package:news_app/Pages/HomePage/tile_news.dart';
import 'package:news_app/Pages/HomePage/trending_card.dart';
import 'package:news_app/Widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NEWSY",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
     
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
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
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TrendingCard(
                        imageUrl:
                            "https://www.hindustantimes.com/ht-img/img/2024/06/21/400x225/Narendra_Modi_1718983105228_1718983105530.jpg",
                        author: "Ayush Tomer",
                        tag: "Trending",
                        time: "2 Days Ago",
                        title:
                            "International Yoga Day Live Updates: Yoga has become a unifying force, says PM Modi",
                      ),
                    ],
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
                const Column(
                  children: [
                    NewsTile(
                      imageUrl:
                          "https://www.hindustantimes.com/ht-img/img/2024/06/21/400x225/Narendra_Modi_1718983105228_1718983105530.jpg",
                      author: "Ayush Tomer",
                      time: "2 Days Ago",
                      title:
                          "International Yoga Day Live Updates: Yoga has become a unifying force, says PM Modi",
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

