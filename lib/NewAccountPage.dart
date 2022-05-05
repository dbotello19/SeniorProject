import 'package:flutter/material.dart';
import 'package:senior_project/AESencryption.dart';
import 'package:senior_project/models/mysql.dart';
import 'package:senior_project/models/AccountInfo.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'NavigationScreen.dart';
import 'Login_Page.dart';

class NewAccountPage extends StatefulWidget {
  @override
  _NewAccountPage createState() => _NewAccountPage();
}

class _NewAccountPage extends State<NewAccountPage> {
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastnameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmpasswordEditingController =
      TextEditingController();
  TextEditingController ssnEditingController = TextEditingController();
  TextEditingController accountUsernameEditingController =
      TextEditingController();
  var db = new Mysql();
  var encryptedaccountUser = "";

  //accountinfo _account = accountinfo();

  void _insertDb() {
    var name = firstNameEditingController.text;
    name = MyEncryptionDecryption.encryptAES(name);
    var lastname = lastnameEditingController.text;
    lastname = MyEncryptionDecryption.encryptAES(lastname);
    var ssn = ssnEditingController.text;
    ssn = MyEncryptionDecryption.encryptAES(ssn);
    var email = emailEditingController.text;
    email = MyEncryptionDecryption.encryptAES(email);
    var accountUser = accountUsernameEditingController.text;
    accountUser = MyEncryptionDecryption.encryptAES(accountUser);
    var password = passwordEditingController.text;
    password = MyEncryptionDecryption.encryptAES(password);
    //compare
    //encript
    //add
    db.getConnection().then((conn) {
      String retrieve =
          'SELECT * FROM test.database where account_username = "$accountUser"';
      conn.query(retrieve).then((results) {
        for (var row in results) {
          {
            encryptedaccountUser = row[1];
          }
        }
        if ('$encryptedaccountUser' == "") {
          accName = name;
          accBalance = 0;
          String insert =
              "INSERT INTO test.database (first_name, last_name,ssn,email,account_username, account_password,balance) VALUES ('$name','$lastname', '$ssn', '$email', '$accountUser', '$password', 0)";
          conn.query(insert);
          conn.close();
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPage()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final firstname = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final lastname = TextFormField(
      autofocus: false,
      controller: lastnameEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        lastnameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final email = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final ssn = TextFormField(
      autofocus: false,
      controller: ssnEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        ssnEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "SSN",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final username = TextFormField(
      autofocus: false,
      controller: accountUsernameEditingController,
      obscureText: true,
      onSaved: (value) {
        accountUsernameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Username",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final confirmpassword = TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      obscureText: true,
      onSaved: (value) {
        confirmpasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 200, child: Icon(Icons.mail)),
                  SizedBox(height: 45),
                  firstname,
                  SizedBox(height: 45),
                  lastname,
                  SizedBox(height: 45),
                  email,
                  SizedBox(height: 45),
                  ssn,
                  SizedBox(height: 45),
                  username,
                  SizedBox(height: 45),
                  password,
                  SizedBox(height: 45),
                  confirmpassword,
                  Container(
                    margin: EdgeInsets.all(25),
                    child: FlatButton(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: _insertDb,
                    ),
                  ),
                  Text(
                    '',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
