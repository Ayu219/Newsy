import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key, required this.imageUrl, required this.title, required this.author, required this.tag, required this.time});
  final String imageUrl;
  final String title;
  final String author;
  final String tag;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(5),
      //  height: 300,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.background,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tag,
                  style: Theme.of(context).textTheme.labelSmall),
              Text(
                time,
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 10,
              ),
               Text(author),
            ],
          )
        ],
      ),
    );
  }
}