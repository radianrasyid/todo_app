import 'package:get/get.dart';
import 'package:todo_app/bindings/home_binding.dart';
import 'package:todo_app/bindings/login_binding.dart';
import 'package:todo_app/bindings/register_binding.dart';
import 'package:todo_app/bindings/splash_binding.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/register_screen.dart';
import 'package:todo_app/screens/splash.dart';
import 'package:todo_app/screens/welcome_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
        name: Routes.login,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.register,
        page: () => const RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: Routes.dashboard,
        page: () => const HomeScreen(),
        binding: HomeBinding())
  ];
}
