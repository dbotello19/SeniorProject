import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:senior_project/models/AccountInfo.dart';
import 'package:senior_project/models/mysql.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'AccountScreen.dart';
import 'NewAccountPage.dart';
import 'NavigationScreen.dart';
import 'package:senior_project/AESencryption.dart';
import 'package:senior_project/models/dbinfo.dart';
=======
import 'AccountScreen.dart';
import 'NewAccountPage.dart';
import 'NavigationScreen.dart';
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  accountinfo acc = accountinfo();

  bool hideUsername = true;
  bool hidePassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool match = false;
<<<<<<< HEAD
  var encryptedusername, actualpassword,encryptedpassword;
  navigateToNavigationScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NavigationScreen()));
  }

  navigateToNewAccountPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NewAccountPage()));
  }

  var db = new Mysql();
  void _checkAccount() {
    encryptedusername = username.text;
    encryptedusername = MyEncryptionDecryption.encryptAES(encryptedusername);
    actualpassword = password.text;
    actualpassword = MyEncryptionDecryption.encryptAES(actualpassword);
    encryptedpassword = "";
    db.getConnection().then((conn) {
      String retrieve =
          'SELECT * FROM test.database where account_username = "$encryptedusername"';
      conn.query(retrieve).then((results) {
        for (var row in results) {
          {
            encryptedpassword = row[6];
            accId = row[0];
            accName = row[1];
            accBalance = row[9];
          }
        }
        print('$encryptedpassword' + " encrypted password" + "$actualpassword");
        if ('$encryptedusername' == "") {
          print("Error");
        } else if ('$actualpassword' != '$encryptedpassword') {
          print("Error");
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavigationScreen()));
        }
        conn.close();
      });
    });
=======
  navigateToNavigationScreen(){
    Navigator.pushReplacement
      (context, MaterialPageRoute(builder: (context) => NavigationScreen()));
  }

  navigateToNewAccountPage(){
    Navigator.pushReplacement
      (context, MaterialPageRoute(builder: (context) => NewAccountPage()));
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: Padding(padding: const EdgeInsets.all(8.0),
          child: Image.asset("lib/image/logo.png"),
          ),
          title: Text(
            'Dollaire',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text(
                'Welcome',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30),
              ),
              Spacer(),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: hideUsername,
                    controller: username,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      suffixIcon: InkWell(
                        onTap: _toggleUsernameView,
                        child: Icon(
                          Icons.visibility,
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: hidePassword,
                  controller: password,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(Icons.visibility)),
                  ),
                ),
              ),
              Spacer(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an Account? ",
                      style: TextStyle(color: Colors.red),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          navigateToNewAccountPage();
                        });
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
              Spacer(),
              RaisedButton(
                child: Text('Log In'),
                color: Colors.lightBlue,
                onPressed: _checkAccount,
              ),
<<<<<<< HEAD
            ],
          ),
        ));
=======
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
              color: Colors.lightBlue,
              onPressed: (){
                setState(() {
                 if(username != "" && password != "")
                 {
                  navigateToNavigationScreen();
                 }
                });
              }
            ),
          ],
        ),
      )
    );
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
  }

  void _togglePasswordView() {
    hidePassword = !hidePassword;
    setState(() {});
  }

  void _toggleUsernameView() {
    hideUsername = !hideUsername;
    setState(() {});
  }
}
