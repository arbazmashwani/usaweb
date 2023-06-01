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
          const Padding(
            padding: EdgeInsets.only(left: 200, right: 200, top: 100),
            child: Text(
              "Our wide range of products caters to a broad spectrum of traders",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
          ),
          Space.y(2.w)!,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "The markets we offer",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ],
          ),

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
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: SizedBox(
                height: 400,
                child: Row(
                  children: [
                    Expanded(child: ProjectCard(project: projectUtils[0])),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(child: ProjectCard(project: projectUtils[1])),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(child: ProjectCard(project: projectUtils[2])),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(child: ProjectCard(project: projectUtils[2])),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(child: ProjectCard(project: projectUtils[2])),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
