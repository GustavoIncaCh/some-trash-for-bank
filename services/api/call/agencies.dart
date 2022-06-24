import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/variables.dart';
import 'package:bank9780/services/api/json/agencies_json.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

/// Agencies called from the API
/// ---------------------------------------------------------

class Agencies{
  static Future<bool> getAgencies(BuildContext context) async{
    try{
      final response = await Client().get(
        Uri.parse(Variables.apiPaths.clientAgencies),
        headers: <String,String>{
        'Content-Type'  : 'application/json; chartset=UTF-8',
        'tenant'      : context.read<DataProvider>().country.name.toUpperCase()
      }
      ).timeout(Variables.apiCallBack);
      
      // ignore: todo
      // TODO: printLogs
      //debugPrint("INGRESA");
      //print(response.body);
      
      response.statusCode==200?
      context.read<DataProvider>().getAgencies(
        agencies: AgenciesJson.fromJson(jsonDecode(utf8.decode(response.bodyBytes)))
        ):null;
      return response.statusCode==200;
    }
    on TimeoutException { debugPrint('getAgencies [ Timeout ] exception'); return false; }
    on SocketException  { debugPrint('getAgencies [ Socket  ] exception'); return false; }
    on ClientException  { debugPrint('getAgencies [ Client  ] exception'); return false; }
    catch (e) { debugPrint('getAgencies [ Code    ] exception ' + e.toString()); return false; }

  }
}