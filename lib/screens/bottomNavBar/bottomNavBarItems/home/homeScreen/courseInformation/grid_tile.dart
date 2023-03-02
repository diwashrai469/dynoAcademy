import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';

class GridTileView extends StatelessWidget {
  final courseDetails;
  const GridTileView({super.key, this.courseDetails});

  @override
  Widget build(BuildContext context) {
    return GridTileBar(
      leading: Row(
        children: [
          const Icon(
            CupertinoIcons.chart_bar_circle,
            size: 30,
            color: Color(0xFF4BAB43),
          ),
          CustomeText(
            text: "Level:${courseDetails.skillLevel}",
            color: const Color(0xFF454545),
            fontsize: 12,
            fontweight: FontWeight.w500,
          ),
        ],
      ),
      title: Row(
        children: [
          const Padding(
            padding: mainPadding,
            child: Icon(
              CupertinoIcons.person_alt_circle,
              size: 30,
              color: Color(0xFF4F91CD),
            ),
          ),
          CustomeText(
            text: numeral(courseDetails.studentsEnrolled).toString(),
            color: const Color(0xFF454545),
            fontsize: 12,
            fontweight: FontWeight.w500,
          )
        ],
      ),
      trailing: Row(
        children: [
          const Icon(CupertinoIcons.star_circle,
              size: 30, color: Color(0xFFE19C16)),
          Padding(
            padding: mainPadding,
            child: CustomeText(
              text: courseDetails.rating.toString(),
              color: const Color(0xFF454545),
              fontsize: 12,
              fontweight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
