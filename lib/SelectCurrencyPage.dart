import 'package:flutter/material.dart';
import './utils/API.dart';
import './globals.dart';
import './ConvertPage.dart';

class SelectCurrencyPage extends StatefulWidget {
  @override
  _SelectCurrencyPageState createState() => _SelectCurrencyPageState();
}

class _SelectCurrencyPageState extends State<SelectCurrencyPage> {
  String dropdownValueFrom = 'USD';
  String dropdownValueTo = 'EUR';
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
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Text('Convert from:'),
                  DropdownButton<String>(
                    value: dropdownValueFrom,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueFrom = newValue!;
                      });
                    },
                    items: <String>['USD', 'EUR', 'GBP', 'MXN']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Padding(padding: EdgeInsets.all(14)),
                  Text('Convert to:'),
                  DropdownButton<String>(
                    value: dropdownValueTo,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueTo = newValue!;
                      });
                    },
                    items: <String>['USD', 'EUR', 'GBP', 'MXN']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Padding(padding: EdgeInsets.all(24)),
                  ElevatedButton(
                    child: Text('Continue'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConvertPage(
                                  dropdownValueFrom, dropdownValueTo)));
                    },
                  )
                ]))));
  }
}
