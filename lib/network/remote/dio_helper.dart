import 'package:dio/dio.dart';


class DioHelper
{
  static Dio dio = Dio(
    BaseOptions(
        baseUrl: "",
        receiveDataWhenStatusError: true,
        headers: {}
    ),
  );

  static init ()
  {

  }

   Future<Response> getData({
    required  url,
     Map<String, dynamic>? query,
}) async
{
 return await dio.get(url, queryParameters: query, );
}

  Future<Response> postData({
      url,
    required Map<String, dynamic> query,
    required Map<String, dynamic> data,
  }) async
  {
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

}