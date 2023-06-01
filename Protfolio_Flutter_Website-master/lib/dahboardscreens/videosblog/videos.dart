import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';
import 'package:uuid/uuid.dart';

class VideosBloagMain extends StatefulWidget {
  const VideosBloagMain({super.key});

  @override
  State<VideosBloagMain> createState() => _VideosBloagMainState();
}

class _VideosBloagMainState extends State<VideosBloagMain> {
  late DatabaseReference _databaseReference;
  final SignalRefrence = FirebaseDatabase.instance.ref("Signals");
  final List<dynamic> _listItems = [];
  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.ref("Signals");

    // Listen for changes in your database reference

    try {
      _databaseReference.onChildAdded.listen((DatabaseEvent event) {
        Map map = event.snapshot.value as dynamic;
        setState(() {
          // Update your list of items
          _listItems.add(map.values.toList());
        });
      });
    } catch (e) {
      print(e);
    } finally {}

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: heaveytheme,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 50, right: 20, top: 10, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Videos Blog",
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
                height: 1000,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return SizedBox(
                    height: constraints.maxHeight,
                    child: FirebaseAnimatedList(
                        query: SignalRefrence.orderByChild('time'),
                        sort: (a, b) =>
                            DateTime.parse(b.child("time").value.toString())
                                .compareTo(DateTime.parse(
                                    a.child("time").value.toString())),
                        itemBuilder: (BuildContext context,
                            DataSnapshot snapshot,
                            Animation<double> animation,
                            int index) {
                          int newindex = index + 1;
                          return Padding(
                            padding: const EdgeInsets.only(left: 50, top: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff22202D),
                                  borderRadius: BorderRadius.circular(20)),
                              height: snapshot
                                          .child("textnote")
                                          .value
                                          .toString()
                                          .length <
                                      36
                                  ? 200
                                  : 250,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                      left: newindex < 10 ? -34 : -20,
                                      top: 10,
                                      child: Text(
                                        newindex < 10
                                            ? "0$newindex"
                                            : newindex.toString(),
                                        style: TextStyle(
                                            letterSpacing: 5,
                                            color: themecolorlight,
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Container(
                                            child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                              width:
                                                  250, // Set the desired width
                                              height:
                                                  150, // Set the desired height
                                              color: Colors
                                                  .blue, // Set your desired background color
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9WPcdIBl0kFQVdm4qTWpUsDSdH09s47Ifwg&usqp=CAU",
                                                fit: BoxFit.fill,
                                              )),
                                        )),
                                        Expanded(
                                            flex: 8,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: SizedBox(
                                                child: Column(
                                                  children: [
                                                    const Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "My first Video Blog On forex trading",
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 25),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .favorite_rounded,
                                                          color: themecolor,
                                                        ),
                                                        Text(
                                                          "103",
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            color: themecolor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    ListTile(
                                                      trailing: Icon(
                                                        index.isEven
                                                            ? Icons
                                                                .favorite_outline
                                                            : Icons
                                                                .favorite_rounded,
                                                        size: 30,
                                                        color: index.isEven
                                                            ? themecolor
                                                            : Colors.red,
                                                      ),
                                                      dense: true,
                                                      leading:
                                                          const CircleAvatar(
                                                        backgroundImage: AssetImage(
                                                            "assets/imgs/IMG_0107.png"),
                                                      ),
                                                      title: Text(snapshot
                                                          .child("postedby")
                                                          .value
                                                          .toString()),
                                                      subtitle: TimeDurationWidget(
                                                          startTime: DateTime
                                                              .parse(snapshot
                                                                  .child("time")
                                                                  .value
                                                                  .toString()),
                                                          endTime:
                                                              DateTime.now()),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: const Column(
                                                children: [],
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  openshowdialog() {
    TextEditingController signalcontroller = TextEditingController();
    final SignalRefrence = FirebaseDatabase.instance.ref("Signals");
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding: const EdgeInsets.all(8),
            contentPadding: const EdgeInsets.all(0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 300,
                  width: 600,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const SizedBox(
                            width: 50,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                      'https://placekitten.com/200/200'),
                                ),
                                SizedBox(
                                  height: 220,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.grey[200],
                                    height: 250,
                                    padding: const EdgeInsets.all(4),
                                    child: TextField(
                                      controller: signalcontroller,
                                      maxLines: 12,
                                      minLines: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.photo,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.gif_box,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.settings,
                                        color: Colors.blue,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.blue,
                    )),
                MaterialButton(
                  onPressed: () async {
                    String signaluid = const Uuid().v4().toString();
                    Map signalmap = {
                      "time": DateTime.now().toString(),
                      "textnote": signalcontroller.text,
                      "postedby": "Alec",
                      "uid": signaluid,
                      "profile": "https://placekitten.com/200/200",
                      "picture":
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwwTUVX5ELwe_rsqep-nQRVSIDtEzHvc35NA&usqp=CAU",
                      "mail": "@AlecMec",
                      "poster": "Admin",
                    };
                    try {
                      await SignalRefrence.child(signaluid).set(signalmap);
                    } catch (e) {
                      // ignore: avoid_print
                      print(e.toString());
                    } finally {
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: const Center(
                      child: Text(
                        "Post",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class TimeDurationWidget extends StatefulWidget {
  final DateTime startTime;
  final DateTime endTime;

  const TimeDurationWidget(
      {super.key, required this.startTime, required this.endTime});

  @override
  _TimeDurationWidgetState createState() => _TimeDurationWidgetState();
}

class _TimeDurationWidgetState extends State<TimeDurationWidget> {
  late String timeDuration;

  @override
  void initState() {
    super.initState();
    timeDuration = calculateTimeDuration();
  }

  String calculateTimeDuration() {
    final Duration duration = widget.endTime.difference(widget.startTime);

    if (duration.inDays > 0) {
      return '${duration.inDays} days';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hours';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} month';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$timeDuration ago",
      style: TextStyle(
        color: themecolor,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
