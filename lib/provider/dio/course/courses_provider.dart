import 'package:dio/dio.dart';
import 'package:dynoacademy/models/courses/courses_model.dart';
import 'package:flutter/material.dart';

class CoursesProvider with ChangeNotifier {
  Dio dio = Dio();

  List<CoursesModel> _courseList = [];
  List<CoursesModel> get courseList => _courseList;

  Future<void> fetchData() async {
    try {
      Response response =
          await dio.get("https://api.dynoacademy.com/api/v1/courses");
      List<CoursesModel> apiData = [];
      for (var item in response.data['data']) {
        apiData.add(CoursesModel.fromJson(item));
      }

      _courseList = apiData;
    } on DioError catch (error) {
      print(error);
    }
  }
}
