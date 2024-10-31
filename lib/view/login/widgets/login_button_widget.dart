

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/view_models/controllers/login/login_view_model.dart';

import '../../../res/components/round_button.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey ;
  LoginButtonWidget({Key? key , required this.formKey}) : super(key: key);

  final loginVM = Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  Obx(() => RoundButton(
        width: 200,
        title: 'login'.tr,
        loading: loginVM.loading.value,
        onPress: (){
          if(formKey.currentState!.validate()){
            loginVM.loginApi();
          }
        }
    ));
  }
}