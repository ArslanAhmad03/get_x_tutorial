


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController{

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  void loginApi()async{
    if (kDebugMode) {
      print('loginApi');
    }

    loading.value = true;

    Map newData ={
      'email' : emailController.value.text,
      'password': passwordController.value.text
    };
    final response = await post(Uri.parse('https://reqres.in/api/login'),
    body: jsonEncode(newData),
    headers: {
      'Authoeria' : 'asdfasdf'
        }
    );
    
    var data = jsonDecode(response.body);
    if (kDebugMode) {
      print(data);
    }

    if(response.statusCode == 200){
      loading.value = true;
      Get.snackbar('Login Successful', 'congrats');
      
    }else{
      loading.value = true;
      Get.snackbar('Login Failed', data['error']);
    }
  }

}