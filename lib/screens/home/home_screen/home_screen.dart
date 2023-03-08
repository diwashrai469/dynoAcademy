import 'package:dynoacademy/provider/dio/course/courses_provider.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_list/course_list_view.dart';
import 'package:dynoacademy/theme/app_theme.dart';
import 'package:dynoacademy/constant/constant.dart';
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
        padding: Constant().screenPadding,
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
                          borderRadius: BorderRadius.circular(
                              Constant().boarderCircularSize),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Constant().boarderCircularSize),
                          borderSide: BorderSide(
                            color:AppTheme().primaryColor,
                          ),
                        ),
                        hintText: "Search Your Courses here...",
                        suffixIcon: const Icon(CupertinoIcons.search),
                        hintStyle: Constant().mainFont(fontSize: 12)))),
            const SizedBox(
              height: 10,
            ),
            CustomeText(
              style: Theme.of(context).textTheme.titleLarge,
              text: "Most Popular Course",
            ),
            CustomeText(
                style: Theme.of(context).textTheme.bodyMedium,
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
