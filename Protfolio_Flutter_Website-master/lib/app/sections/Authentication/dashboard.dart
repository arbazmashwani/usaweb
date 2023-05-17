import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:line_icons/line_icons.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mysite/app/sections/Authentication/action_button.dart';
import 'package:mysite/app/sections/Authentication/signals/signalsmain.dart';
import 'package:mysite/app/widgets/navbar_logo.dart';

import 'package:mysite/core/res/responsive.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatefulWidget {
  DashboardScreen({
    super.key,
    required this.index,
  });

  int index;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final driversrefrence = FirebaseDatabase.instance.ref("driversn");
  List<bool> _selected = List.generate(8, (i) => false);

  List options = [
    "Signals",
    "Education",
    "Algorithom",
    "Videos",
    "More",
    "Settings",
    "Notification",
    "My Profile",
  ];
  final List<IconData> iconslist = [
    Icons.dashboard,
    Icons.verified,
    Icons.people,
    Icons.admin_panel_settings,
    Icons.report,
    Icons.settings,
    Icons.notifications,
    Icons.report,
  ];

  @override
  void initState() {
    _selected[widget.index] = true;
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const defaultPadding = 16.0;
    final List<Widget> screens = [
      const SignalsMainPage(),
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
    ];
    callScreens() {
      return screens[widget.index];
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Container(
                        color: const Color(0xff343A40),
                      ),
                    ),
                    Container(
                      color: const Color(0xff343A40),
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                75 * double.parse(options.length.toString()),
                            child: ListView.builder(
                                itemCount: options.length,
                                itemBuilder: ((context, i) {
                                  return drawertile(
                                      _selected[i]
                                          ? Colors.white
                                          : const Color(0xff414950),
                                      context,
                                      iconslist[i],
                                      options[i], () {
                                    setState(() {
                                      _selected = List.filled(
                                          _selected.length, false,
                                          growable: true);
                                      _selected[i] = !_selected[i];

                                      widget.index = i;
                                      callScreens();
                                    });
                                    Navigator.pop(context);
                                  }, _selected[i]);
                                })),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selected =
                      List.filled(_selected.length, false, growable: true);
                  widget.index = 9;
                  callScreens();
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: defaultPadding),
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.white10),
                ),
                child: Row(
                  children: [
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSPWhDcrmhvY86Q42jr73c-812hSyMhO3DxTXRt2H6uxgiLKsnktZsZfJ-14AvPaqR01k&usqp=CAU",
                      height: 38,
                    ),
                    if (!Responsive.isMobile(context))
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        child: Text("User 123"),
                      ),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
          )
        ],
        backgroundColor: const Color(0xff343A40),
        title: Row(
          children: const [
            NavBarLogo(),
          ],
        ),
      ),
      body: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Responsive.isTablet(context) || Responsive.isMobile(context)
                ? Container()
                : Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            color: const Color(0xff343A40),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 75 *
                                      double.parse(options.length.toString()),
                                  child: ListView.builder(
                                      itemCount: options.length,
                                      itemBuilder: ((context, i) {
                                        return drawertile(
                                            _selected[i]
                                                ? Colors.white
                                                : const Color(0xff414950),
                                            context,
                                            iconslist[i],
                                            options[i], () {
                                          setState(() {
                                            _selected = List.filled(
                                                _selected.length, false,
                                                growable: true);
                                            _selected[i] = !_selected[i];

                                            widget.index = i;
                                            callScreens();
                                          });
                                        }, _selected[i]);
                                      })),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
            Expanded(flex: 9, child: callScreens())
          ],
        ),
      ),
    );
  }
}

List<IconData> iconlist = [
  LineIcons.dashcube,
  LineIcons.peopleCarry,
  LineIcons.facebookMessenger,
  LineIcons.file,
  LineIcons.redditSquare,
  LineIcons.qrcode,
];

textwidget(String text) {
  return Text(
    text,
    style: GoogleFonts.bebasNeue(
        color: Colors.grey[600], fontSize: 30, fontWeight: FontWeight.bold),
  );
}

titletextwidget(String text) {
  return Text(
    text,
    style: GoogleFonts.bebasNeue(
      color: Colors.black,
    ),
  );
}

statswidget() {
  return Container(
    child: Column(
      children: [
        Row(
          children: [titletextwidget("Total Members")],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              children: [VerticalDividers(Colors.red), const Text("284")],
            ),
          ),
        )
      ],
    ),
  );
}

VerticalDividers(Color color) {
  return VerticalDivider(
    color: color,
    thickness: 2,
  );
}

drawertile(Color color, BuildContext context, IconData icon, String name,
    void Function() function, bool bool) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
    child: Container(
      color: color,
      child: ListTile(

// If current item is selected show blue color
          title: Row(
            children: [
              Responsive.isDesktop(context)
                  ? Container()
                  : Icon(
                      icon,
                      color: bool ? kPrimaryColor : Colors.white,
                    ),
              const SizedBox(width: 15),
              Text(
                name,
                style: TextStyle(
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    color: bool ? kPrimaryColor : Colors.white,
                    fontSize: 15),
              ),
            ],
          ),
          onTap: function),
    ),
  );
}

List options = [];
