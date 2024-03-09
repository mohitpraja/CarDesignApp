import 'package:cardesignapp/feature/dashboard/controller/dashboard_controller.dart';
import 'package:cardesignapp/feature/home/controller/home_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
  }
}
