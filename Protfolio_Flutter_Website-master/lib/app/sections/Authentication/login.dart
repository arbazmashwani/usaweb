import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mysite/app/sections/Authentication/action_button.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';
import 'package:mysite/app/sections/Authentication/widgets.dart';
import 'package:mysite/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();

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
              "token": prefs.getString("token").toString(),
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

  bool saveme = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Center(
        child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: size.height * (0.9),
            width: 500,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "LOG IN",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        width: 30,
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      loginTextFields(
                          controller,
                          "Email",
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.email)),
                          false),
                      loginTextFields(
                          controller1,
                          "Password",
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.password)),
                          true),
                      Row(
                        children: [
                          Checkbox(
                              activeColor: heaveytheme,
                              value: saveme,
                              onChanged: (valu) {
                                setState(() {
                                  saveme = !saveme;
                                });
                              }),
                          Text(
                            "Remember Me",
                            style: TextStyle(color: heaveytheme),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: heaveytheme,
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: 52,
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          _toggleLoading();
                          await _signInWithGoogle();
                          _toggleLoading();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.grey[300] as Color)),
                          width: double.infinity,
                          height: 52,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                    "assets/imgs/google.png",
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Continue with Google",
                                style: TextStyle(
                                    color: Color(0xff746F6F),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
