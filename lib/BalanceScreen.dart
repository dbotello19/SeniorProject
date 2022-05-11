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

    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Padding(padding: EdgeInsets.all(35)),
          SizedBox(
            width: 200,
            height: 50,
            child: 
              RaisedButton(
              child: Text('Deposit',
              style: TextStyle(fontSize: 28, color: Colors.white)),
              color: Colors.green,
              onPressed: () => navigateToDepositScreen(),
          ),
          ),
          
          Padding(padding: EdgeInsets.all(35)),
          SizedBox(
            width: 200,
            height: 50,
           child:RaisedButton(
            child: Text('Transfer',
            style: TextStyle(fontSize: 28, color: Colors.white)),
            color: Colors.green,
            onPressed: () => navigateToTransferScreen(),
          ) 
          )
          
        ],
    )),
    
   );
  }
}