import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsy/Controller/news_controller.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    TextEditingController textEditingController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Search News ... ",
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(
            () => newsController.isNewsForYouLoading.value
                ? Container(
                      width: 30,
                      height: 30,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                : InkWell(
                    onTap: () {
                      newsController.searchNews(textEditingController.text);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary),
                      child: const Icon(Icons.search),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
