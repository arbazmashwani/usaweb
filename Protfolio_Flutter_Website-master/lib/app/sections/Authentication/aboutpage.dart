import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mysite/app/sections/Authentication/loginmain.dart';

import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/utils/navbar_utils.dart';

import 'package:mysite/app/widgets/arrow_on_top.dart';
import 'package:mysite/app/widgets/color_chage_btn.dart';
import 'package:mysite/app/widgets/navbar_actions_button.dart';
import 'package:mysite/app/widgets/navbar_logo.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/core/apis/links.dart';
import 'package:mysite/core/configs/others/space.dart';

import 'package:mysite/core/providers/drawer_provider.dart';
import 'package:mysite/core/providers/scroll_provider.dart';

import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/theme/app_theme.dart';
import 'package:mysite/core/theme/cubit/theme_cubit.dart';
import 'package:mysite/core/util/constants.dart';

import 'package:mysite/my_site.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
part 'widgets/_navbar_desktop.dart';
part 'widgets/_mobile_drawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Responsive(
          desktop: _NavbarDesktop(),
          mobile: _NavBarTablet(),
          tablet: _NavBarTablet(),
        ),
      ),
      drawer: !Responsive.isDesktop(context) ? const _MobileDrawer() : null,
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Container(
                                  height: 700,
                                  color: Colors.white,
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.center,
                                    // BG01.png
                                    child: Image.asset(
                                      'assets/imgs/5424482.JPG',
                                      opacity:
                                          const AlwaysStoppedAnimation<double>(
                                              0.2),
                                      width: width,
                                      height: height + 100,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 30,
                                    left: 200,
                                    child: Container(
                                      child: Image.network(
                                        "https://deriv.com/static/7cd14cfb25bb480c8279b7cd3eec3d5b/b85d4/about_us_logo.webp",
                                      ),
                                    )),
                                const Positioned(
                                    top: 200,
                                    left: 10,
                                    child: Text(
                                      "Who i am?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 130),
                                    )),
                                const Positioned(
                                  top: 400,
                                  left: 30,
                                  child: Text(
                                    "Alec Markarian",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 42,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Positioned(
                                  top: 450,
                                  left: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.calendar_month,
                                              color: Colors.white,
                                            ),
                                            Text("15/May/1990",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.folder,
                                              color: Colors.white,
                                            ),
                                            Text("Trade",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.power,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "1332",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Text(
                                "I Alec Markarian, an experienced day trader with over 5 years of trading experience at age 24 have reached the summit of abilities to analyze markets and critically make high quality decisions to grow trading accounts and in my journey I have decided to help out the community of people looking to learn how to trade and experts looking to take their trading to the next level and have a breakthrough, and I offer a multitude of services, from Forex Signals, I sell a very powerful Algorithm that you can incorporte with many different trading styles, and also offer education with daily in-depth market analysis and in the future will be making educational video content and private livestreams of my trades.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Text(
                                "I offer CFDs and other derivatives on forex, stocks & indices, cryptocurrencies, commodities, and derived to millions of registered users across the globe.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Text(
                                "From inception, My goal was to break free of the high commissions and clunky products offered by traditional brokers. Also, I aim to deliver a first-class experience to digitally inclined traders, regardless of the size of their accounts.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Text(
                                "In a journey spanning more than 22 years, we have grown to over 2.5 million customers worldwide. But our mission has remained the same.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Make trading accessible to\nanyone, anywhere",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CarouselSlider.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int i) =>
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.5.w),
                                child: SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqNQ4qbiv6MyfuDGgE-stBHa-d8zj0KjvxMw&usqp=CAU",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                        options: CarouselOptions(
                          viewportFraction: 0.90,
                          height: 300,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          enlargeCenterPage: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          enableInfiniteScroll: false,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Text(
                                "Our principles are the framework for our decisions",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 60, right: 60, top: 30),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xff0C2428)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    child: Text(
                                      "We have a huge mission, an incredible team, and rapid growth.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 30),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 25,
                                      right: 15,
                                      bottom: 15,
                                      top: 5,
                                    ),
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Join and grow with us.",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 15,
                                        bottom: 15,
                                        top: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {},
                                            child: Container(
                                              height: 60,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.red),
                                              child: const Center(
                                                child: Text(
                                                  "Contact Us Now",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.asset("assets/imgs/men.png")),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Contact Us",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 42,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Address",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Address: 350 Fifth Avenue, 34th floor New York, NY 10118-3299 USA",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Email: info@mail.com",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Contact form",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Your Name (required)",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                    child: TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[200]),
                                )),
                                Expanded(child: Container()),
                                Expanded(child: Container()),
                              ],
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Your Email (required)",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                    child: TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[200]),
                                )),
                                Expanded(child: Container()),
                                Expanded(child: Container()),
                              ],
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  "Subject",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                    child: TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[200]),
                                )),
                                Expanded(child: Container()),
                                Expanded(child: Container()),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  child: Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                      child: Text(
                                        "Send",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 60,
                                              child: (kDebugMode)
                                                  ? Image.asset(
                                                      "imgs/TradeXGreen.png",
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.asset(
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
                                                  icon: Image.network(
                                                      e.value.icon,
                                                      color: Colors.white),
                                                  onPressed: () {},
                                                  highlightColor:
                                                      Colors.white54,
                                                  iconSize: 21,
                                                ))
                                            .toList()),
                                  ))
                                ],
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 100, right: 100),
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
                      )
                    ],
                  ),
                ),
              ),
              const ArrowOnTop()
            ],
          );
        },
      ),
    );
  }
}

fetchmydetails(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("uid").toString() != "null") {
    await Provider.of<UserProvider>(context, listen: false)
        .fetchUserDetails(prefs.getString("uid").toString());
  }
}
