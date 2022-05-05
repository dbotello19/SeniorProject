import 'package:flutter/material.dart';
import 'package:senior_project/Login_Page.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Welcome to",
          style: TextStyle(
            fontFamily: "Norwester",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 48,
            color: Color(0xffFFD700)
          ),
          ),Text("Dollaire",
          style: TextStyle(
            fontFamily: "Kollektif",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 48,
            color: Color(0xffFFD700))),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/image/logo.png"),
                fit: BoxFit.contain,
              ),
          )),],
        ),
      ),
    );
  }
}
