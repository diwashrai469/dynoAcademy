import 'package:dynoacademy/provider/dio/course/courses_provider.dart';
import 'package:dynoacademy/screens/home/homeScreen/widgets/courseList/course_list_view.dart';
import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
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
            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(boarderCircularSize),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(boarderCircularSize),
                          borderSide: const BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        hintText: "Search Your Courses here...",
                        suffixIcon: const Icon(CupertinoIcons.search),
                        hintStyle: mainFont(fontSize: 12)))),
            const SizedBox(
              height: 10,
            ),
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
                    future: context.watch<CoursesProvider>().fetchData(),
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
                      return const CourseListView();
                    }),
              ),
            )
          ],
        ),
      )),
    );
  }
}
