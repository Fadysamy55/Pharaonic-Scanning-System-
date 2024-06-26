import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gradutionfinally/Favourite.dart';
import 'package:gradutionfinally/History.dart';
import 'package:gradutionfinally/Home.dart';
import 'package:gradutionfinally/Profile.dart';
import 'package:gradutionfinally/Register.dart';
import 'package:gradutionfinally/Satrted.dart';
import 'package:gradutionfinally/Scaning.dart';
import 'package:gradutionfinally/Testing.dart';
import 'package:gradutionfinally/loginScreen.dart';
import 'package:gradutionfinally/search.dart';
import 'package:shared_preferences/shared_preferences.dart';


SharedPreferences? sharedpref;

Future main()
async{
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ?await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAEm6mLb3u8OQkQB_jGZz5Y32qvFFVLIFk',
          appId: '1:42016626917:android:277a8212046cd441d99c0c',
          messagingSenderId:'42016626917',
          projectId: 'phraraonic'
      )
  )

      : await Firebase.initializeApp(

  );
  sharedpref = await SharedPreferences.getInstance();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()

    );
  }
}