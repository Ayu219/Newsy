import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/ArticlePage/articlepage.dart';
import 'package:news_app/Pages/Profile/profilepage.dart';
import 'package:news_app/Pages/homepage.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  List<Widget> pages = [
    const HomePage(),
    const Articlepage(),
    const Profilepage(),
  ];
}
