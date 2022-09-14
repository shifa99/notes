import 'package:dio/dio.dart';

import 'dio_helper.dart';

Future<Response> postData(
    {required String url, dynamic data,Map<String,dynamic>?quary}) async {
  return await DioHelper.postData(
      url: url, data: data,query: quary);
}

Future<Response> getData({required String url,Map<String,dynamic>?quary}) async {
  return await DioHelper.getData(url: url,query: quary);
}
