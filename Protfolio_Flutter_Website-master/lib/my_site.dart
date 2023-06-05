import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';
import 'package:mysite/app/sections/Authentication/loginmain.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/configs/connection/bloc/connected_bloc.dart';
import 'package:mysite/core/configs/connection/network_check.dart';
import 'package:mysite/core/providers/drawer_provider.dart';
import 'package:mysite/core/providers/scroll_provider.dart';
import 'package:mysite/core/theme/cubit/theme_cubit.dart';
import 'package:mysite/helpers/firebase_options.dart';
import 'package:mysite/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MySite extends StatelessWidget {
  const MySite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initialize =
        Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<ConnectedBloc>(create: (context) => ConnectedBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DrawerProvider()),
          ChangeNotifierProvider(create: (_) => ScrollProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Sudesh',
              theme: AppTheme.themeData(state.isDarkThemeOn, context),
              initialRoute: "/",
              routes: {
                "/": (context) {
                  return FutureBuilder(
                      future: initialize,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return const NChecking();
                          }
                        }
                        return const Center(child: CircularProgressIndicator());
                      });
                },
                "/dashboard": (context) {
                  return DashboardScreen(index: 0);
                }
              },
            );
          });
        }),
      ),
    );
  }
}

class UserProvider extends ChangeNotifier {
  List _user = [];

  List get user => _user;

  Future<void> fetchUserDetails(String uid) async {
    customRefrence
        .child("Members")
        .child(uid)
        .once()
        .then((DatabaseEvent databaseEvent) {
      if (databaseEvent.snapshot.value != null) {
        Map<String, dynamic> map = databaseEvent.snapshot.value as dynamic;
        List storesdocs = [];
        // ignore: unnecessary_null_comparison
        storesdocs.add(map == null ? [] : map.values.toList());
        _user = storesdocs;
      } else {}
    });
    notifyListeners();
  }
}
