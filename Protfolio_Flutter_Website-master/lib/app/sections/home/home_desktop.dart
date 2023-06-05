import 'package:mysite/core/animations/zoom_animation.dart';
import 'package:mysite/core/res/responsive_size.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter/material.dart';
import 'package:mysite/app/widgets/color_chage_btn.dart';

import 'package:mysite/changes/strings.dart';

import 'package:mysite/core/configs/configs.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SizedBox(
      height: 85.h,
      child: Stack(
        children: [
          SizedBox(
            height: 80.h,
            child: Image.network(
              "https://en.myfxchoice.com/wp-content/uploads/2021/12/home.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  width: 55.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 40,
                          width: 500,
                          color: const Color(0xff0C2150),
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.celebration, color: Color(0xff80A5ff)),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "The ERA OF The Elite Trader",
                                style: TextStyle(color: Color(0xff80A5ff)),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),

                      Text(yourname,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          )),
                      Space.y(1.w)!,
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     AnimatedTextKit(
                      //       isRepeatingAnimation: true,
                      //       repeatForever: true,
                      //       animatedTexts: desktopList,
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(miniDescription,
                            style: TextStyle(
                              fontSize: isFontSize(context, 18),
                              fontWeight: FontWeight.w400,
                              color: theme.textColor.withOpacity(0.6),
                            )),
                      ),
                      Space.y(1.w)!,
                      ColorChageButton(
                        text: 'Join the Trading Room',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const ZoomAnimations(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
