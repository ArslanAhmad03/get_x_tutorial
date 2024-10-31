


import 'package:get_x_tutorial/data/network/network_api_services.dart';
import 'package:get_x_tutorial/res/AppUrl/app_url.dart';

class LoginRepository {

  final _apiService  = NetworkApiServices() ;


  Future<dynamic> loginApi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    return response ;
  }



}