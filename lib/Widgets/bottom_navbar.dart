import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsy/Controller/bottom_navbar.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Padding(
      padding: const EdgeInsets.only(left: 40,top: 10,bottom: 5,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 15),
            width: 180,
            height: 60,
            decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(1),
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    controller.index.value = 0;
                  },
                  child: Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: controller.index.value == 0
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Icon(
                        Icons.home,
                        size: 25,
                        color: controller.index.value == 0
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.index.value = 1;
                  },
                  child: Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: controller.index.value == 1
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Icon(
                        Icons.book,
                        size: 25,
                        color: controller.index.value == 1
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     controller.index.value = 2;
                //   },
                //   child: Obx(
                //     () => AnimatedContainer(
                //       duration: const Duration(milliseconds: 100),
                //       curve: Curves.easeIn,
                //       width: 40,
                //       height: 40,
                //       padding: const EdgeInsets.all(5),
                //       decoration: BoxDecoration(
                //         color: controller.index.value == 2
                //             ? Theme.of(context).colorScheme.primary
                //             : null,
                //         borderRadius: BorderRadius.circular(3),
                //       ),
                //       child: Icon(
                //         Icons.settings,
                //         size: 25,
                //         color: controller.index.value == 2
                //             ? Theme.of(context).colorScheme.onBackground
                //             : Theme.of(context).colorScheme.secondaryContainer,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
