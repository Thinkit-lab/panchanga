import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:panchanga_pandit/networking/sunrisecall.dart';
import 'package:panchanga_pandit/screens/choghadhiya.dart';
import 'package:panchanga_pandit/screens/homescreen.dart';
import 'package:panchanga_pandit/screens/kaala.dart';
import 'package:panchanga_pandit/screens/login.dart';
import 'package:panchanga_pandit/screens/mainhome.dart';
import 'package:panchanga_pandit/screens/muhurtha.dart';

import 'networking/panchangcall.dart';
import 'screens/choghadhiya.dart';
import 'screens/homescreen.dart';
import 'screens/kaala.dart';
import 'screens/muhurtha.dart';

import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:panchanga_pandit/binding/home_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HomeBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Panchanga Pandit',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      home: Login()
    );
  }
}

class MyHomePage extends StatefulWidget {
  var title;

  MyHomePage({Key? key, this.title}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

//  late PanchangService panchangService;

  void initState() {
    super.initState();
//    panchangService.getPanchang();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    MainHome(title: "Panchanga Pandit",)
            )
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amberAccent,
  child: Column(
    children: <Widget>[
      Container(
        child: FlutterLogo(size:MediaQuery.of(context).size.height),
      ),
    ],
  ),
  //      child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
