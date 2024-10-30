

import 'package:get/get.dart';

class FavouriteController extends GetxController{

  RxList<String> fruitList = <String>[
    'Melon',
    'Apple',
    'Orange',
    'Banana',
    'Citrus',
    'Plum',
    'Mandarin',
    'Grape',
    'Mango',
    'Pear',
    'Lemon',
    'Lime'
  ].obs;

  RxList<String> tempFruitList = <String>[].obs;

  addToFavourite(String value){
    tempFruitList.add(value);
  }
  removeFromFavourite(String value){
    tempFruitList.remove(value);
  }
}