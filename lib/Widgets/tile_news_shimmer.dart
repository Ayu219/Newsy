import 'package:flutter/material.dart';
import 'package:newsy/Config/loadingContainer.dart';

class TileNewsShimmer extends StatelessWidget {
  const TileNewsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Loadingcontainer(
                width: MediaQuery.of(context).size.width / 3.5,
                height: 120,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                          width: MediaQuery.of(context).size.width/3,
                          height: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Loadingcontainer(
                        height: 15,
                        width: MediaQuery.of(context).size.width / 2),
                    const SizedBox(
                      height: 15,
                    ),
                    Loadingcontainer(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 3)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
