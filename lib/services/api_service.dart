import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> postData(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      return response;
    } catch (e) {
      throw e;
    }
  }
}
