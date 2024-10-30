

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_x_tutorial/data/app_exceptions.dart';
import 'package:get_x_tutorial/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiService{


  @override
  Future<dynamic> getApi(String url)async{

    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);

    }on SocketException{
      throw InternetException('');
    } on RequestTimeOutException{
      throw RequestTimeOutException('');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data ,String url)async{

    if (kDebugMode) {
      print(data);
    }

    dynamic responseJson;
    try{
      final response = await http.post(Uri.parse(url),body: jsonEncode(data)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);

    }on SocketException{
      throw InternetException('');
    } on RequestTimeOutException{
      throw RequestTimeOutException('');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response res){
    switch(res.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(res.body);
        return responseJson;
      case 400:
        throw InvalidUrlException();
      default:
        throw FetchDataException('error while communicating${res.statusCode}');
    }
  }
}