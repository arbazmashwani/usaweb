import 'package:flutter/material.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:mysite/my_site.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      // padding: Space.all(1, 1),
      // padding: EdgeInsets.symmetric(horizontal: AppDimensions.normalize(30)),

      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 200, right: 200, top: 100),
            child: Text(
              "\nJoin Our Community",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
          ),

          Space.y(1.w)!,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "If you want to avail our services , Subsrcribe service now",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ],
          ),

          Space.y(2.w)!,
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Container(
              padding: EdgeInsets.all(size.width * 0.05).copyWith(bottom: 10),
              decoration: BoxDecoration(
                color: const Color(0xff1C4BBA),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contactHeadding,
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 6.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Space.y(1.w)!,
                          Text(
                            contactSubHeadding,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Space.y(2.w)!,
                          // SizedBox(height: AppDimensions.space(3)),
                        ],
                      ),
                      InkWell(
                        onTap: () => {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                              gradient: buttonGradi,
                              // border: Border.all(
                              //     width: 2.0, color: theme.primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Discord Community',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(color: Colors.white.withOpacity(0.2), height: 1),
                  Space.y(2.w)!,
                  const Text("Follow us on the Socail Media Platforms"),
                  Space.y(2.w)!,
                  Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 50,
                      children: contactUtils
                          .asMap()
                          .entries
                          .map((e) => IconButton(
                                icon: Image.network(
                                  e.value.icon,
                                  color: theme.textColor,
                                ),
                                onPressed: () {},
                                highlightColor: Colors.white54,
                                iconSize: 21,
                              ))
                          .toList()),
                ],
              ),
            ),
          ),
          // Space.y!,
        ],
      ),
    );
  }
}
