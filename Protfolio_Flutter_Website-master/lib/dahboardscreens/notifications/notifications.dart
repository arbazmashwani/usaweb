import 'package:flutter/material.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';
import 'package:mysite/app/sections/contact/contact.dart';

class NotificationMAinpage extends StatefulWidget {
  const NotificationMAinpage({super.key});

  @override
  State<NotificationMAinpage> createState() => _NotificationMAinpageState();
}

class _NotificationMAinpageState extends State<NotificationMAinpage> {
  List<bool> boollist = List.generate(6, (index) => false).toList();
  @override
  void initState() {
    boollist[0] = true;
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: heaveytheme,
      body: Column(
        children: [
          const SizedBox(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 50, right: 20, top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff22202D),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  boollist[0] = false;
                                  boollist[1] = false;
                                  boollist[2] = false;
                                  boollist[3] = false;
                                  boollist[4] = false;
                                  boollist[5] = false;
                                  boollist[index] = true;
                                });
                              },
                              child: SizedBox(
                                width: 100,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(notificationtitles[index]),
                                      boollist[index] == true
                                          ? const Divider(
                                              thickness: 1,
                                              color: Colors.white,
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 350,
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 1,
                            child: Container(
                              height: 350 / 4,
                              color: const Color(0xff22202D),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf5M2j5aP_QleSz2Sb2Qgf-J5UgjP3po54hg&usqp=CAU"),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            const Text(
                                              "Posted New Trade Signal about gold selling fall | Alerting Sell ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "1h ago. Trade Team by Alec meck , keep tuned for more signal updates",
                                              style: TextStyle(
                                                  color: themecolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  List<String> notificationtitles = [
    "All",
    "Details",
    "Signals",
    "Chats",
    "Notifications",
    "Promotions"
  ];
}
