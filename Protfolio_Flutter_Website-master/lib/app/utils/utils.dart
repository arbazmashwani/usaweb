import 'package:flutter/material.dart';
import 'package:mysite/app/sections/callrequest/callrequest.dart';
import 'package:mysite/app/sections/contact/contact.dart';
import 'package:mysite/app/sections/experienced/experiencepage.dart';
import 'package:mysite/app/sections/home/home.dart';
import 'package:mysite/app/sections/portfolio/portfolio.dart';
import 'package:mysite/app/sections/reviews/reviewspage.dart';
import 'package:mysite/app/sections/services/services.dart';
import 'package:mysite/app/sections/tradeinfo/services.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/widgets/footer.dart';

class BodyUtils {
  static List<Widget> views = [
    const HomePage(),
    // About(),
    const Portfolio(),

    const ReviewsPage(),
    const TradeInformationPage(),
    const Services(),
    const ExperiencePage(),
    const CallRequest(),

    const Contact(),
    const Footer(),
    Container(
      child: Container(
        height: 300,
        width: double.infinity,
        color: const Color(0xff0C2428),
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: IntrinsicHeight(
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
                            const Text(
                              "The Enlightened",
                              style: TextStyle(
                                  color: Color(0xff999999),
                                  fontWeight: FontWeight.w100,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 50,
                        children: contactUtils
                            .asMap()
                            .entries
                            .map((e) => IconButton(
                                  icon: Image.network(e.value.icon,
                                      color: Colors.white),
                                  onPressed: () {},
                                  highlightColor: Colors.white54,
                                  iconSize: 21,
                                ))
                            .toList()),
                  )),
                ],
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 400,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Developed by ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      " © 2023",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )
  ];
}
