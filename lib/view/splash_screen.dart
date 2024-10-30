
import 'package:flutter/material.dart';
import 'package:get_x_tutorial/res/assets/images_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(ImageAssets.splashScreen),
    );
  }
}
