import 'package:dynoacademy/provider/dio/course/courses_provider.dart';
import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CourseListView extends StatefulWidget {
  const CourseListView({super.key});

  @override
  State<CourseListView> createState() => _CourseListViewState();
}

class _CourseListViewState extends State<CourseListView> {
  @override
  Widget build(BuildContext context) {
    final courseInfo = Provider.of<CoursesProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 31,
          );
        },
        itemCount: courseInfo.courseList.length,
        itemBuilder: (context, index) {
          final courseDetails = courseInfo.courseList[index];
          return SizedBox(
            height: height * 0.5,
            width: width * (377 / width),
            child: Card(
              color: Colors.grey.shade100,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                courseDetails.thumbnail.toString()),
                            fit: BoxFit.contain)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(19.0, 9, 23, 20),
                    child: CustomeText(
                      text: courseDetails.courseName.toString(),
                      fontweight: FontWeight.bold,
                      fontsize: 16,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      CupertinoIcons.person_alt_circle,
                      color: primaryColor,
                      size: 30,
                    ),
                    title: const Icon(CupertinoIcons.star_circle,
                        size: 30, color: Color(0xFFE19C16)),
                    trailing: CustomeText(
                      text: "रू ${courseDetails.cost}",
                      fontweight: FontWeight.bold,
                      fontsize: 17,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
