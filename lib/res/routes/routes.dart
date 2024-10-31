

import 'package:get/get.dart';
import 'package:get_x_tutorial/res/routes/routes_name.dart';
import 'package:get_x_tutorial/view/home/home_view.dart';
import 'package:get_x_tutorial/view/login/login_view.dart';
import 'package:get_x_tutorial/view/splash_screen.dart';

class AppRoutes{

  static appRoutes () => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => SplashScreen() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.loginScreen,
      page: () => LoginView() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.homeScreen,
      page: () => HomeView() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
  ];

}