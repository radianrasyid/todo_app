import 'package:flutter/material.dart';

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Image(image: AssetImage('assets/img/step3.png')),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text('Organize your tasks',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
          const SizedBox(
            height: 25,
          ),
          const Text(
              'You can organize your daily tasks by adding your tasks into separate categories',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
