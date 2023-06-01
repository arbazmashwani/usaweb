import 'package:flutter/material.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/core/configs/others/space.dart';
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
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 200, right: 200, top: 100),
          child: Text(
            "Latest Trade Signals",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50),
          ),
        ),
        Space.y(2.w)!,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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
          padding: const EdgeInsets.only(top: 0),
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
                              elevation: cardhoverlist[e] == true ? 10 : 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 300,
                                  width: 200,
                                  child: Image.asset(
                                    "assets/imgs/signals.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList())),
        ),
      ],
    );
  }
}
