import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class LearnMore extends StatefulWidget {
 final  learnMoreInfo;
  const LearnMore({super.key, this.learnMoreInfo});

  @override
  State<LearnMore> createState() => _LearnMoreState();
}

class _LearnMoreState extends State<LearnMore> {
  String firstHalf = '';
  String secondHalf = '';
  bool showMore = true;

  @override
  void initState() {
    // TODO: implement initState
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
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: secondHalf.isEmpty
            ? CustomeText(
                text: firstHalf,
                color: const Color(0xFF1E1E1E),
                fontweight: FontWeight.w500,
                fontsize: 14,
              )
            : Column(
                children: <Widget>[
                  CustomeText(
                    text: showMore
                        ? ("$firstHalf ..... ")
                        : (firstHalf + secondHalf),
                    color: const Color(0xFF1E1E1E),
                    fontweight: FontWeight.w500,
                    fontsize: 14,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomeText(
                          text: showMore ? "Learn more" : "show less",
                          color: const Color(0xFF073763),
                          fontweight: FontWeight.w500,
                          fontsize: 14,
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        showMore = !showMore;
                      });
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
