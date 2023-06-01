import 'package:flutter/material.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';
import 'package:mysite/dahboardscreens/algoritham/linechart.dart';

class AlgoMainPage extends StatefulWidget {
  const AlgoMainPage({super.key});

  @override
  State<AlgoMainPage> createState() => _AlgoMainPageState();
}

class _AlgoMainPageState extends State<AlgoMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: heaveytheme,
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 20, top: 10, bottom: 20),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Algorithmic ",
                              style: TextStyle(
                                  color: Color(0xff32E9A9),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 50),
                            ),
                            Text(
                              "Trading.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 50),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(
                              "Designed for ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 50),
                            ),
                            Text(
                              "Humans.",
                              style: TextStyle(
                                  color: Color(0xff32E9A9),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 50),
                            ),
                          ],
                        ),
                        Text(
                            "Now you can use the same powerful Algorithmic-trading techniques that drives the world best hedge fund",
                            style: TextStyle(
                                color: themecolorlight,
                                fontWeight: FontWeight.w500,
                                fontSize: 20)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              child: Container(
                                height: 50,
                                width: 230,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: themecolorgreen),
                                child: Center(
                                  child: Text(
                                    "Get Started",
                                    style: TextStyle(
                                        color: heaveytheme,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 600,
            width: 400,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 500,
                    width: 590,
                    child: LineChartWithShadow(
                      data: const [
                        50,
                        100,
                        75,
                        120,
                        90,
                        270,
                        50,
                        25,
                        58,
                        150,
                        50,
                        120,
                        90,
                        150,
                        100,
                        25,
                        58,
                        300,
                      ],
                      lineColor: themecolorgreen,
                      shadowColor: themecolorgreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Color themecolorgreen = const Color(0xff32E9A9);
