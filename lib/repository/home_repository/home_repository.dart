

import 'package:get_x_tutorial/data/network/network_api_services.dart';
import 'package:get_x_tutorial/models/home/user_list_model.dart';
import 'package:get_x_tutorial/res/AppUrl/app_url.dart';

class HomeRepository {

  final _apiService  = NetworkApiServices() ;

  Future<UserListModel> userListApi() async{
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response) ;
  }


}