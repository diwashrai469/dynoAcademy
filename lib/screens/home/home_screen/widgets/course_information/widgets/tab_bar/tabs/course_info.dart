import 'package:dynoacademy/models/courses/courses_model.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class CourseInfo extends StatelessWidget {
  final CoursesModel courseDetails;
  const CourseInfo({super.key, required this.courseDetails});

  @override
  Widget build(BuildContext context) {
    const Color textColor = Color(0xFF454545);
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        CustomeText(
          text: courseDetails.courseInfo ?? "",
          fontweight: FontWeight.w500,
          fontsize: 14,
          color: textColor,
        ),
        const SizedBox(
          height: 23,
        ),
        const CustomeText(
          text: "About Course:",
          fontsize: 14,
          fontweight: FontWeight.w500,
          color: textColor,
        ),
        CustomeText(
          text: parse(courseDetails.courseDescription ?? "").body!.text,
          fontsize: 14,
          fontweight: FontWeight.w500,
          color: textColor,
        )
      ],
    );
  }
}
