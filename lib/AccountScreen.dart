import 'package:flutter/material.dart';
import 'package:senior_project/AESencryption.dart';
import 'package:senior_project/models/mysql.dart';
import 'package:senior_project/Login_Page.dart';
import 'package:senior_project/Transactions.dart';
import './utils/API.dart';
import 'package:senior_project/models/AccountInfo.dart';
import 'package:senior_project/models/mysql.dart';
import 'Login_Page.dart';
import 'package:senior_project/models/dbinfo.dart';
 



class AccountScreen extends StatefulWidget {
  @override

  _AccountScreen createState() => _AccountScreen();
}


class _AccountScreen extends State<AccountScreen> {
  late Future<List<List<dynamic>>> wallets;
  late Future<num> walletNum;
  late Future<List<List<dynamic>>> transactions;

  @override
  void initState() {
    wallets = SQL.fetchWallets();
    walletNum = SQL.fetchNum();
    transactions = SQL.fetchTransactions();
    super.initState();
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
        padding: const EdgeInsets.all(25.0),
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
            Padding(padding: const EdgeInsets.all(10.0)),
            Container(
                child: FutureBuilder<List<List<dynamic>>>(
                    future: wallets,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<List<dynamic>>? walletList = snapshot.data;
                        return Container(
                            child: FutureBuilder<num>(
                                future: walletNum,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    String walletNumString =
                                        snapshot.data.toString();
                                    int walletNumInt =
                                        int.parse(walletNumString);
                                    if (snapshot.hasData) {
                                      return Column(children: [
                                        for (int i = 0; i < walletNumInt; i++)
                                          Container(
                                            width: 330,
                                            height: 50,
                                            padding: EdgeInsets.fromLTRB(
                                                15, 5, 15, 0),
                                            child: OutlinedButton(
                                              onPressed: () => {

                                                currency =
                                                    "${walletList![i][1]}",

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>

                                                            Transactions()))

                                              },
                                              child: Stack(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  children: [
                                                    Text("${walletList![i][2]}",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            color: Color(
                                                                0xff4C748B))),
                                                    Row(
                                                      children: <Widget>[
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                                "${walletList[i][1]} Balance: ",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    color: Color(
                                                                        0xff4C748B))))
                                                      ],
                                                    ),
                                                  ]),
                                              style: OutlinedButton.styleFrom(
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Color(0xff4C748B)),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                )),
                                              ),
                                            ),
                                          ),
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                        )
                                      ]);
                                    } else {
                                      return Text("${snapshot.error}");
                                    }
                                  }
                                  return CircularProgressIndicator();
                                }));
                      }
                      return CircularProgressIndicator();
                    })),
            //for (int i = 0; i < wallets; i++)

            Padding(padding: const EdgeInsets.all(20.0)),
            Text("Recent Transactions",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xff4C748B))),

          ],
        ),
      ),
    );
  }
}
