import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/tab_bar/tab_bar_options.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/enroll_reviews_price/enroll_reviews_price.dart';
import 'package:dynoacademy/screens/home/home_screen/widgets/course_information/widgets/learn_more/learn_more.dart';
import 'package:dynoacademy/theme/custom_theme.dart';
import 'package:dynoacademy/widgets/custom/custom_button.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/learn_more/learn_more_provider.dart';

class CourseInformation extends StatefulWidget {
  final courseDetails;
  const CourseInformation({
    super.key,
    this.courseDetails,
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
            tag: widget.courseDetails.sId,
            child: Padding(
                padding: CustomeTheme().pagePadding,
                child: SingleChildScrollView(
                  child: Material(
                    child: Column(
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
                                left: 132,
                                top: 62,
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
                          padding: CustomeTheme().mainPadding,
                          child: const Center(
                            child: CustomeText(
                              text: "Preview this course",
                              fontsize: 14,
                              color: Color(0xFF1E1E1E),
                              fontweight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: CustomeTheme().mainPadding,
                          child: CustomeText(
                            text: widget.courseDetails.courseName.toString(),
                            fontweight: FontWeight.bold,
                            color: const Color(0xFF000000),
                            fontsize: 16,
                          ),
                        ),
                        ChangeNotifierProvider(
                          create: (_) => LearnMoreProvider(),
                          child: LearnMore(learnMoreInfo: widget.courseDetails),
                        ), // GETS ALL INFO WHEN CLICK LEARN MORE

                        EnrollReviewsPrice(courseDetails: widget.courseDetails),
                        const SizedBox(
                          height: 17,
                        ),
                        CustomeText(
                          text:
                              "Instructor: ${widget.courseDetails.mentorId?.name}",
                          color: const Color.fromRGBO(69, 69, 69, 1),
                          fontsize: 14,
                          fontweight: FontWeight.w500,
                        ),
                        Padding(
                          padding: CustomeTheme().mainPadding,
                          child: CustomeText(
                            text: "रू ${widget.courseDetails.cost.toString()}",
                            fontsize: 20,
                            fontweight: FontWeight.w500,
                            color: const Color.fromRGBO(69, 69, 69, 1),
                          ),
                        ),
                        SizedBox(
                            width: width,
                            child: CustomButton(
                                color: CustomeTheme().primaryColor,
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
                                            color:
                                                CustomeTheme().primaryColor)))),
                            child: CustomeText(
                              text: "Add To Cart",
                              fontweight: FontWeight.w500,
                              color: CustomeTheme().primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TabBarOptions(),

                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
