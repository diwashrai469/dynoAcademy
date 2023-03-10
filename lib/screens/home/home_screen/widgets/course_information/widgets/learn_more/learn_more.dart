import 'package:dynoacademy/models/courses/courses_model.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/learn_more/learn_more_provider.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearnMore extends StatefulWidget {
  final CoursesModel learnMoreInfo;
  const LearnMore({super.key, required this.learnMoreInfo});

  @override
  State<LearnMore> createState() => _LearnMoreState();
}

class _LearnMoreState extends State<LearnMore> {
  String firstHalf = '';
  String secondHalf = '';

  @override
  void initState() {
    if (widget.learnMoreInfo.courseInfo!.length > 100) {
      firstHalf = widget.learnMoreInfo.courseInfo!.substring(0, 100);
      secondHalf = widget.learnMoreInfo.courseInfo!
          .substring(100, widget.learnMoreInfo.courseInfo!.length);
    } else {
      firstHalf = widget.learnMoreInfo.courseInfo!;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("learn more build");
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: secondHalf.isEmpty
            ? CustomeText(
                text: firstHalf, style: Theme.of(context).textTheme.bodyMedium)
            : Column(
                children: <Widget>[
                  CustomeText(
                      text: context.watch<LearnMoreProvider>().showMore
                          ? ("$firstHalf ..... ")
                          : (firstHalf + secondHalf),
                      style: Theme.of(context).textTheme.bodyMedium),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomeText(
                          text: context.watch<LearnMoreProvider>().showMore
                              ? "Learn more"
                              : "show less",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: const Color(0xFF073763),
                                  ),
                        ),
                      ],
                    ),
                    onTap: () {
                      context.read<LearnMoreProvider>().showDetails();
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
