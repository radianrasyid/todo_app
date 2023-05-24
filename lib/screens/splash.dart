import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/controllers/splash_controller.dart';
import 'package:todo_app/routes/app_routes.dart';

class Splash extends StatelessWidget {
  SplashController splashController = SplashController();
  CarouselController carouselController = CarouselController();
  final controller =
      PageController(viewportFraction: 0.5, keepPage: true, initialPage: 0);
  void nextPage() {
    carouselController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    splashController.addScreenIndex();
  }

  Splash({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {},
          child: const Text(
            'Skip',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    splashController.setScreen(index);
                  },
                  enlargeFactor: 1,
                  enlargeCenterPage: true,
                  aspectRatio: 9 / 16,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  enableInfiniteScroll: false,
                  height: MediaQuery.of(context).size.height * 0.80),
              items: splashController.pages.map((card) {
                return Container(
                  child: card,
                );
              }).toList(),
            ),
            Center(
              child: Obx(() {
                return AnimatedSmoothIndicator(
                  activeIndex: splashController.screenIndex.toInt(),
                  count: splashController.pages.length,
                  effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    type: WormType.normal,
                  ),
                );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  carouselController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  splashController.removeScreenIndex();
                },
                child: const Text('Back')),
            Obx(() {
              return TextButton(
                onPressed: () {
                  splashController.screenIndex != splashController.screenLength
                      ? nextPage()
                      : Get.toNamed(Routes.welcome);
                },
                child: Text(splashController.screenIndex !=
                        splashController.screenLength
                    ? 'Next'
                    : 'Get Started'),
              );
            })
          ],
        ),
      ),
    );
  }
}
