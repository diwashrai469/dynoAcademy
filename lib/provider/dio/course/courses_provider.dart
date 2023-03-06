import 'package:dio/dio.dart';
import 'package:dynoacademy/models/courses/courses_model.dart';
import 'package:dynoacademy/provider/dio/dio.dart';
import 'package:flutter/material.dart';

class CoursesProvider with ChangeNotifier {
  Dio dio = getDioInstance();

  List<CoursesModel> _courseList = [];
  List<CoursesModel> get courseList => _courseList;

  Future<void> fetchData() async {
    try {
      Response response = await dio.get("/courses");

      List<CoursesModel> apiData = [];
      for (var item in response.data['data']) {
        apiData.add(CoursesModel.fromJson(item));
        print("sucessfull");
      }

      _courseList = apiData;
    } on DioError catch (error) {
      print(error);
    }
  }
}
