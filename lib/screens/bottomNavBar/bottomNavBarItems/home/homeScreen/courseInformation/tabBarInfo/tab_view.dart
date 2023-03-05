import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class TabBarInfo extends StatefulWidget {
  const TabBarInfo({super.key});

  @override
  State<TabBarInfo> createState() => _TabBarInfoState();
}

class _TabBarInfoState extends State<TabBarInfo> with TickerProviderStateMixin {
  Color colors = Color.fromRGBO(69, 69, 69, 1);
  @override
  Widget build(BuildContext context) {
    TabController _controller = TabController(length: 5, vsync: this);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBar(isScrollable: true, controller: _controller, tabs: [
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
        ]),
      ),
    );
  }
}
