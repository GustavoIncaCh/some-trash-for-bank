import 'dart:async';
import 'dart:convert';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/Variables.dart';
import 'package:bank9780/services/api/json/publicity_json.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Publicity{
  static Future<bool> getPublicity(BuildContext context) async {
    try{
      // Make an Api call for getting full countries list
      final response = await Client().get(
        Uri.parse(Variables.apiPaths.anouncements),
        headers: <String, String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'tenant'     : context.read<DataProvider>().country.name.toUpperCase()
        }
      ).timeout(Variables.apiCallBack);

      response.statusCode == 200?
      context.read<DataProvider>().getPublicity(
        publicity: PublicityJson.fromJson(jsonDecode(utf8.decode(response.bodyBytes)))
      ) : null;
      print("object");
      print(response.body);

      return response.statusCode == 200;
    }
    //on TimeoutException { debugPrint('getPublicity [ Timeout ] exception'); return false; }
    //on SocketException  { debugPrint('getPublicity [ Socket  ] exception'); return false; }
    //on ClientException  { debugPrint('getPublicity [ Client  ] exception'); return false; }
    catch (e) { debugPrint('getPublicity [ Code    ] exception ' + e.toString()); return false; }
  }
}