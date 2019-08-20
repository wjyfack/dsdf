import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../provides/user_info.dart';
final String baseUrl = 'https://www.casaba.top/trafficLight_server-api';
Future request(url, {formData, token}) async{
  try {
    Response response;
    Dio dio = Dio();
    // dio.options.contentType = ContentType.parse('text/plain');
    dio.options.contentType = ContentType.json;
    
    if (UserProvide().userInfo != null) {
      String token = UserProvide().userInfo.id;
      dio.options.headers['Access-Token'] = token;
      print(token);
    }
    
    // print(baseUrl + url);
    print(formData.toString());
    if (formData == null) {
      response = await dio.post(baseUrl+url);
    } else {
      response = await dio.post(baseUrl+url, data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch(e) {
    print('error ===> $e');
  }
}
