import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;
  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  void post() async {
    final String name;
   Map<String,dynamic> data = {
      "key1": "value1",
    };
    Response response = await dio.post(
      'path', data: data,options: Options(headers: data )
    );
    if (response.statusCode == 200) {
      print('POST request successful');
      print(response.data);
    } else {
      print('POST request failed with status code: ${response.statusCode}');
    }

  
  }
}
