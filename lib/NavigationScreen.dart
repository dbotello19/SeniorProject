import 'package:flutter/material.dart';
import 'package:senior_project/EndScreen.dart';
import 'package:senior_project/Login_Page.dart';
import 'package:senior_project/SelectCurrencyPage.dart';
import 'AccountScreen.dart';
import 'Login_Page.dart';


class NavigationScreen extends StatefulWidget{
  @override
  _NavigationScreen createState() => _NavigationScreen();
}

class _NavigationScreen extends State<NavigationScreen> {
  int currentIndex = 0;
  final screens = [
    AccountScreen(),
    AccountScreen(),
    SelectCurrencyPage(),
    EndScreen(),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) =>
          setState(() =>
           currentIndex = index),
        backgroundColor: Color(0xffFFD700),
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xffFFD700),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Deposit',
            backgroundColor: Color(0xffFFD700)
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.change_circle_outlined),
            label: 'Exchange',
            backgroundColor: Color(0xffFFD700)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Sign Out',
            backgroundColor: Colors.green
          ),
        ],
      ),
    );
  }
}