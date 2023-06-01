import 'package:flutter/material.dart';
import 'package:mysite/app/sections/Authentication/signals/signalsmain.dart';
import 'package:mysite/dahboardscreens/algoritham/alogpage.dart';
import 'package:mysite/dahboardscreens/book/bookmainpage.dart';
import 'package:mysite/dahboardscreens/notifications/notificationdrawer.dart';
import 'package:mysite/dahboardscreens/notifications/notifications.dart';
import 'package:mysite/dahboardscreens/profile/accountpage.dart';
import 'package:mysite/dahboardscreens/videosblog/videos.dart';
import 'package:mysite/dahboardscreens/webchat/webchatpage.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key, required this.index});
  int index;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<bool> _selected = List.generate(8, (i) => false);
  List<bool> hoverselected = List.generate(8, (i) => false);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void initState() {
    _selected[widget.index] = true;
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  double defaultPadding = 16.0;
  final List<Widget> screens = [
    const SignalsMainPage(),
    const BookMainPage(),
    const AlgoMainPage(),
    const VideosBloagMain(),
    const WebChatPage(),
    Container(),
    const NotificationMAinpage(),
    const AccountMainPage()
  ];
  callScreens() {
    return screens[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NotificationDrawer(),
      backgroundColor: const Color(0xff262837),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          actions: [Container()],
          elevation: 0,
          backgroundColor: const Color(0xff262837),
          title: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    "TradeX",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: Colors.grey[100]!.withOpacity(0.50),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          filled: true,
                          fillColor: const Color(0xff444652),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xff444652),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xff444652),
                              ))),
                    )),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf5M2j5aP_QleSz2Sb2Qgf-J5UgjP3po54hg&usqp=CAU"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Thomas",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: themecolor,
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: _openEndDrawer,
                          icon: Icon(
                            Icons.notifications,
                            color: themecolor,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Menu",
                                style: TextStyle(
                                    color: themecolorlight,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 75 * 6,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: options.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selected = List.filled(
                                              _selected.length, false,
                                              growable: true);
                                          _selected[index] = !_selected[index];

                                          widget.index = index;
                                          callScreens();
                                        });
                                      },
                                      onHover: (hovering) {
                                        setState(() {
                                          hoverselected[index] = hovering;
                                        });
                                      },
                                      child: ListTile(
                                        leading: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: hoverselected[index] ==
                                                      true
                                                  ? themecolorgreen
                                                  : _selected[index] == false
                                                      ? themecolorlight
                                                      : themecolorgreen),
                                          child: Icon(
                                            iconslist[index],
                                            color: hoverselected[index] == true
                                                ? heaveytheme
                                                : _selected[index] == false
                                                    ? themecolor
                                                    : heaveytheme,
                                            size: 20,
                                          ),
                                        ),
                                        title: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              options[index],
                                              style: TextStyle(
                                                  color: hoverselected[index] ==
                                                          true
                                                      ? Colors.white
                                                      : _selected[index] ==
                                                              false
                                                          ? Colors.grey[100]!
                                                              .withOpacity(0.60)
                                                          : Colors.white,
                                                  fontWeight:
                                                      hoverselected[index] ==
                                                              true
                                                          ? FontWeight.w600
                                                          : _selected[index] ==
                                                                  false
                                                              ? FontWeight.w400
                                                              : FontWeight
                                                                  .w600),
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
                  ),
                )),
            Expanded(flex: 8, child: callScreens()),
          ],
        ),
      ),
    );
  }

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

  List options = [
    "Signals",
    "Education",
    "Algorithom",
    "Videos",
    "Chat",
    "Settings",
    "Notification",
    "My Profile",
  ];
}

Color themecolorlight = const Color(0xff444652);
Color themecolor = Colors.grey[100]!.withOpacity(0.50);
Color heaveytheme = const Color(0xff262837);
