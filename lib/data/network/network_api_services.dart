

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_x_tutorial/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiService {


  @override
  Future<dynamic> getApi(String url)async{

    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson ;
    try {

      final response = await http.get(Uri.parse(url)).timeout( const Duration(seconds: 10));
      responseJson  = returnResponse(response) ;
    }on SocketException {
      throw InternetException('');
    }
    print(responseJson);
    return responseJson ;

  }


  @override
  Future<dynamic> postApi(var data , String url)async{

    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson ;
    try {

      final response = await http.post(Uri.parse(url),
          body: data
      ).timeout( const Duration(seconds: 10));
      responseJson  = returnResponse(response) ;
    }on SocketException {
      throw InternetException('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson ;

  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;

      default :
        throw FetchDataException('Error accoured while communicating with server '+response.statusCode.toString()) ;
    }
  }

}