import 'package:flutter/material.dart';
import 'NavigationScreen.dart';
import 'TransferScreen.dart';
import 'DepositScreen.dart';

class BalanceScreen extends StatefulWidget{
  @override
  _BalanceScreen createState() => _BalanceScreen();
}
class _BalanceScreen extends State<BalanceScreen>{
  navigateToTransferScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => TransferScreen()));
  }
  navigateToDepositScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DepositScreen()));
  }

  navigateToNavigationScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NavigationScreen()));
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.green,
           leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
          navigateToNavigationScreen();}
    )),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          RaisedButton(
            child: Text('Deposit'),
            color: Colors.lightBlue,
            onPressed: () => navigateToDepositScreen(),
          ),
          RaisedButton(
            child: Text('Transfer'),
            color: Colors.lightBlue,
            onPressed: () => navigateToTransferScreen(),
          )
        ],
      ),
    )
   );
  }
}