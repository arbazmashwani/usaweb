import 'package:flutter/material.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/core/configs/others/space.dart';
import 'package:sizer/sizer.dart';

class ReviewsDesktop extends StatelessWidget {
  const ReviewsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Space.y(4.w)!,
        const CustomSectionHeading(text: "What Clients Say"),
        const CustomSectionSubHeading(
            text: "The Reviews of Super Members Clients"),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: SizedBox(
              height: 600,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: Container(
                        height: 450,
                        color: Colors.white,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 50,
                              right: 50,
                              top: -60,
                              child: CircleAvatar(
                                radius: 60,
                                child: ClipOval(
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7I14mBT2c98BdiVLoa5Pjpw-b_gTiWlrOUA&usqp=CAU",
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              right: 50,
                              bottom: 0,
                              top: 0,
                              child: Column(
                                children: const [
                                  SizedBox(
                                    height: 70,
                                  ),
                                  Text(
                                    "Arbaz Mashwani",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Hammad164598@gmail.com",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color(0xffF8B600),
                                    child: Icon(
                                      Icons.reviews_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: Container(
                        height: 450,
                        color: Colors.white,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 50,
                              right: 50,
                              top: -60,
                              child: CircleAvatar(
                                radius: 60,
                                child: ClipOval(
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7I14mBT2c98BdiVLoa5Pjpw-b_gTiWlrOUA&usqp=CAU",
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              right: 50,
                              bottom: 0,
                              top: 0,
                              child: Column(
                                children: const [
                                  SizedBox(
                                    height: 70,
                                  ),
                                  Text(
                                    "Arbaz Mashwani",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Hammad164598@gmail.com",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color(0xffF8B600),
                                    child: Icon(
                                      Icons.reviews_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: Container(
                        height: 450,
                        color: Colors.white,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 50,
                              right: 50,
                              top: -60,
                              child: CircleAvatar(
                                radius: 60,
                                child: ClipOval(
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7I14mBT2c98BdiVLoa5Pjpw-b_gTiWlrOUA&usqp=CAU",
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              right: 50,
                              bottom: 0,
                              top: 0,
                              child: Column(
                                children: const [
                                  SizedBox(
                                    height: 70,
                                  ),
                                  Text(
                                    "Arbaz Mashwani",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Hammad164598@gmail.com",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color(0xffF8B600),
                                    child: Icon(
                                      Icons.reviews_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              )),
        ),
      ],
    );
  }
}
