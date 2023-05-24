import 'package:get/get.dart';
import 'package:todo_app/controllers/image_picker_controller.dart';
import 'package:todo_app/controllers/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => ImagePickerController());
  }
}
