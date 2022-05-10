import 'package:flutter/material.dart';
import 'NavigationScreen.dart';
import 'package:senior_project/models/mysql.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'BalanceScreen.dart';

class TransferScreen extends StatefulWidget{
  @override
  _TransferScreen createState() => _TransferScreen();
}
class _TransferScreen extends State<TransferScreen>{
  navigateToNavigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NavigationScreen()));}
  
  navigateToBalancePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BalanceScreen()));}


 TextEditingController amount = TextEditingController();
 TextEditingController accountfrom = TextEditingController();
 TextEditingController accountto = TextEditingController();

 var db = new Mysql();

  void _transfer(){
    var moneyto = accountto.text;
    var moneyfrom = accountfrom.text;
    var money = amount.text;
    var username = "";
    var username2 = "";
    db.getConnection().then((conn) {
      String retrieve = 'Select * from test.wallet where account_username = "$moneyfrom" AND currency = "USD"';
      conn.query(retrieve).then((results) {
        for (var row in results) {
          {
            username = row[0];
          }
        }
        if ('$username' == "" || '$username' != accUser) {
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
        }
        else{
          firstconn = true;
        }
      });
      conn.close();
      
    });

    db.getConnection().then((conn) {
      String retrieve = 'Select * from test.wallet where account_username = "$moneyto" AND currency = "USD"';
      conn.query(retrieve).then((results) {
        for (var row in results) {
          {
            username = row[0];
          }
        }
        if ('$username' == "") {
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
        }
        else{
          secondconn = true;
        }
      });
      conn.close();
    });
    if(firstconn == true && secondconn == true){
      firstconn = false;
      secondconn = false;
      db.getConnection().then((conn) {
      String update = 'UPDATE test.wallet SET balance = balance + $money WHERE account_username = "$moneyto" AND currency = "USD"';
      String update2 = 'UPDATE test.wallet SET balance = balance - $money WHERE account_username = "$moneyfrom" AND currency = "USD"';
      conn.query(update);
      conn.query(update2);
      conn.close();
      navigateToNavigationPage();
        });
      }
    }
  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.green,
           leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
          navigateToBalancePage();
        }),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
              controller: accountfrom,
              decoration: InputDecoration(
                hintText: 'From Account'
              ),
            ),
            Spacer(),
            TextField(
              controller: accountto,
              decoration: InputDecoration(
                hintText: 'To Account'
              ),
            ),
            Spacer(),
            TextField(
              controller: amount,
              decoration: InputDecoration(
                hintText: 'Amount'
              ),
            ),
            RaisedButton(
              child: Text('Confirm Transfer'),
              color: Colors.lightBlue,
              onPressed: _transfer,
            )
        ],
      ),
    )
   );
  }
}