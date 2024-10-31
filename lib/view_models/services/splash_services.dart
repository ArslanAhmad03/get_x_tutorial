

import 'dart:async';

import 'package:get/get.dart';
import 'package:get_x_tutorial/res/routes/routes_name.dart';
import 'package:get_x_tutorial/view_models/controllers/user_prefrence/user_prefrence_view_model.dart';

class SplashServices {

  UserPreference userPreference = UserPreference();

  void isLogin(){


    userPreference.getUser().then((value){

      print(value);
      print(value.isLogin);

      if(value.isLogin == false || value.isLogin.toString() == 'null'){
        Timer(const Duration(seconds: 3) ,
                () => Get.toNamed(RouteName.loginScreen) );
      }else {
        Timer(const Duration(seconds: 3) ,
                () => Get.toNamed(RouteName.homeScreen) );
      }
    });


  }
}