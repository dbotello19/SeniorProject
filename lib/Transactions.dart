import 'package:flutter/material.dart';
import 'package:senior_project/AESencryption.dart';
import 'package:senior_project/models/mysql.dart';
import 'package:senior_project/Login_Page.dart';
import './utils/API.dart';
import 'package:senior_project/models/AccountInfo.dart';
import 'Login_Page.dart';
import 'package:senior_project/models/dbinfo.dart';

class Transactions extends StatefulWidget {
  @override
  _Transactions createState() => _Transactions();
}

class _Transactions extends State<Transactions> {
  late Future<List<List<dynamic>>> wallets;
  late Future<num> walletNum;
  late Future<List<List<dynamic>>> transactions;
  @override
  void initState() {
    transactions = SQL.fetchCurrencyTransactions(currency);
    walletNum = SQL.fetchNumT();
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
            Align(
                alignment: Alignment.topCenter,
                child: Text('Transactions for $currency',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Color(0xff4C748B)))),
            Divider(color: Color(0xff4C748B)),
            Padding(padding: const EdgeInsets.all(10.0)),
            Container(
                child: Expanded(
                    child: SingleChildScrollView(
                        child: FutureBuilder<List<List<dynamic>>>(
                            future: transactions,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<List<dynamic>>? snapshotList =
                                    snapshot.data!;
                                var walletList = new List<List<dynamic>>.from(
                                    snapshotList.reversed);
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
                                              if (walletList[0][0] == 0)
                                                return Text(
                                                    "No Transactions Found");
                                              else
                                                return Column(children: [
                                                  for (int i = 0;
                                                      i < walletNumInt;
                                                      i++)
                                                    Container(
                                                      width: 330,
                                                      height: 45,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 5, 15, 0),
                                                      child: Stack(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          children: [
                                                            Text(
                                                                "${walletList![i][2]}",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    color: Color(
                                                                        0xff4C748B))),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Text(
                                                                        "${walletList[i][1]} : ",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Montserrat",
                                                                            color:
                                                                                Color(0xff4C748B))))
                                                              ],
                                                            ),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomLeft,
                                                                    child: Text(
                                                                        "${walletList[i][3]}",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Montserrat",
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                Color(0xff4C748B))))
                                                              ],
                                                            ),
                                                          ]),
                                                    ),
                                                  Divider(
                                                      color: Color(0xff4C748B)),
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
                            })))),
          ],
        ),
      ),
    );
  }
}
