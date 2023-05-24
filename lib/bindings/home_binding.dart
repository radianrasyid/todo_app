import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:todo_app/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
