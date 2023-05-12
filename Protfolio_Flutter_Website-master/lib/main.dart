import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mysite/helpers/firebase_options.dart';
import 'my_site.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

late User currentFirebaseUser;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (FirebaseAuth.instance.currentUser != null) {
    currentFirebaseUser = FirebaseAuth.instance.currentUser!;
  }

  runApp(const MySite());
}

final customRefrence = FirebaseDatabase.instance.ref();
