import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newsy/Controller/news_controller.dart';
import 'package:newsy/Model/news_model.dart';

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
                              news.urlToImage ??
                                  "https://images.indianexpress.com/2024/07/PTI07_01_2024_000315B.jpg",
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Obx(
                        () => newsController.isSpeaking.value
                            ? IconButton(
                                onPressed: () {
                                  newsController.flutterTts.stop();
                                  newsController.isSpeaking.value = false;
                                },
                                icon: const Icon(
                                  Icons.stop_rounded,
                                  size: 50,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  newsController
                                      .speak(news.content ?? "No Description");
                                },
                                icon: const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 50,
                                ),
                              ),
                      ),
                      Obx(
                        () => Expanded(
                          child: Lottie.asset(
                            'assets/animations/wave.json',
                            height: 70,
                            animate: newsController.isSpeaking.value,
                          ),
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
