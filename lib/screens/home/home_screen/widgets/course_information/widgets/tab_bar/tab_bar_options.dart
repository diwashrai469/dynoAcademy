import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tabs/course_info.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tabs/progress_and_certification.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tabs/q&a.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tabs/reviews.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tabs/syllabus.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class TabBarOptions extends StatefulWidget {
  const TabBarOptions({Key? key}) : super(key: key);

  @override
  State<TabBarOptions> createState() => _TabBarInfoState();
}

class _TabBarInfoState extends State<TabBarOptions> with TickerProviderStateMixin {
  Color colors = const Color.fromRGBO(69, 69, 69, 1);

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Card(
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            tabs: [
              CustomeText(
                text: "Course Details",
                color: colors,
                fontsize: 14,
                fontweight: FontWeight.w500,
              ),
              CustomeText(
                text: "Syllabus",
                color: colors,
                fontsize: 14,
                fontweight: FontWeight.w500,
              ),
              CustomeText(
                text: "Q&A",
                color: colors,
                fontsize: 14,
                fontweight: FontWeight.w500,
              ),
              CustomeText(
                text: "Reviews",
                color: colors,
                fontsize: 14,
                fontweight: FontWeight.w500,
              ),
              CustomeText(
                text: "Progress & certification",
                color: colors,
                fontsize: 14,
                fontweight: FontWeight.w500,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: TabBarView(
            controller: tabController,
            children: const [
              CourseInfo(),
              Syllabus(),
              QuestionAndAnswer(),
              Reviews(),
              ProgressAndCertification(),
            ],
          ),
        ),
      ],
    );
  }
}
