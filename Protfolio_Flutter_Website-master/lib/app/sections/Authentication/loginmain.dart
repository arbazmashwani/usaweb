import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysite/app/sections/Authentication/action_button.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';
import 'package:mysite/app/sections/Authentication/login.dart';
import 'package:mysite/app/utils/navbar_utils.dart';
import 'package:mysite/app/widgets/color_chage_btn.dart';
import 'package:mysite/app/widgets/navbar_actions_button.dart';
import 'package:mysite/app/widgets/navbar_logo.dart';
import 'package:mysite/core/apis/links.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/providers/drawer_provider.dart';
import 'package:mysite/core/providers/scroll_provider.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/theme/cubit/theme_cubit.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../changes/links.dart';
part 'widgets/_navbar_desktop copy.dart';
part 'widgets/_mobile_drawer copy.dart';

class HomePagelogin extends StatefulWidget {
  HomePagelogin({
    super.key,
  });
  static const String route = '/login';

  @override
  _HomePageloginState createState() => _HomePageloginState();
}

class _HomePageloginState extends State<HomePagelogin> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: heaveytheme,
                ),
                Container(
                    height: double.infinity,
                    width: size.width / 2,
                    color: Colors.grey[100]),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Trade X",
                        style: GoogleFonts.ooohBaby(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      "The Enlighteneds",
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.copyright,
                      color: Colors.grey,
                      size: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Copyright 2022",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (widget, animation) =>
                    ScaleTransition(scale: animation, child: widget),
                child: const LoginPage()),
          ],
        ),
      ),
    );
  }
}
