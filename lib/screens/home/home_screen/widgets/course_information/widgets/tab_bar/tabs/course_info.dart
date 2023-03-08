import 'package:dynoacademy/models/courses/courses_model.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class CourseInfo extends StatelessWidget {
  final CoursesModel courseDetails;
  const CourseInfo({super.key, required this.courseDetails});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        CustomeText(
          text: courseDetails.courseInfo ?? "",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 23,
        ),
        CustomeText(
          text: "About Course:",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        CustomeText(
          text: parse(courseDetails.courseDescription ?? "").body!.text,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
