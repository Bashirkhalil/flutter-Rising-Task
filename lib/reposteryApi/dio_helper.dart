

import 'package:dio/dio.dart';

class DioHelper {

  static late Dio _dio ;

  static dioInit() {
    _dio = Dio(
        BaseOptions(
            baseUrl: 'https://open.er-api.com/' ,
            receiveDataWhenStatusError: true
        )
    );
  }



  static Future<Response> getCurrencyFromApi({required String url ,}) async => await _dio.get(url);


}