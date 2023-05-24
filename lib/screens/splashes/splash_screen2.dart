import 'package:flutter/material.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Image(image: AssetImage('assets/img/step2.png')),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text('Create daily routine',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
          const SizedBox(
            height: 25,
          ),
          const Text(
              'In Uptodo you can create your personalized routine to stay productive',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
