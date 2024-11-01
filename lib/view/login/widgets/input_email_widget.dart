

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/view_models/controllers/login/login_view_model.dart';

import '../../../utils/utils.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,

      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar('Email', 'Enter email');
        }
        return null;
      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: 'email_hint'.tr,
          border: OutlineInputBorder()
      ),
    );
  }
}