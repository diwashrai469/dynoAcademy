import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:numeral/numeral.dart';

class EnrollReviewsPrice extends StatelessWidget {
  final courseDetails;
  const EnrollReviewsPrice({super.key, this.courseDetails});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: Icon(
              CupertinoIcons.person_alt_circle,
              size: 30,
              color: Color(0xFF4F91CD),
            ),
          ),
          CustomeText(
            text: numeral(courseDetails.studentsEnrolled!),
            color: const Color(0xFF454545),
            fontsize: 12,
            fontweight: FontWeight.w500,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: Icon(CupertinoIcons.star_circle,
                size: 30, color: Color(0xFFE19C16)),
          ),
          CustomeText(
            text: courseDetails.rating.toString(),
            color: const Color(0xFF454545),
            fontsize: 12,
            fontweight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
