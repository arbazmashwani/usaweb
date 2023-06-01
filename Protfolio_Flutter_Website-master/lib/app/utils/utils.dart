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
    const TradeInformationPage(),
    const Services(),
    const ExperiencePage(),
    const CallRequest(),

    const ReviewsPage(),

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
                  ))
                ],
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      color: Colors.red,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  "Please Remember That CFds and products and offered on this website are complex derriative  and may ot be suitable for all clients , trading in these products carries a substantial risk of losing money"),
                            )),
                          ],
                        ),
                        Row(
                          children: const [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  "Please Remember That CFds and products and offered on this website are complex derriative  and may ot be suitable for all clients , trading in these products carries a substantial risk of losing money"),
                            )),
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    )
  ];
}
