import "package:dio/dio.dart";

Dio getDioInstance() {
  Dio dio = Dio(BaseOptions(baseUrl: "https://api.dynoacademy.com/api/v1"));

  return dio;
}
