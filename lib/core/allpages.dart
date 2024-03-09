import 'package:cardesignapp/core/routes.dart';
import 'package:cardesignapp/feature/dashboard/binding/dashboard_binding.dart';
import 'package:cardesignapp/feature/dashboard/view/dashboard_view.dart';
import 'package:get/get.dart';


List<GetPage> allPage = [
  GetPage(name: Routes.dashboard, page: () => const DashboardView(),binding: DashboardBinding())
];