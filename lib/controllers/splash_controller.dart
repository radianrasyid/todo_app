import 'package:get/get.dart';
import 'package:todo_app/screens/splashes/splash_screen1.dart';
import 'package:todo_app/screens/splashes/splash_screen2.dart';
import 'package:todo_app/screens/splashes/splash_screen3.dart';

class SplashController extends GetxController {
  RxInt screenIndex = 0.obs;
  final pages = [
    SplashScreen1(),
    SplashScreen2(),
    SplashScreen3(),
  ];
  int screenLength = 2;

  addScreenIndex() {
    if (screenIndex.value.toInt() == screenLength) {
      return null;
    } else {
      return screenIndex.value += 1.toInt();
    }
  }

  setScreenIndex(int data) {
    return screenLength = data;
  }

  setScreen(int data) {
    return screenIndex.value = data.toInt();
  }

  removeScreenIndex() {
    if (screenIndex.value.toInt() == 0) {
      return null;
    } else {
      return screenIndex.value -= 1.toInt();
    }
  }
}
