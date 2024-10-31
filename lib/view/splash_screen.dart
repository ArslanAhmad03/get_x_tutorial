import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/res/assets/images_assets.dart';
import 'package:get_x_tutorial/res/components/internet_exception_widget.dart';
import 'package:get_x_tutorial/res/components/round_button.dart';
import 'package:get_x_tutorial/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin();

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(ImageAssets.splashScreen),
          Positioned(
              left: width * .1,
              bottom: height * .3,
              child: Text('welcome_back'.tr, textAlign: TextAlign.center)),
          // Positioned(
          //   left: width * .08,
          //   bottom: height * .1,
          //   child: InternetExceptionWidget(onPress: (){}),
          // ),
          // Positioned(child: RoundButton(title: 'round button', onPress: (){}))
        ],
      ),
    );
  }
}
