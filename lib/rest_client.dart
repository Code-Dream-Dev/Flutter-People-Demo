import 'package:dio/dio.dart';
import 'package:flutter_people_demo/models/person.dart';

class RestClient {

  Dio _dio;

  static final RestClient _singleton = RestClient._internal();

  factory RestClient() {
    return _singleton;
  }

  RestClient._internal() {
    init();
  }

  void init() async {
    _dio = Dio();

    _dio.options.baseUrl = "https://randomuser.me/api/";
    _dio.options.validateStatus = (status) => status < 300 && status >= 200;
  }

  Future<List<Person>> getPeople(int number) async {
    try {
      Response response = await _dio.get("", queryParameters: {"results": number});
      return response.data["results"].map<Person>((jsonItem) => Person.fromJson(jsonItem)).toList();
    } on DioError catch (e) {
      throw e;
    }
  }
}