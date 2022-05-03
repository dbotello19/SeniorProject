import 'package:flutter/material.dart';
import 'AccountScreen.dart';
import 'NewAccountPage.dart';
import 'NavigationScreen.dart';


class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool hideUsername = true;
  bool hidePassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool match = false;
  navigateToNavigationScreen(){
    Navigator.pushReplacement
      (context, MaterialPageRoute(builder: (context) => NavigationScreen()));
  }

  navigateToNewAccountPage(){
    Navigator.pushReplacement
      (context, MaterialPageRoute(builder: (context) => NewAccountPage()));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("lib/image/logo.png"),
        ),
        title: Text('Dollaire',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 26,
          color: Color(0xffFFD700),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Text('Welcome',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Padding(padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: hideUsername,
              controller: username,
              decoration: InputDecoration(
                hintText: 'Username',
                suffixIcon: InkWell(
                  onTap: _toggleUsernameView,
                  child: Icon(Icons.visibility,
                  ),
                ),
              ),
            )
          ),
            Padding(padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: hidePassword,
              controller: password,
              decoration: InputDecoration(
                hintText: 'Password',
                suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(Icons.visibility)
                  ),
               ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text("Don't have an Account? ",
            style: TextStyle(color: Colors.red),),
            GestureDetector(
              onTap:(){
                setState(() {
                  navigateToNewAccountPage();
                });
              },
              child:
              Text("Sign Up", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                )
              ]
            ),
            Spacer(),
            RaisedButton(
              child: Text('Log In'),
              color: Color(0xffFFD700),
              onPressed: (){
                setState(() {
                 if(username != "" && password != "")
                 {
                  navigateToNavigationScreen();
                 }
                });
              }
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
          ],
        ),
      )
    );
  }
  void _togglePasswordView() {
    hidePassword = !hidePassword;
    setState(() {
    });
  }

  void _toggleUsernameView(){
    hideUsername = !hideUsername;
    setState(() {
    });
  }
}