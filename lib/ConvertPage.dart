import 'package:flutter/material.dart';
import 'package:senior_project/NavigationScreen.dart';
import 'package:senior_project/SelectCurrencyPage.dart';
import './utils/API.dart';
import './globals.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'package:senior_project/models/mysql.dart';

class ConvertPage extends StatefulWidget {
  final convertFrom;
  final convertTo;

  ConvertPage(this.convertFrom, this.convertTo);

  @override
  _ConvertPageState createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  final TextEditingController _controller = TextEditingController();
  late Future<num> futureRate;
  String rate = '';
  num userInput = 1;
  var db = new Mysql();
  bool _error = false;
  bool _calculate = false;
  num answer = 0;
  num rateNum = 0;

  navigateToSelectCurrencyPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SelectCurrencyPage()));
  }

  navigateToNavigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NavigationScreen()));
  }

  @override
  void initState() {
    super.initState();
    futureRate =
        API.fetchRate(httpClient, widget.convertFrom, widget.convertTo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                navigateToSelectCurrencyPage();
              }),
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
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  FutureBuilder<num>(
                      future: futureRate,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          rate = snapshot.data.toString();
                          rateNum = double.parse(rate);
                          answer = rateNum * userInput;
                          answer = double.parse((answer).toStringAsFixed(2));
                          if (_calculate == true) {
                            int id = -1;
                            db.getConnection().then((conn) {
                              String update =
                                  'UPDATE test.wallet SET balance = balance + $answer WHERE account_username = "$accUser" AND currency = "${widget.convertTo}"';
                              String updateDb =
                                  'UPDATE test.wallet SET balance = balance - $userInput WHERE account_username = "$accUser" AND currency = "${widget.convertFrom}"';
                              String transaction =
                                  'SELECT * FROM test.wallet where account_username = "$accUser" AND currency = "${widget.convertTo}"';
                              String insertTransaction1 =
                                  "INSERT INTO test.transactions (account_username, description, amount, date) VALUES ('$accUser','${widget.convertFrom} -', '$userInput', '1/1/2021')";
                              String insertTransaction2 =
                                  "INSERT INTO test.transactions (account_username, description, amount, date) VALUES ('$accUser','${widget.convertTo} +', '$answer', '1/1/2021')";
                              
                              conn.query(transaction).then((results) {
                                for (var row in results) {
                                  {
                                    conn.query(update);
                                    conn.query(updateDb);
                                    conn.query(insertTransaction1);
                                    conn.query(insertTransaction2);
                                    id = row[3];
                                  }
                                }
                                if (id == -1) {
                                  String insert =
                                      "INSERT INTO test.wallet (account_username, currency, balance) VALUES ('$accUser','${widget.convertTo}', '$answer')";
                                  conn.query(insert);
                                  conn.query(updateDb);
                                }
                                conn.close();
                                navigateToNavigationPage();
                              });
                            });
                          }
                          return Text(
                              '$userInput ${widget.convertFrom} = $answer ${widget.convertTo}');
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      }),
                  Padding(padding: EdgeInsets.all(20)),
                  Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(border: Border.all()),
                      child: TextField(
                        controller: _controller,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      )),
                  ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _controller,
                    builder: (context, myText, child) {
                      final convertTo = widget.convertTo;
                      final convertFrom = widget.convertFrom;
                      return ElevatedButton(
                        key: Key('convert-button'),
                        child: Text('Convert to $convertTo'),
                        onPressed: myText.text.isNotEmpty &&
                                accBalance >= double.parse(myText.text)
                            ? () {
                                if (double.tryParse(myText.text) != null &&
                                    double.parse(myText.text) >= 0 &&
                                    rate.isNotEmpty &&
                                    accBalance >= double.parse(myText.text)) {
                                  userInput = double.parse(myText.text);
                                  _error = false;
                                  setState(() {
                                    _calculate = true;
                                  });
                                } else {
                                  _error = true;
                                }
                                setState(() {});
                              }
                            : null,
                      );
                    },
                  )
                ]))));
  }
}
