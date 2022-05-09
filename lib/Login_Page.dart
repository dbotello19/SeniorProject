import 'package:flutter/material.dart';
import 'package:senior_project/models/AccountInfo.dart';
import 'package:senior_project/models/mysql.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'AccountScreen.dart';
import 'NewAccountPage.dart';
import 'NavigationScreen.dart';
import 'package:senior_project/AESencryption.dart';
import 'package:senior_project/models/dbinfo.dart';

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
    var encryptedusername = username.text;
    encryptedusername = MyEncryptionDecryption.encryptAES(encryptedusername);
    var actualpassword = password.text;
    actualpassword = MyEncryptionDecryption.encryptAES(actualpassword);
    var encryptedpassword = "";
    db.getConnection().then((conn) {
      String retrieve =
          'SELECT * FROM test.database where account_username = "$encryptedusername"';
      conn.query(retrieve).then((results) {
        for (var row in results) {
          {
            encryptedpassword = row[6];
            accUser = row[5];
            accName = row[1];
            //accName = MyEncryptionDecryption.decryptAES(accName);
            accBalance = row[9];
          }
        }
        if ('$encryptedusername' == "") {
          showDialog<String>(
                context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text("Error"),
                content: Text("Incorrect Information"),
                actions: <Widget>[
                  TextButton(child: Text("Ok"),
                  onPressed: () => Navigator.pop(context, 'Ok')),
                ],
              ));
        } else if ('$actualpassword' != '$encryptedpassword') {
          showDialog<String>(
                context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text("Error"),
                content: Text("Incorrect Information"),
                actions: <Widget>[
                  TextButton(child: Text("Ok"),
                  onPressed: () => Navigator.pop(context, 'Ok')),
                ],
              ));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavigationScreen()));
        }
        conn.close();
      });
    });
    //get transactions
    db.getConnection().then((conn) {
      String transaction =
          'SELECT * FROM test.transactions where account_username = "$encryptedusername"';
      conn.query(transaction).then((results) {
        for (var row in results) {
          {
            dbtransaction.add([row[1], row[2].toString()]);
          }
        }
        conn.close();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
           leading: Padding(
          padding: const EdgeInsets.all(8.0),
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
            ],
          ),
        ));
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