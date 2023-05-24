import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
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
    if (confirmPassController.text.trim().isEmpty) {
      Get.snackbar('Confirm Password', 'Confirm your password');
      return false;
    }
    if (confirmPassController.value != passwordController.value) {
      Get.snackbar('Reconfirm password',
          'Your confirmed password is different from your chosen password');
      return false;
    }
    return true;
  }

  Future<void> onLogin() async {
    if (_isValid()) {
      _status.value = RxStatus.loading();
      try {
        Get.snackbar('Success', 'Register Successful');
        _status.value = RxStatus.success();
        Get.toNamed('/');
      } catch (e) {
        e.printError();
        Get.snackbar('Failed', 'Register Failed');
        _status.value = RxStatus.error(e.toString());
      }
    } else {
      _status.value = RxStatus.loading();
      Get.snackbar('Error', "You might not filled the necessary field");
    }
  }
}
