import 'package:flutter/material.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:sizer/sizer.dart';

class CallrequestDesktop extends StatelessWidget {
  const CallrequestDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      // padding: Space.all(1, 1),
      // padding: EdgeInsets.symmetric(horizontal: AppDimensions.normalize(30)),
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        children: [
          Space.y(2.w)!,
          Container(
            padding: EdgeInsets.all(size.width * 0.05).copyWith(bottom: 10),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Request a Call Back",
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 6.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Space.y(1.w)!,
                      const Text(
                        "Would you like to speak to me over the phone? Just submit the details and Ill be in touch shortly.You can also email us if you would prefer",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Space.y(2.w)!,
                      // SizedBox(height: AppDimensions.space(3)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              "I would like to discuss:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hintText: "Reason",
                                hintStyle: const TextStyle(color: Colors.black),
                                filled: true,
                                fillColor: Colors.grey[200]),
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: TextField(
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hintText: "First Name",
                                hintStyle: const TextStyle(color: Colors.black),
                                filled: true,
                                fillColor: Colors.grey[200]),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: const TextStyle(color: Colors.black),
                                filled: true,
                                fillColor: Colors.grey[200]),
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: MaterialButton(
                            onPressed: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              color: const Color(0xff2CD9A2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Order Now"),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                  )
                                ],
                              ),
                            ),
                          )),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          // Space.y!,
        ],
      ),
    );
  }
}
