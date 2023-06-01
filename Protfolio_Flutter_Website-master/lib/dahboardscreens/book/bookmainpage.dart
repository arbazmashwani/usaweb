import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';

import 'package:universal_html/html.dart' as html;

class BookMainPage extends StatefulWidget {
  const BookMainPage({super.key});

  @override
  State<BookMainPage> createState() => _BookMainPageState();
}

class _BookMainPageState extends State<BookMainPage> {
  @override
  void initState() {
    if (kIsWeb) {
      html.document.onContextMenu.listen((event) => event.preventDefault());
    }
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   showdialogalert();
    // });
    // TODO: implement initState
    super.initState();
  }

  String chapterUid = "";
  final bookrefrence = FirebaseDatabase.instance.ref("AdminBooks");
  final bookrefrence2 = FirebaseDatabase.instance.ref("AdminBooks");
  Color themecolorlight = const Color(0xff444652);
  Color themecolor = Colors.grey[100]!.withOpacity(0.50);
  Color heaveytheme = const Color(0xff262837);

  showdialogalert() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Notice"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("ok"))
            ],
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    "Site is under Construction. Can not Use another Features right now, Stay tuned for the updates")
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: heaveytheme,
      body: Container(
        child: Row(
          children: [
            Expanded(
                flex: imageurl.isEmpty ? 7 : 10,
                child: imageurl.isNotEmpty
                    ? Container(
                        child: Stack(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                // Prevent the default behavior of long-press gesture
                                Clipboard.setData(const ClipboardData(
                                    text:
                                        '')); // Clear clipboard to disable "Save As" option
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.network(
                                  imageurl,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                                top: 20,
                                right: 30,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      imageurl = "";
                                    });
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      )
                    : Container(
                        child: Column(
                          children: [
                            Expanded(
                                flex: 7,
                                child: Container(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 50,
                                              right: 20,
                                              top: 10,
                                              bottom: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Education",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 50),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 50,
                                                    right: 20,
                                                    top: 10,
                                                    bottom: 20),
                                                child: Container(
                                                    child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Container(
                                                      width:
                                                          250, // Set the desired width
                                                      height:
                                                          200, // Set the desired height
                                                      color: Colors
                                                          .blue, // Set your desired background color
                                                      child: Image.network(
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3wbi4-lZqxQKqh6qoD_cvGkOJQF4Whji4TA&usqp=CAU",
                                                        fit: BoxFit.fill,
                                                      )),
                                                )),
                                              ),
                                            ),
                                            Expanded(
                                                child: Container(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                    child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: 5,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return const Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          );
                                                        }),
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Text(
                                                        "The Trader",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Text(
                                                        "By Alec",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 12),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "lorem bsajij hiuas husa  siuauh huashu huas ih isa ihias gua ih asi ihsa h ash sa hal sah a dho os haiu ahdi cgew aiha i ",
                                                            style: TextStyle(
                                                                color:
                                                                    themecolor,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 45, right: 20, top: 10, bottom: 20),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff22202D),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Column(
                                                children: [
                                                  const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 12,
                                                                top: 8),
                                                        child: Text(
                                                          "PaperBack",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 12),
                                                        child: Text(
                                                          "Details",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child:
                                                              bookdetailwidget(
                                                                  "Chapters",
                                                                  "2")),
                                                      Expanded(
                                                          child:
                                                              bookdetailwidget(
                                                                  "Weight",
                                                                  "English")),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child:
                                                              bookdetailwidget(
                                                                  "Published",
                                                                  "2023")),
                                                      Expanded(
                                                          child:
                                                              bookdetailwidget(
                                                                  "Subscription",
                                                                  "Member A")),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff22202D),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Column(
                                                children: [
                                                  const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 12,
                                                                top: 8),
                                                        child: Text(
                                                          "Author",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 30,
                                                        backgroundImage: AssetImage(
                                                            "assets/imgs/IMG_0107.png"),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        "Alec Mec Author",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            6.0),
                                                    child: Text(
                                                      "lorem anbsn hjidsnj ihjiksa jhisd mhjid jbnd sjb jbsaj jbj  hkjn n jhj nhi hnj njbuj,jdjinkn ",
                                                      style: TextStyle(
                                                          color: themecolor),
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      )),
            Expanded(
              flex: imageurl.isEmpty ? 3 : 0,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff22202D),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "Chapters Details",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 4,
                        color: heaveytheme,
                      ),
                      SizedBox(
                          height: 180,
                          width: 300,
                          child: StreamBuilder(
                              stream: bookrefrence2
                                  .child("be528705-cb78-4c29-8e86-42349ae4db1a")
                                  .child("Chapters")
                                  .onValue,
                              builder: ((BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasError) {}
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                final List<dynamic> storedocs = [];

                                Map<String, dynamic>? map =
                                    snapshot.data.snapshot.value as dynamic;

                                storedocs.clear();

                                storedocs.add(
                                    map == null ? [] : map.values.toList());
                                return storedocs[0].length == 0
                                    ? Container(
                                        child: const Center(
                                          child: Text(
                                            "No Chapters",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    : ScrollConfiguration(
                                        behavior: MyCustomScrollBehavior(),
                                        child: ListView.builder(
                                            padding: const EdgeInsets.all(0),
                                            itemCount: storedocs[0].length,
                                            itemBuilder: ((context, index) {
                                              int newindex = index + 1;
                                              return SizedBox(
                                                width: 300,
                                                height: 45,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isclick[0] = false;
                                                        isclick[1] = false;
                                                        isclick[index] = true;

                                                        chapterUid = storedocs[
                                                                    0][index]
                                                                ["chapteruid"]
                                                            .toString();
                                                      });
                                                    },
                                                    child: Container(
                                                      child: ListTile(
                                                        title: Text(
                                                          "Chapter $newindex : ${storedocs[0][index]["chaptername"]}",
                                                          style: TextStyle(
                                                              color: index
                                                                      .isEven
                                                                  ? Colors.green
                                                                  : themecolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })),
                                      );
                              }))),
                      chapterUid.isEmpty
                          ? Container()
                          : SizedBox(
                              height: 300,
                              width: 300,
                              child: StreamBuilder(
                                  stream: bookrefrence
                                      .child(
                                          "be528705-cb78-4c29-8e86-42349ae4db1a")
                                      .child("Chapters")
                                      .child(chapterUid)
                                      .child("pages")
                                      .orderByChild("Createdon")
                                      .onValue,
                                  builder: ((BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasError) {}
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    final List<dynamic> storedocs = [];

                                    Map<String, dynamic>? map =
                                        snapshot.data.snapshot.value as dynamic;

                                    storedocs.clear();

                                    storedocs.add(
                                        map == null ? [] : map.values.toList());
                                    return storedocs[0].length == 0
                                        ? Container(
                                            child: const Center(
                                              child: Text(
                                                "No Pages Yet",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        : ScrollConfiguration(
                                            behavior: MyCustomScrollBehavior(),
                                            child: ListView.builder(
                                                itemCount: storedocs[0].length,
                                                itemBuilder: ((context, index) {
                                                  int newint = index + 1;
                                                  return SizedBox(
                                                    width: 300,
                                                    height: 60,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          imageurl = "";
                                                          imageurl = storedocs[
                                                                      0][index]
                                                                  ["Imageurl"]
                                                              .toString();
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          color: const Color(
                                                              0xff414950),
                                                          child: ListTile(
                                                            tileColor:
                                                                Colors.white,
                                                            title: Text(
                                                              "Page $newint ",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                })),
                                          );
                                  }))),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }

  String imageurl = "";
  List<bool> isclick = List.generate(2, (index) => false).toList();
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

bookdetailwidget(String title, value) {
  return Expanded(
      child: Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 6),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(color: themecolor),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    ),
  ));
}
