import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/bindings/home_binding.dart';
import 'package:todo_app/controllers/home_controller.dart';
import 'package:todo_app/controllers/login_controller.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/themes/theme_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    LoginController loginController = LoginController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeColor.mainBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 41,
            ),
            Text(
              'Login',
              style: GoogleFonts.lato(
                  color: ThemeColor.pureWhite,
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 53,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username',
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ThemeColor.pureWhite),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: loginController.usernameController,
                  style: GoogleFonts.lato(color: ThemeColor.pureWhite),
                  decoration: InputDecoration(
                      fillColor: ThemeColor.bgFormField,
                      border: const OutlineInputBorder(),
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: ThemeColor.pureWhite)),
                      isDense: true,
                      hintText: 'Enter username',
                      hintStyle: GoogleFonts.lato(
                          color: ThemeColor.pureWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ThemeColor.pureWhite),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: loginController.passwordController,
                  obscureText: true,
                  style: GoogleFonts.lato(color: ThemeColor.pureWhite),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    isDense: true,
                    hintText: 'Enter password',
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ThemeColor.pureWhite)),
                    hintStyle: GoogleFonts.lato(
                        color: ThemeColor.pureWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 69,
            ),
            ElevatedButton(
              onPressed: () {
                loginController.onLogin();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColor.mainBgButton,
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ThemeColor.pureWhite),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                'Login with Google',
                style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ThemeColor.pureWhite),
              ),
              icon: const Icon(Icons.circle),
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColor.mainBgButton,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                'Login with Apple',
                style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ThemeColor.pureWhite),
              ),
              icon: const Icon(Icons.apple),
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColor.mainBgButton,
                minimumSize: const Size.fromHeight(50),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: GoogleFonts.lato(
                    color: ThemeColor.pureWhite,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              GestureDetector(
                child: Text(
                  'Register',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      color: ThemeColor.pureWhite,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  Get.to(() => HomeScreen(),
                      binding: HomeBinding(), preventDuplicates: true);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
