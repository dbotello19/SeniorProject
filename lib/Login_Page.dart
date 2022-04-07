import 'package:flutter/material.dart';


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
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Dollaire',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Text('Welcome',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30
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
              onTap:(){},
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
                  if(username == "Oscar" && password == "123")
                  {
                    match = true;
                  }
                  else
                  {
                    match = false;
                  }
                });
              }
            ),
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