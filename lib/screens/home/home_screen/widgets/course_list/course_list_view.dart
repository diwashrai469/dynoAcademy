import 'package:dynoacademy/provider/dio/course/courses_provider.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/course_information.dart';
import 'package:dynoacademy/theme/app_theme.dart';
import 'package:dynoacademy/constant/constant.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:numeral/numeral.dart';
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
    final allCourseData = Provider.of<CoursesProvider>(context);
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
        itemCount: allCourseData.courseList.length,
        itemBuilder: (context, index) {
          final courseDetails = allCourseData.courseList[index];

          return SizedBox(
            height: height * 0.5,
            width: width * (377 / width),
            child: Hero(
              tag: courseDetails.sId.toString(),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                          create: (_) => CoursesProvider(),
                          child:
                              CourseInformation(courseDetails: courseDetails)),
                    ),
                  );
                },
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                          text: courseDetails.courseName.toString(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                            child: Icon(
                              CupertinoIcons.person_alt_circle,
                              color: AppTheme().lightTheme.primaryColor,
                              size: 30,
                            ),
                          ),
                          CustomeText(
                            text: Numeral(courseDetails.studentsEnrolled as num)
                                .format(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                            child: Icon(CupertinoIcons.star_circle,
                                size: 30, color: Color(0xFFE19C16)),
                          ),
                          CustomeText(
                            text: courseDetails.rating.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Padding(
                            padding: Constant().mainPadding,
                            child: CustomeText(
                                text: "रू ${courseDetails.cost}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontSize: 17)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
