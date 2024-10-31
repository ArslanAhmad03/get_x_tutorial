

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/view_models/controllers/login/login_view_model.dart';

import '../../../utils/utils.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar('Password', 'Enter password');
        }
        return null;
      },
      onFieldSubmitted: (value){

      },
      decoration: InputDecoration(
          hintText: 'password_hint'.tr,
          border: OutlineInputBorder()
      ),
    );
  }
}