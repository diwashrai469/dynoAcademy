import 'package:dynoacademy/screens/home/homeScreen/widgets/courseInformation/tabBar/tab_view.dart';
import 'package:dynoacademy/screens/home/homeScreen/widgets/courseInformation/tabBar/widgets/grid_tile.dart';
import 'package:dynoacademy/screens/home/homeScreen/widgets/courseInformation/tabBar/widgets/learn_more.dart';
import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:dynoacademy/widgets/custom/custom_button.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

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
                padding: pagePadding,
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
                        const Padding(
                          padding: mainPadding,
                          child: Center(
                            child: CustomeText(
                              text: "Preview this course",
                              fontsize: 14,
                              color: Color(0xFF1E1E1E),
                              fontweight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: mainPadding,
                          child: CustomeText(
                            text: widget.courseDetails.courseName.toString(),
                            fontweight: FontWeight.bold,
                            color: const Color(0xFF000000),
                            fontsize: 16,
                          ),
                        ),
                        LearnMore(
                            learnMoreInfo: widget
                                .courseDetails), // GETS ALL INFO WHEN CLICK LEARN MORE

                        GridTileView(courseDetails: widget.courseDetails),
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
                          padding: mainPadding,
                          child: CustomeText(
                            text: "रू ${widget.courseDetails.cost.toString()}",
                            fontsize: 20,
                            fontweight: FontWeight.w500,
                            color: const Color.fromRGBO(69, 69, 69, 1),
                          ),
                        ),
                        SizedBox(
                            width: width,
                            child: const CustomButton(
                                color: primaryColor, text: "Enroll Now")),
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
                                        side: const BorderSide(
                                            color: primaryColor)))),
                            child: const CustomeText(
                              text: "Add To Cart",
                              fontweight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TabBarInfo(),

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
