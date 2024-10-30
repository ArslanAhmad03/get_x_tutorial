

import 'package:get/get.dart';

class SwitchController extends GetxController{


  RxBool notification = false.obs;


  switchButton(value){
    notification.value = value;
  }
}