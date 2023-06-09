import 'package:flutter/material.dart';
import 'package:mysite/app/sections/Authentication/aboutpage.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';

import 'package:mysite/app/sections/Authentication/loginmain.dart';

import 'package:mysite/core/animations/entrance_fader.dart';

import 'package:mysite/core/providers/scroll_provider.dart';

import 'package:provider/provider.dart';

class NavBarActionButton extends StatefulWidget {
  final String label;
  final int index;
  const NavBarActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  State<NavBarActionButton> createState() => _NavBarActionButtonState();
}

class _NavBarActionButtonState extends State<NavBarActionButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    // theme

    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 250),
      child: Container(
        width: (MediaQuery.of(context).size.width - 120) / 5,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onHover: (value) {
            setState(() => isHover = value);
          },
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: GestureDetector(
              onTap: () {
                if (widget.index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen(
                                index: 0,
                              )));
                } else if (widget.index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen(
                                index: 1,
                              )));
                } else if (widget.index == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen(
                                index: 2,
                              )));
                } else if (widget.index == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                } else {}
              },
              // onTap: () {},
              // onHover: (hovering) {
              //   setState(() {
              //     isHover = hovering;
              //   });
              // },
              child: Text(
                widget.label,
                style: TextStyle(
                    color: isHover == true
                        ? const Color(0xff1C4BBA)
                        : Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
