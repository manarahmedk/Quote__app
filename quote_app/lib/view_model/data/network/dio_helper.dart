import 'package:dio/dio.dart';
import 'package:quote_app/view_model/data/network/end_points.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      headers: {},
    ));
  }

  static Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      Response? response =await dio?.get(
        endPoint,
        data: body,
        queryParameters: parameters,
      );
      return response!;
    } catch (e) {
      rethrow;
    }
  }
}
