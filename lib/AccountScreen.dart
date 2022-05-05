import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:senior_project/AESencryption.dart';
import 'package:senior_project/Login_Page.dart';
import 'package:senior_project/models/AccountInfo.dart';
import 'Login_Page.dart';
import 'package:senior_project/models/dbinfo.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreen createState() => _AccountScreen();
}
List<List<dynamic>> transactions = [
=======
import 'package:senior_project/Login_Page.dart';
import 'Login_Page.dart';


class AccountScreen extends StatefulWidget{
  @override
  _AccountScreen createState() => _AccountScreen();
}
List<List<dynamic>> transactions = 
[
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
  ["Gas", "25.00"],
  ["Steam", " 10.00"],
  ["Discord", " 5.00"],
  ["Fortnite", " 10.00"],
  ["Gas", " 25.00"],
];
<<<<<<< HEAD
class _AccountScreen extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Dollaire',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
=======



class _AccountScreen extends State<AccountScreen> {
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
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
          ),
        ),
      ),
      backgroundColor: Colors.white,
<<<<<<< HEAD
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello $accName',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xff4C748B))),
            Padding(padding: const EdgeInsets.all(20.0)),
            Container(
              width: 330,
              height: 50,
              padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: OutlinedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()))
                },
                child: Stack(alignment: Alignment.centerRight, children: [
                  Text("$accBalance",
                      style: TextStyle(
                          fontFamily: "Montserrat", color: Color(0xff4C748B))),
                  Row(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Account Balance: ",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0xff4C748B))))
                    ],
                  ),
                ]),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 3, color: Color(0xff4C748B)),
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(20.0)),
            Text("Recent Transactions",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xff4C748B))),
            Container(
              child: Expanded(
                  child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, i) {
                  return ListTile(
=======
      body: Padding(padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
            Text('Hello Oscar',
            textAlign: TextAlign.left,
             style: TextStyle(
               fontFamily: 'Montserrat',
               fontWeight: FontWeight.w400,
               fontSize: 20,
               color: Color(0xff4C748B))
            ),
            Padding(padding: const EdgeInsets.all(20.0)),
            Container(
                width: 330,
                height: 50,
                padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: OutlinedButton(
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()))
                    },
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                          Text(
                            "23000",
                            style: TextStyle(
                                          fontFamily: "Montserrat",
                                          color: Color(0xff4C748B))
                          ),
                    Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Account Balance: ",
                            style: TextStyle(
                                          fontFamily: "Montserrat",
                                          color: Color(0xff4C748B))
                            )
                          )
                        ],
                      ),
                    ]
                  ),
                    style: OutlinedButton.styleFrom(
                      side: 
                      BorderSide(width: 3, color: Color(0xff4C748B)),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    ),
                  ),
                ),
            ),
           Padding(padding: const EdgeInsets.all(20.0)),
           Text(
             "Recent Transactions",
             style: TextStyle(
               fontFamily: 'Montserrat',
               fontWeight: FontWeight.w400,
               fontSize: 20,
               color: Color(0xff4C748B))
             ), 
            Container(
              child: Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, i) {
                    return ListTile(
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
                      dense: true,
                      visualDensity: VisualDensity(vertical: -2.0),
                      title: Text(
                        transactions[i][0],
                        style: TextStyle(
<<<<<<< HEAD
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff4C748B)),
                      ),
                      trailing: Text(
                        transactions[i][1],
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff4C748B)),
                      ));
                },
                separatorBuilder: (context, i) {
                  return Divider(
                    color: Color(0xff4C748B),
                    thickness: 1.0,
                    height: 0,
                  );
                },
                itemCount: transactions.length,
              )),
            )
          ],
        ),
      ),
    );
  }
}
=======
                          fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff4C748B)),),
                          trailing: Text(
                            transactions[i][1],
                             style: TextStyle(
                          fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff4C748B)),)
                          );
                  },
                  separatorBuilder: (context, i){
                    return Divider(
                      color: Color(0xff4C748B),
                      thickness: 1.0,
                      height: 0,
                    );
                  },
                  itemCount: transactions.length,
                )
              ),
            )
          ],
        ),
       ),
      );
    }
  }
>>>>>>> e7d3ae49250cc3ee3f12adb3b8c58c4a36973a81
