import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/app/sections/Authentication/login.dart';
import 'package:mysite/app/sections/Authentication/loginmain.dart';
import 'package:mysite/app/sections/Authentication/membership.dart';
import 'package:mysite/app/widgets/arrow_on_top.dart';
import 'package:mysite/app/widgets/color_chage_btn.dart';
import 'package:mysite/changes/links.dart';

import 'package:mysite/core/apis/links.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/app.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/providers/drawer_provider.dart';
import 'package:mysite/core/providers/scroll_provider.dart';
import 'package:mysite/app/utils/navbar_utils.dart';
import 'package:mysite/app/utils/utils.dart';
import 'package:mysite/app/widgets/navbar_actions_button.dart';
import 'package:mysite/app/widgets/navbar_logo.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/theme/cubit/theme_cubit.dart';
import 'package:mysite/dahboardscreens/livechat/livechat.dart';
import 'package:mysite/messenger/messagingSerive.dart';
import 'package:mysite/messenger/notifications.dart';
import 'package:mysite/my_site.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/material.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../core/animations/entrance_fader.dart';
part 'widgets/_navbar_desktop.dart';
part 'widgets/_mobile_drawer.dart';
part 'widgets/_body.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String tokenkhan = "";
  FirebaseMessagingWebs messafeclass = FirebaseMessagingWebs();

  bool signinhover = false;

  gettoken() async {
    tokenkhan = (await messafeclass.getToken(
            vapidKey:
                "BLvkO070mMQk1QaAIoDUHvccJqO1UNlqsywCmRlAwkLG5MJW9SUKVkDSOUxJk9B-Wubzp5r0NuzzszjoEve9biA"))
        .toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", tokenkhan);
  }

  fetchmydetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("uid").toString() != "null") {
      await Provider.of<UserProvider>(context, listen: false)
          .fetchUserDetails(prefs.getString("uid").toString());
    }
  }

  @override
  void initState() {
    gettoken();
    fetchmydetails();
    showfirebasnotifications(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: !Responsive.isDesktop(context) ? const _MobileDrawer() : null,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                titleSpacing: 0,
                backgroundColor: Colors.white,
                elevation: 0,
                toolbarHeight: 280,
                title: PreferredSize(
                  preferredSize: Size.fromHeight(276),
                  child: Responsive(
                    desktop: _NavbarDesktop(),
                    mobile: _NavBarTablet(),
                    tablet: _NavBarTablet(),
                  ),
                ),
                // Customize your SliverAppBar as needed
                floating: false,
                pinned: false,
                snap: false,
              ),
            ];
          },
          body: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 6570,
                      child: _Body(),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
