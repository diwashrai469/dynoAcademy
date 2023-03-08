import 'package:dynoacademy/models/courses/courses_model.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tab_bar_options.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/enroll_rating_price/enroll_rating_price.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/learn_more/learn_more.dart';
import 'package:dynoacademy/theme/app_theme.dart';
import 'package:dynoacademy/constant/constant.dart';
import 'package:dynoacademy/widgets/custom/custom_button.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/learn_more/learn_more_provider.dart';

class CourseInformation extends StatefulWidget {
  final CoursesModel courseDetails;
  const CourseInformation({
    super.key,
    required this.courseDetails,
  });

  @override
  State<CourseInformation> createState() => _CourseInformationState();
}

class _CourseInformationState extends State<CourseInformation> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Color(0xFF000000)),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Hero(
            tag: widget.courseDetails.sId.toString(),
            child: Padding(
                padding: Constant().screenPadding,
                child: SingleChildScrollView(
                  child: Material(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 69,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: height * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(widget
                                          .courseDetails.thumbnail
                                          .toString()),
                                      fit: BoxFit.contain)),
                            ),
                            Positioned(
                                left: 136,
                                top: 67,
                                child: Center(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(255, 27, 28, 30),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 5,
                                              spreadRadius: 4)
                                        ]),
                                    child: const Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        Padding(
                          padding: Constant().mainPadding,
                          child: Center(
                            child: CustomeText(
                              text: "Preview this course",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),

                        CustomeText(
                          text: widget.courseDetails.courseName.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        ChangeNotifierProvider(
                          create: (_) => LearnMoreProvider(),
                          child: LearnMore(learnMoreInfo: widget.courseDetails),
                        ), // GETS ALL INFO WHEN CLICK LEARN MORE

                        EnrollRatingPrice(courseDetails: widget.courseDetails),
                        const SizedBox(
                          height: 17,
                        ),
                        CustomeText(
                          text:
                              "Instructor: ${widget.courseDetails.mentorId?.name}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Padding(
                          padding: Constant().mainPadding,
                          child: CustomeText(
                              text:
                                  "रू ${widget.courseDetails.cost.toString()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20)),
                        ),
                        SizedBox(
                            width: width,
                            child: CustomButton(
                                color: AppTheme().primaryColor,
                                text: "Enroll Now")),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: width,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: AppTheme().primaryColor)))),
                            child: CustomeText(
                              text: "Add To Cart",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TabBarOptions(courseDetails: widget.courseDetails),
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
