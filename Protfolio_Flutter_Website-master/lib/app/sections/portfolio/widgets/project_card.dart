import 'package:flutter/material.dart';
import 'package:mysite/app/utils/project_utils.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

class ProjectCard extends StatefulWidget {
  final ProjectUtils project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);
  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (isHovering) {
        if (isHovering) {
          setState(() => isHover = true);
        } else {
          setState(() => isHover = false);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        width: Responsive.isDesktop(context) ? 30.w : 70.w,
        height: 36.h,
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple : grayBack,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: isHover ? const EdgeInsets.all(20) : EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !isHover
                      ? Container()
                      : Image.asset(
                          widget.project.icons,
                          height: height * 0.05,
                        ),
                  SizedBox(height: height * 0.02),
                  !isHover
                      ? Container()
                      : Text(
                          widget.project.titles,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isHover ? whiteColor : theme.textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                  SizedBox(height: height * 0.01),
                  !isHover
                      ? Container()
                      : Text(
                          widget.project.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isHover ? whiteColor : theme.textColor,
                          ),
                        ),
                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHover ? 0.1 : 1.0,
              child: SizedBox(
                width: Responsive.isDesktop(context) ? 30.w : 70.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.project.titles,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: isHover ? whiteColor : Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset(widget.project.titles == "Forex"
                          ? "assets/imgs/forex.png"
                          : widget.project.titles == "Bitcoin"
                              ? "assets/imgs/btc.png"
                              : "assets/imgs/barsofgold.png"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
