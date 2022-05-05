import 'package:flutter/material.dart';
import 'package:senior_project/Login_Page.dart';
<<<<<<< HEAD
import 'package:senior_project/SelectCurrencyPage.dart';
import 'AccountScreen.dart';
import 'Login_Page.dart';
import 'package:senior_project/models/AccountInfo.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'EndScreen.dart';

class NavigationScreen extends StatefulWidget {
=======
import 'AccountScreen.dart';
import 'Login_Page.dart';
import 'SelectCurrencyPage.dart';


class NavigationScreen extends StatefulWidget{
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
  @override
  _NavigationScreen createState() => _NavigationScreen();
}

class _NavigationScreen extends State<NavigationScreen> {
  int currentIndex = 0;
  final screens = [
    AccountScreen(),
    AccountScreen(),
    SelectCurrencyPage(),
<<<<<<< HEAD
    EndScreen(),
  ];

  @override
  Widget build(BuildContext context) {
=======
    LoginPage(),
  ];
  @override
  Widget build(BuildContext context){
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: currentIndex,
<<<<<<< HEAD
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
=======
        onTap: (index) =>
          setState(() =>
           currentIndex = index),
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
<<<<<<< HEAD
              icon: Icon(Icons.money),
              label: 'Deposit',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.change_circle_outlined),
              label: 'Exchange',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Sign Out',
              backgroundColor: Colors.green),
=======
            icon: Icon(Icons.money),
            label: 'Deposit',
            backgroundColor: Colors.green
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.change_circle_outlined),
            label: 'Exchange',
            backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Sign Out',
            backgroundColor: Colors.green
          ),
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
