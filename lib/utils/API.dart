import 'dart:ffi';
import 'package:senior_project/models/mysql.dart';
import 'package:senior_project/models/dbinfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static Future<num> fetchRate(
      http.Client client, String from, String to) async {
    var url = Uri.parse('https://api.exchangerate.host/latest');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      bool success = await json['success'];
      if (success == true) {
        num convertFrom = await json["rates"][from];
        num convertTo = await json["rates"][to];
        return convertTo / convertFrom;
      }
    }
    throw Exception('API request failed');
  }
}

class SQL {
  static Future<List<List<dynamic>>> fetchWallets() async {
    var db = new Mysql();
    late List<List<dynamic>> wallets = [];
    await db.getConnection().then((conn) async {
      String retrieve =
          'SELECT * FROM test.wallet where account_username = "$accUser";';
      await conn.query(retrieve).then((results) {
        for (var row in results) {
          wallets.add(row);
        }
        ;
      });
    });
    if (wallets.isEmpty) {
      return [
        [0]
      ];
    } else {
      return wallets;
    }
  }

  static Future<List<List<dynamic>>> fetchTransactions() async {
    var db = new Mysql();
    late List<List<dynamic>> transactions = [];
    await db.getConnection().then((conn) async {
      String retrieve =
          'SELECT * FROM test.transactions where account_username = "$accUser";';
      await conn.query(retrieve).then((results) {
        for (var row in results) {
          transactions.add(row);
        }
      });
    });
    if (transactions.isEmpty) {
      return [
        [0]
      ];
    } else {
      return transactions;
    }
  }

  static Future<List<List<dynamic>>> fetchCurrencyTransactions(
      String currency) async {
    var db = new Mysql();
    late List<List<dynamic>> transactions = [];
    await db.getConnection().then((conn) async {
      String retrieve =
          'SELECT * FROM test.transactions where account_username = "$accUser" AND currency = "$currency"';
      await conn.query(retrieve).then((results) {
        for (var row in results) {
          transactions.add(row);
        }
        ;
      });
    });
    if (transactions.isEmpty) {
      return [
        [0]
      ];
    } else {
      return transactions;
    }
  }

  static Future<num> fetchNumT(bool all) async {
    late List<List<dynamic>> wallets;
    if (all) {
      wallets = await fetchTransactions();
    } else {
      wallets = await fetchCurrencyTransactions(currency);
    }

    int i = 0;
    while (true) {
      try {
        wallets[i];
      } catch (RangeError) {
        break;
      }
      i++;
    }
    return i;
  }

  static Future<num> fetchNum() async {
    List<List<dynamic>> wallets = await fetchWallets();

    int i = 0;
    while (true) {
      try {
        wallets[i];
      } catch (RangeError) {
        break;
      }
      i++;
    }
    return i;
  }

  static Future<num> fetchBalance(String cur) async {
    num balance = 0;
    var db = new Mysql();
    await db.getConnection().then((conn) async {
      String retrieve =
          'SELECT * FROM test.wallet where account_username = "$accUser" AND currency = "$cur";';
      await conn.query(retrieve).then((results) {
        for (var row in results) {
          balance = row[2];
        }
        ;
      });
    });

    return balance;
  }
}
