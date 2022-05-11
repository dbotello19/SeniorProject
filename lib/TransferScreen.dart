import 'package:flutter/material.dart';
import 'NavigationScreen.dart';
import 'package:senior_project/models/mysql.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'BalanceScreen.dart';
import 'package:intl/intl.dart';

class TransferScreen extends StatefulWidget {
  @override
  _TransferScreen createState() => _TransferScreen();
}

class _TransferScreen extends State<TransferScreen> {
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
  TextEditingController accountfrom = TextEditingController();
  TextEditingController accountto = TextEditingController();

  var db = new Mysql();

  void _transfer() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yMd');
    formattedDate = formatter.format(now);
    var moneyto = accountto.text;
    var moneyfrom = accountfrom.text;
    var money = amount.text;
    var username = "";
    var username2 = "";
    db.getConnection().then((conn) {
      String retrieve =
          'Select * from test.wallet where account_username = "$moneyfrom" AND currency = "USD"';
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
                      TextButton(
                          child: Text("Ok"),
                          onPressed: () => Navigator.pop(context, 'Ok')),
                    ],
                  ));
        } else {
          firstconn = true;
        }
      });
      conn.close();
    });

    db.getConnection().then((conn) {
      String retrieve =
          'Select * from test.wallet where account_username = "$moneyto" AND currency = "USD"';

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
                      TextButton(
                          child: Text("Ok"),
                          onPressed: () => Navigator.pop(context, 'Ok')),
                    ],
                  ));
        } else {
          secondconn = true;
        }
      });
      conn.close();
    });
    if (firstconn == true && secondconn == true) {
      firstconn = false;
      secondconn = false;
      db.getConnection().then((conn) {
        String update =
            'UPDATE test.wallet SET balance = balance + $money WHERE account_username = "$moneyto" AND currency = "USD"';
        String update2 =
            'UPDATE test.wallet SET balance = balance - $money WHERE account_username = "$moneyfrom" AND currency = "USD"';
        String insertTransaction1 =
            "INSERT INTO test.transactions (account_username, description, amount, date, currency) VALUES ('$moneyto','Transfer to ${moneyfrom}', '-$money', '$formattedDate','USD')";
        String insertTransaction2 =
            "INSERT INTO test.transactions (account_username, description, amount, date,currency) VALUES ('$moneyfrom','Transfer from ${moneyto}', '+$money', '$formattedDate', 'USD')";

        conn.query(update);
        conn.query(update2);
        conn.close();
        navigateToNavigationPage();
      });
    }
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
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(35)),
                TextField(
                  controller: accountfrom,
                  decoration: InputDecoration(hintText: 'From Account'),
                ),
                Padding(padding: EdgeInsets.all(30)),
                TextField(
                  controller: accountto,
                  decoration: InputDecoration(hintText: 'To Account'),
                ),
                Padding(padding: EdgeInsets.all(35)),
                TextField(
                    controller: amount,
                    decoration: InputDecoration(hintText: 'Amount')),
                Padding(padding: EdgeInsets.all(35)),
                SizedBox(
                    width: 160,
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        'Confirm Transfer',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: _transfer,
                    )),
              ],
            ),
          ),
        ));
  }
}
