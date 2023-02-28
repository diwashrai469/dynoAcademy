import 'package:dynoacademy/provider/dio/course/courses_provider.dart';
import 'package:dynoacademy/screens/home/course_list_view.dart';
import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:dynoacademy/widgets/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final courseData = Provider.of<CoursesProvider>(context);
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
                height: mainHeight,
                width: mainWidth,
                child: CustomeTextField(
                  hintText: "Search Courses here.....",
                  labelText: "",
                )),
            const CustomeText(
              text: "Most Popular Course",
              fontweight: FontWeight.bold,
              fontsize: 20,
            ),
            const CustomeText(
                text:
                    "Check out our current offerings and stay tuned for more to come!"),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
                    future: courseData.fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("error:${snapshot.error}"),
                        );
                      }
                      return CourseListView();
                    }),
              ),
            )
          ],
        ),
      )),
    );
  }
}
