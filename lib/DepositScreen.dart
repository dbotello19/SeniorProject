import 'package:flutter/material.dart';
import 'NavigationScreen.dart';
import 'package:senior_project/models/mysql.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'BalanceScreen.dart';

class DepositScreen extends StatefulWidget{
  @override
  _DepositScreen createState() => _DepositScreen();
}
class _DepositScreen extends State<DepositScreen>{
  navigateToNavigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NavigationScreen()));}
  
  navigateToBalancePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BalanceScreen()));}

  TextEditingController amount = TextEditingController();
  var db = new Mysql();

  void _deposit(){
    var money = amount.text;
    db.getConnection().then((conn) {
      String update = 'UPDATE test.wallet SET balance = balance + $money WHERE account_username = "$accUser" AND currency = "USD"';
      conn.query(update);
      conn.close();
      navigateToNavigationPage();
    });
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
              controller: amount,
              decoration: InputDecoration(
                hintText: 'Deposit Amount'
              ),
            ),
            RaisedButton(
              child: Text('Confirm Deposit'),
              color: Colors.lightBlue,
              onPressed: _deposit,
            )
        ],
      ),
    )
   );
  }
}