import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/app/widgets/arrow_on_top.dart';
import 'package:mysite/core/color/colors.dart';

import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/theme/cubit/theme_cubit.dart';

import 'package:mysite/my_site.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      appBar: AppBar(
        title: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  thickness: 2,
                ),
              ),
              Text(
                "The Enlightened",
                style: TextStyle(
                  color: const Color(0xff999999),
                  fontWeight: FontWeight.w100,
                  fontSize: Responsive.isDesktop(context) ? 20 : 16,
                ),
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                top: height * 0.2,
                left: -88,
                child: Container(
                  height: height / 3,
                  width: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      height: 166,
                      width: 166,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: -100,
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 500,
                      sigmaY: 500,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              if (!state.isDarkThemeOn)
                Align(
                  alignment: Alignment.center,
                  // BG01.png
                  child: Image.asset(
                    'assets/imgs/5424482.JPG',
                    opacity: const AlwaysStoppedAnimation<double>(0.2),
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: const [
                            Text(
                              "About Me",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: const [
                            Text(
                              "TradeX-The Enlightened",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          color: Colors.white,
                          height: 200,
                          width: double.infinity,
                          child: Image.network(
                            "https://bbioon.com/about_me/blog/wp-content/uploads/2016/11/pexels-photo-1-1000x550.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Alec Markarian",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                ),
                                Text("15/May/1990"),
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
                                Text("Trade"),
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
                                Text("1332"),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Text(
                          "I Alec Markarian, an experienced day trader with over 5 years of trading experience at age 24 have reached the summit of abilities to analyze markets and critically make high quality decisions to grow trading accounts and in my journey I have decided to help out the community of people looking to learn how to trade and experts looking to take their trading to the next level and have a breakthrough, and I offer a multitude of services, from Forex Signals, I sell a very powerful Algorithm that you can incorporte with many different trading styles, and also offer education with daily in-depth market analysis and in the future will be making educational video content and private livestreams of my trades.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Contact Us",
                            style: TextStyle(
                                color: Colors.white,
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
                                color: Colors.white,
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
                                color: Colors.white,
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
                                color: Colors.white,
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
                                color: Colors.white,
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
                                color: Colors.white,
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
                                filled: true, fillColor: Colors.grey[200]),
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
                                color: Colors.white,
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
                                filled: true, fillColor: Colors.grey[200]),
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
                                color: Colors.white,
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
                                filled: true, fillColor: Colors.grey[200]),
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
                                  borderRadius: BorderRadius.circular(12)),
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
