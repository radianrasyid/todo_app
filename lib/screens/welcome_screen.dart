import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/themes/theme_color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.mainBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 42,
              ),
              Text(
                'Welcome to UpTodo',
                style: GoogleFonts.lato(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: ThemeColor.pureWhite),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                'Please login to your account or create new account to continue',
                style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ThemeColor.pureWhite),
                textAlign: TextAlign.center,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: ThemeColor.mainBgButton,
                ),
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
                child: Text(
                  'Login'.toUpperCase(),
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    minimumSize: const Size.fromHeight(50),
                    side: const BorderSide(
                      width: 1.0,
                      color: ThemeColor.mainBgButton,
                    )),
                onPressed: () {
                  Get.toNamed(Routes.register);
                },
                child: Text(
                  'Create Account'.toUpperCase(),
                  style: GoogleFonts.lato(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
