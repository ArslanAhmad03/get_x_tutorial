import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CountController extends GetxController {
  RxInt x = 1.obs;

  RxDouble opacity = 0.4.obs;

  incrementCounter() {
    x.value++;
    if (kDebugMode) {
      print(x);
    }
  }
}
