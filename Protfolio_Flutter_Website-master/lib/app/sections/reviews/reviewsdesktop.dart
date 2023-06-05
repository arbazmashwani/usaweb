import 'package:flutter/material.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/core/configs/others/space.dart';
import 'package:mysite/dahboardscreens/algoritham/linechart.dart';
import 'package:sizer/sizer.dart';

class ReviewsDesktop extends StatefulWidget {
  const ReviewsDesktop({Key? key}) : super(key: key);

  @override
  State<ReviewsDesktop> createState() => _ReviewsDesktopState();
}

class _ReviewsDesktopState extends State<ReviewsDesktop> {
  List<bool> cardhoverlist = List.generate(6, (index) => false).toList();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 200, right: 200, top: 100),
          child: Text(
            "Our Last Signals",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50),
          ),
        ),
        Space.y(2.w)!,
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Lorem njasdbhgbvhyubhj hbsahubhibj hshghuguhic gayhugyhubvhjdwjwda sghyughubcsad gyhuvbhjasdbh",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
              height: 300,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [0, 1, 2, 3, 4, 5]
                      .map((e) => InkWell(
                            onTap: () {},
                            onHover: (value) {
                              setState(() {
                                cardhoverlist[e] = value;
                              });
                            },
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12.0), // Adjust the value as per your preference
                                ),
                                elevation: cardhoverlist[e] == true ? 10 : 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.black12)),
                                  height: 290,
                                  width: 200,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    e.isEven ? "BUY" : "Sell",
                                                    style: TextStyle(
                                                        color: e.isEven
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 22),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Lorem njasdbhgbvhyubhj hbsahubhibj hshghuguhic",
                                                        maxLines: 4,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: Color(
                                                                0xff8d99b5),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      )),
                                      Expanded(
                                        child: SizedBox(
                                          height: 150,
                                          width: 200,
                                          child: LineChartWithShadow(
                                            data: e.isEven
                                                ? [
                                                    50,
                                                    180,
                                                    75,
                                                    120,
                                                  ]
                                                : [60, 120, 80, 30],
                                            lineColor: e.isEven
                                                ? Colors.green
                                                : Colors.red,
                                            shadowColor: e.isEven
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ))
                      .toList())),
        ),
      ],
    );
  }
}
