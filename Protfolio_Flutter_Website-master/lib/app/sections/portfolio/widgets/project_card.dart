import 'package:flutter/material.dart';
import 'package:mysite/app/utils/project_utils.dart';

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
            if (mounted) {
              setState(() => isHover = true);
            }
          } else {
            if (mounted) {
              setState(() => isHover = false);
            }
          }
        },
        child: Card(
          elevation: isHover == true ? 10 : 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                12.0), // Adjust the value as per your preference
          ),
          child: Container(
            width: 100,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xffF4F6F9))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: Image.network(widget.project.titles == "Forex"
                            ? "https://en.myfxchoice.com/wp-content/themes/fxnew/images/markets/currencies.png"
                            : widget.project.titles == "Bitcoin"
                                ? "https://en.myfxchoice.com/wp-content/themes/fxnew/images/markets/crypto.png"
                                : "https://en.myfxchoice.com/wp-content/themes/fxnew/images/markets/indices.png"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        widget.project.titles,
                        style: TextStyle(
                            color: isHover == true
                                ? const Color(0xff1C4BBA)
                                : Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 22),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.project.description,
                            maxLines: 4,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff8d99b5),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "Fint out more",
                            style: TextStyle(
                                color: isHover == true
                                    ? const Color(0xff1C4BBA)
                                    : Color(0xff8d99b5),
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 15,
                          color: isHover == true
                              ? const Color(0xff1C4BBA)
                              : Color(0xff8d99b5),
                        )
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
