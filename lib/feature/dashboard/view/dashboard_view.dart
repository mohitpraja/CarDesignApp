import 'package:cardesignapp/feature/dashboard/controller/dashboard_controller.dart';
import 'package:cardesignapp/feature/home/view/home_view.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 60),
            child: HomeView(),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      controller.tabItems,
      selectedCallback: null,
      controller: controller.navigationController,
      selectedPos: controller.selectedPos,
      barHeight: 60,
      iconsSize: 25,
      barBackgroundColor: Colors.white,

      // barBackgroundGradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      //   colors: [
      //     Colors.blue,
      //     Colors.red,
      //   ],
      // ),
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}
