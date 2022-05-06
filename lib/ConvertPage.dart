import 'package:flutter/material.dart';
import 'package:senior_project/SelectCurrencyPage.dart';
import './utils/API.dart';
import './globals.dart';
import 'package:senior_project/models/dbinfo.dart';

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
  bool _error = false;
  bool _calculate = false;
  num answer = 0;
  num rateNum = 0;

   navigateToSelectCurrencyPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SelectCurrencyPage()));}
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
          leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
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
