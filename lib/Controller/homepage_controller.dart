import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/bottom_navbar.dart';
import 'package:news_app/Widgets/bottom_navbar.dart';

class HomepageController extends StatelessWidget {
  const HomepageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: const BottomNav(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
