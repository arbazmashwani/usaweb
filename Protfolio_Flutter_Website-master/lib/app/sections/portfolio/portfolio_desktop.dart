import 'package:flutter/material.dart';
import 'package:mysite/app/utils/project_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

import 'widgets/project_card.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          const CustomSectionHeading(text: "Markets"),
          Space.y(2.w)!,
          const CustomSectionSubHeading(
              text:
                  "We are educating people on trading forex, providing signals, and selling a revolutionary algorithm."),

          // Wrap(
          //   alignment: WrapAlignment.start,
          //   crossAxisAlignment: WrapCrossAlignment.start,
          //   runSpacing: 1.w,
          //   children: projectUtils
          //       .asMap()
          //       .entries
          //       .map(
          //         (e) => ProjectCard(project: e.value),
          //       )
          //       .toList(),
          // ),
          Space.y(2.w)!,
          SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(child: ProjectCard(project: projectUtils[0])),
                  Expanded(child: ProjectCard(project: projectUtils[1])),
                  Expanded(child: ProjectCard(project: projectUtils[2])),
                ],
              )),
        ],
      ),
    );
  }
}
