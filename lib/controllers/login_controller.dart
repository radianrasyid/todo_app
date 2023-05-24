import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/routes/app_routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _status = Rx<RxStatus>(RxStatus.empty());

  RxStatus get status => _status.value;

  @override
  void onInit() {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
  }

  bool _isValid() {
    if (usernameController.text.trim().isEmpty) {
      Get.snackbar('enter username', 'username is not being filled');
      return false;
    }
    if (passwordController.text.trim().isEmpty) {
      Get.snackbar('enter password', 'password is not being filled');
      return false;
    }
    return true;
  }

  Future<void> onLogin() async {
    if (_isValid()) {
      _status.value = RxStatus.loading();
      try {
        Get.snackbar('Success', 'Login Successful');
        _status.value = RxStatus.success();
        Get.toNamed('/dashboard');
      } catch (e) {
        e.printError();
        Get.snackbar('Failed', 'Login Failed');
        _status.value = RxStatus.error(e.toString());
      }
    }
  }
}
