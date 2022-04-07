import 'package:flutter/material.dart';


class NewAccountPage extends StatefulWidget{
  @override
  _NewAccountPage createState() => _NewAccountPage();
}

class _NewAccountPage extends State<NewAccountPage> {

  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController secondNameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmpasswordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context){

    final firstname = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      ),
    );

    final secondname = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Second Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      ),
    );

    final email = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value){
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      ),
    );

    final confirmpassword = TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      obscureText: true,
      onSaved: (value){
        confirmpasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      ),
    );


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
                      SizedBox(
                        height: 200,
                        child: Icon(Icons.mail)
                      ),
                      SizedBox(height: 45),
                      firstname,
                      SizedBox(height: 45),
                      secondname,
                      SizedBox(height: 45),
                      email,
                      SizedBox(height: 45),
                      password,
                      SizedBox(height: 45),
                      confirmpassword,
                  ],
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
 }