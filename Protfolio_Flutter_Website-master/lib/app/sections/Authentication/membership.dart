import 'package:flutter/material.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mysite/main.dart';
import 'package:mysite/my_site.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
    "https://www.googleapis.com/auth/contacts.readonly"
  ]);
  _signInWithGoogle() async {
    try {
      // final GoogleSignIn _googleSignIn = GoogleSignIn(
      //     clientId:
      //         '334985763345-ha6etkv6be5sl6m7t2a8gqq4r7qnqapb.apps.googleusercontent.com');

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final user = userCredential.user;
        if (user != null) {
          try {
            String plansuuid = const Uuid().v1().toString();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Map plansmap = {
              "uid": plansuuid,
              "name": "basic",
              "price": "50",
              "SubscribeDate": DateTime.now().toString(),
              "enddate":
                  DateTime.now().add(const Duration(days: 30)).toString(),
              "isexpired": "false",
              "isactive": "true",
            };

            Map userdetails = {
              "uid": user.uid,
              "profile": user.photoURL,
              "name": user.displayName,
              "email": user.email,
              "createddate": DateTime.now().toString(),
              "TotalSubscription": "1",
              "SuperMember": "false",
            };

            await customRefrence
                .child("Members")
                .child(user.uid)
                .set(userdetails);
            await customRefrence
                .child("Members")
                .child(user.uid)
                .child("Plans")
                .child(plansuuid)
                .set(plansmap);
            await prefs.setString("uid", user.uid.toString());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DashboardScreen(
                          index: 0,
                        )));
          } catch (e) {
            print(e);
          }
        } else {
          print("failed");
        }

        // Navigate to home screen
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      appBar: AppBar(
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
                "get signals",
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Card(
                elevation: 10,
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 40),
                        child: Row(
                          children: const [
                            Text(
                              "Welcome back!",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: const [
                            Text(
                              "It's good to see you again. Log in to start Learning.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, top: 20, right: 40),
                        child: Row(
                          children: const [
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder()),
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, top: 20, right: 40),
                        child: Row(
                          children: const [
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder()),
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 20),
                        child: Row(
                          children: const [
                            Text(
                              "Forgot password?",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 35, top: 20, right: 35),
                          child: MaterialButton(
                            onPressed: () async {
                              _toggleLoading();
                              await _signInWithGoogle();
                              _toggleLoading();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red,
                              ),
                              child: const Center(
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, top: 20, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Or login with?",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 35, top: 20, right: 35),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black54)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqtr_BBRhxBxQYFS4UEox_7m7xLSTIZXJMVOyKTOXo7xs65yw9kaRw-B7GjQIwbP48DoY&usqp=CAU"),
                                  const Text(
                                    "Google",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, top: 20, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don’t have an account yet?",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Create a new account",
                                  style: TextStyle(color: Colors.red),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

fetchmydetails(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("uid").toString() != "null") {
    await Provider.of<UserProvider>(context, listen: false)
        .fetchUserDetails(prefs.getString("uid").toString());
  }
}
