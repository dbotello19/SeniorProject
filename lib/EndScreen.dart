import 'package:flutter/material.dart';
import 'dart:async';
import 'Login_Page.dart';
import 'package:senior_project/models/dbinfo.dart';

class EndScreen extends StatefulWidget {
  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/image/logo.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Thanks For Using ",
                  style: TextStyle(
                      fontFamily: "Norwester",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 42,
                      color: Color(0xffFFD700)),
                ),
                Text("Our Service",
                    style: TextStyle(
                        fontFamily: "Kollektif",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                        color: Color(0xffFFD700)))
              ],
            ),
          ),
        ));
  }
}
