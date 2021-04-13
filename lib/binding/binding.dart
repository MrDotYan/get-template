import 'package:get/get.dart';
import '../src/home/homeController.dart';
import '../src/category/categoryController.dart';
import '../src/personal/personalController.dart';
import '../src/layout/layoutController.dart';

// binding controller
class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => PersonalController());
  }
}
