import 'package:flutter/material.dart';
import 'package:mysite/app/sections/Authentication/aboutpage.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';
import 'package:mysite/app/sections/Authentication/membership.dart';
import 'package:mysite/core/animations/entrance_fader.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
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
    var theme = Theme.of(context);
    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple : null,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onHover: (value) {
            setState(() => isHover = value);
          },
          onTap: () {
            if (widget.index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            } else if (widget.index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            } else if (widget.index == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardScreen(
                            index: 2,
                          )));
            } else if (widget.index == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            } else {
              scrollProvider.jumpTo(widget.index);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              widget.label,
              style: TextStyle(color: theme.textColor),
            ),
          ),
        ),
      ),
    );
  }
}
