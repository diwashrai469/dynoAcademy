import 'package:dynoacademy/models/courses/courses_model.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tabs/course_info.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tabs/progress_and_certification.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tabs/q&a.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tabs/reviews.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tabs/syllabus.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class TabBarOptions extends StatefulWidget {
  final CoursesModel courseDetails;
  const TabBarOptions({Key? key, required this.courseDetails})
      : super(
          key: key,
        );

  @override
  State<TabBarOptions> createState() => _TabBarInfoState();
}

class _TabBarInfoState extends State<TabBarOptions>
    with TickerProviderStateMixin {
  Color colors = const Color.fromRGBO(69, 69, 69, 1);

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40,
          child: Card(
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              tabs: [
                CustomeText(
                  text: "Course Details",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CustomeText(
                  text: "Syllabus",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CustomeText(
                  text: "Q&A",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CustomeText(
                  text: "Reviews",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CustomeText(
                  text: "Progress & certification",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: tabController,
            children: [
              CourseInfo(courseDetails: widget.courseDetails),
              const Syllabus(),
              const QuestionAndAnswer(),
              const Reviews(),
              const ProgressAndCertification(),
            ],
          ),
        ),
      ],
    );
  }
}
