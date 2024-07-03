import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Controller/news_controller.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/Pages/HomePage/tile_news.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsModel news;
  const NewsDetailsPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new),
                          Text("Back"),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              news.urlToImage!,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  news.title ?? "Title",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      news.publishedAt!,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      news.publishedAt ?? "Unknown",
                      style: TextStyle(
                          fontSize: 18,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          newsController
                              .speak(news.description ?? "No Description");
                        },
                        icon: Icon(
                          Icons.play_arrow_rounded,
                          size: 50,
                        ),
                      ),
                      Expanded(
                        child: Lottie.asset(
                          'assets/animations/wave.json',
                          height: 70,
                          animate: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        news.description ?? "No Description",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                      ),
                    ),
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
