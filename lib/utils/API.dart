import 'dart:ffi';

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
