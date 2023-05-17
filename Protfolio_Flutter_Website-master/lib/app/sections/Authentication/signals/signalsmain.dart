import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SignalsMainPage extends StatefulWidget {
  const SignalsMainPage({super.key});

  @override
  State<SignalsMainPage> createState() => _SignalsMainPageState();
}

class _SignalsMainPageState extends State<SignalsMainPage> {
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
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Signals",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      SizedBox(
                        width: 500,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Search Signal",
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.white))),
                        ),
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
                          return Column(
                            children: [
                              const Divider(
                                color: Colors.black26,
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 50,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: NetworkImage(snapshot
                                              .child("profile")
                                              .value
                                              .toString()),
                                        ),
                                        const SizedBox(
                                          height: 240,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 10.0),
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      snapshot
                                                          .child("postedby")
                                                          .value
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .child("mail")
                                                          .value
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                    TimeDurationWidget(
                                                        startTime: DateTime
                                                            .parse(snapshot
                                                                .child("time")
                                                                .value
                                                                .toString()),
                                                        endTime:
                                                            DateTime.now()),
                                                  ],
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.more_horiz),
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 17),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Text(
                                                    snapshot
                                                        .child("textnote")
                                                        .value
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 200.0,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              350,
                                          child: Image.network(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwwTUVX5ELwe_rsqep-nQRVSIDtEzHvc35NA&usqp=CAU',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Row(
                                            children: <Widget>[
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.favorite_border),
                                                onPressed: () {},
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Text(
                                                "103",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
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
                          SizedBox(
                            width: 50,
                            child: Column(
                              children: const [
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
                                  child: Row(
                                    children: const [
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
      return '${duration.inDays}d';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "  . $timeDuration ago",
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
