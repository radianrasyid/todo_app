import 'package:get/get.dart';
import 'package:todo_app/controllers/controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }
}
