import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:line_icons/line_icons.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mysite/app/sections/profile/myprofile.dart';
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
  List<bool> _selected = List.generate(6, (i) => false);

  @override
  void initState() {
    _selected[widget.index] = true;
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Container(
        child: Image.asset(
          'assets/imgs/5424482.JPG',
          opacity: const AlwaysStoppedAnimation<double>(0.2),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      Container(color: Colors.grey[300]),
      Container(color: Colors.grey[300]),
      Container(color: Colors.grey[300]),
      Container(color: Colors.grey[300]),
      const MyProfile()
    ];
    callScreens() {
      return screens[widget.index];
    }

    iconlistreturn() {
      return ListView.builder(
          itemCount: iconlist.length,
          itemBuilder: ((context, index) {
            return drawertile(
                _selected[index] ? Colors.black : Colors.grey[200] as Color,
                context,
                iconlist[index],
                options[index], () {
              setState(() {
                _selected =
                    List.filled(_selected.length, false, growable: true);
                _selected[index] = !_selected[index];

                widget.index = index;
                callScreens();
              });
            }, _selected[index]);
          }));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        title: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                child: Image.asset(
                  "assets/imgs/TradeXGreen.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: VerticalDivider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              Text(
                "My TradeX Dashboard",
                style: TextStyle(
                  color: const Color(0xff999999),
                  fontWeight: FontWeight.w100,
                  fontSize: Responsive.isDesktop(context) ? 20 : 16,
                ),
              )
            ],
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                color: Colors.white,
                width: 80,
                child: Column(
                  children: [
                    SizedBox(
                      height: 420,
                      child: iconlistreturn(),
                    ),
                  ],
                )),
          ),
          Expanded(
              flex: 8,
              child: Container(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0)),
                  child: callScreens(),
                ),
              )),
        ],
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        color: Colors.white,
        child: ListTile(

            // If current item is selected show blue color
            title: Row(
              children: [
                Icon(
                  icon,
                  color: bool ? Colors.red : Colors.grey,
                ),
                const SizedBox(width: 15),
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: bool ? FontWeight.bold : FontWeight.w600,
                      letterSpacing: 2,
                      color: bool ? Colors.black : Colors.black54,
                      fontSize: 15),
                ),
              ],
            ),
            onTap: function),
      ),
    ),
  );
}

List options = [
  "Signals",
  "Education",
  "Algorithom",
  "Videos",
  "More",
  "My Profile",
];
