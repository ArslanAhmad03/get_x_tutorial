

import 'package:get/get.dart';
import 'package:get_x_tutorial/res/routes/routes_name.dart';
import 'package:get_x_tutorial/view/splash_screen.dart';

class AppRoutes{

  static appRoutes () => [
    GetPage(name: RouteName.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RouteName.loginScreen, page: () => const SplashScreen()),
  ];

}