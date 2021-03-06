import 'package:flutter/material.dart';
import 'package:senior_project/EndScreen.dart';
import 'package:senior_project/Login_Page.dart';
import 'package:senior_project/SelectCurrencyPage.dart';
import 'AccountScreen.dart';
import 'Login_Page.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'BalanceScreen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreen createState() => _NavigationScreen();
}

class _NavigationScreen extends State<NavigationScreen> {
  int currentIndex = 0;
  final screens = [
    AccountScreen(),
    BalanceScreen(),
    SelectCurrencyPage(),
    EndScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          if (index == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => EndScreen(),
              ),
            );
          } else {
            currentIndex = index;
          }
        }),
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
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
        ],
      ),
    );
  }
}
