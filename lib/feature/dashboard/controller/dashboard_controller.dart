import 'package:cardesignapp/core/colors.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  int selectedPos = 0;
  late CircularBottomNavigationController navigationController;
  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.dashboard,
      "Home",
      primaryColor,
      labelStyle: const TextStyle(
        fontSize: 12
      ),
    ),
    TabItem(
      Icons.search,
      "Search",
      primaryColor,
       labelStyle: const TextStyle(
        fontSize: 12
      ),
    ),
    TabItem(
      Icons.layers,
      "Reports",
      primaryColor,
       labelStyle: const TextStyle(
        fontSize: 12
      ),
    ),
    TabItem(
      Icons.notifications,
      "Notifications",
      primaryColor,
       labelStyle: const TextStyle(
        fontSize: 12
      ),
    ),
    TabItem(
      Icons.person,
      "Profile",
      primaryColor,
       labelStyle: const TextStyle(
        fontSize: 12
      ),
    ),
    TabItem(
      CupertinoIcons.heart,
      "Like",
      primaryColor,
       labelStyle: const TextStyle(
        fontSize: 12
      ),
    ),
  ]);

  @override
  void onInit() {
    navigationController = CircularBottomNavigationController(selectedPos);
    super.onInit();
  }
}
