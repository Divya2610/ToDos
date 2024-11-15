// import 'package:flutter/material.dart';
// import 'package:flutter_application_3/pages/WelcomePage.dart';
// import 'package:flutter_application_3/pages/signin_page.dart';
// import 'package:flutter_application_3/pages/signup_page.dart';
// import 'package:flutter_application_3/pages/home_page.dart';
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Auth UI',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: WelcomePage(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_3/pages/WelcomePage.dart';
import 'package:flutter_application_3/pages/signin_page.dart';
import 'package:flutter_application_3/pages/signup_page.dart';
import 'package:flutter_application_3/pages/home_page.dart';

// Replace with your actual Firebase options
const firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyBOwcx2yGFuME94NKVB6gx7pzNR2wBempc",
  authDomain: "YOUR_PROJECT_ID.firebaseapp.com",
  databaseURL: "https://YOUR_PROJECT_ID.firebaseio.com",
  projectId: "authenticationapp-6322b",
  storageBucket: "authenticationapp-6322b.firebasestorage.app",
  messagingSenderId: "141671352518",
  appId: "1:141671352518:android:6a869de191c5d502932fc7",
  measurementId: "YOUR_MEASUREMENT_ID", // optional2
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions); // Provide the Firebase options
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}




