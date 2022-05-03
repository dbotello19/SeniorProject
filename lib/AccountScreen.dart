import 'package:flutter/material.dart';
import 'package:senior_project/Login_Page.dart';
import 'Login_Page.dart';


class AccountScreen extends StatefulWidget{
  @override
  _AccountScreen createState() => _AccountScreen();
}
List<List<dynamic>> transactions = 
[
  ["Gas", "25.00"],
  ["Steam", " 10.00"],
  ["Discord", " 5.00"],
  ["Fortnite", " 10.00"],
  ["Gas", " 25.00"],
];



class _AccountScreen extends State<AccountScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xffFFD700),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("lib/image/logo.png"),
        ),
        title: Text('Dollaire',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 26,
          color: Colors.green,
          ),
        ),
      ),
      backgroundColor: Colors.green,
      body: Padding(padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
            Text('Hello Oscar',
            textAlign: TextAlign.left,
             style: TextStyle(
               fontFamily: 'Montserrat',
               fontWeight: FontWeight.bold,
               fontSize: 20,
               color: Colors.white)
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
                                          color: Colors.white)
                          ),
                    Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Account Balance: ",
                            style: TextStyle(
                                          fontFamily: "Montserrat",
                                          color: Colors.white)
                            )
                          )
                        ],
                      ),
                    ]
                  ),
                    style: OutlinedButton.styleFrom(
                      side: 
                      BorderSide(width: 3, color: Colors.white),
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
               color: Colors.white)
             ), 
            Container(
              child: Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, i) {
                    return ListTile(
                      dense: true,
                      visualDensity: VisualDensity(vertical: -2.0),
                      title: Text(
                        transactions[i][0],
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white),),
                          trailing: Text(
                            transactions[i][1],
                             style: TextStyle(
                          fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white),)
                          );
                  },
                  separatorBuilder: (context, i){
                    return Divider(
                      color: Colors.white,
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