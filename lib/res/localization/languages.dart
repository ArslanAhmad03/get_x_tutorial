import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
       {
         'en_US': {
           'message' : 'what is your name',
           'name' : 'arsal'
         },
         'ur_PK': {
           'message' : 'آپ کا نام کیا ہے',
           'name' : 'ارسل'
         }
      };

}