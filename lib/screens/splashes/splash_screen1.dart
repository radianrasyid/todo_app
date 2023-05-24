import 'package:flutter/material.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Image(image: AssetImage('assets/img/step1.png')),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Manage your tasks',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
              'You can easily manage all of your daily tasks in DoMe for free',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
