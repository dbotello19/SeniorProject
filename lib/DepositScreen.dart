import 'package:flutter/material.dart';
import 'NavigationScreen.dart';
import 'package:senior_project/models/mysql.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'BalanceScreen.dart';
import 'package:intl/intl.dart';

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreen createState() => _DepositScreen();
}

class _DepositScreen extends State<DepositScreen> {

  String formattedDate = '';

  navigateToNavigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NavigationScreen()));
  }

  navigateToBalancePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BalanceScreen()));
  }

  TextEditingController amount = TextEditingController();
  var db = new Mysql();

  void _deposit() {

    var now = new DateTime.now();
    var formatter = new DateFormat('yMd');
    formattedDate = formatter.format(now);
    var money = amount.text;
    db.getConnection().then((conn) {
      String insertTransaction1 =
          "INSERT INTO test.transactions (account_username, description, amount, date, currency) VALUES ('$accUser','Direct Deposit', '$money', '$formattedDate','USD')";

 
      String update =
          'UPDATE test.wallet SET balance = balance + $money WHERE account_username = "$accUser" AND currency = "USD"';
      conn.query(update);
      conn.query(insertTransaction1);
      conn.close();
      navigateToNavigationPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                navigateToBalancePage();
              }),
        ),
        body: Padding(

            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(90)),
                  TextField(
                    controller: amount,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Deposit Amount'),
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  SizedBox(
                      width: 150,
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          'Confirm Deposit',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        color: Colors.green,
                        onPressed: _deposit,
                      )),
                ],
              ),
            )));

  }
}
