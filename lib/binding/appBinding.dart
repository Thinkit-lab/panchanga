import 'package:get/get.dart';

import 'package:panchanga_pandit/controllers/home_controller.dart';
import 'package:panchanga_pandit/controllers/login_controller.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<LoginController>(LoginController());
   
  }
}
