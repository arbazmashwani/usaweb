import 'package:flutter/material.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // theme
    var theme = Theme.of(context);
    //
    var textSty = TextStyle(
      color: theme.textColor,
      fontWeight: FontWeight.w100,
      fontSize: Responsive.isDesktop(context) ? 32 : 20,
    );

    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            child: Image.asset(
              "assets/imgs/TradeXGreen.png",
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: VerticalDivider(
              color: Colors.white,
              thickness: 1,
            ),
          ),
          Text(
            "The Enlightened",
            style: TextStyle(
                color: const Color(0xff999999),
                fontWeight: FontWeight.w100,
                fontSize: 16),
          )
        ],
      ),
    );
  }
}
