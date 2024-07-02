import 'package:flutter/material.dart';
import 'package:news_app/Config/loadingContainer.dart';

class TrendingcardShimmer extends StatelessWidget {
  const TrendingcardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.all(5),
          //  height: 300,
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            children: [
              Loadingcontainer(
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Loadingcontainer(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 10,
                  ),
                  Loadingcontainer(
                    width: MediaQuery.of(context).size.width / 6,
                    height: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Loadingcontainer(
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Loadingcontainer(
                    width: MediaQuery.of(context).size.width / 1.9,
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Loadingcontainer(
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Loadingcontainer(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
