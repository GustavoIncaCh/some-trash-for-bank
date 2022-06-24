import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/variables.dart';
import 'package:bank9780/services/api/json/terms_json.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';


/// Agencies called from the API
/// ---------------------------------------------------------

class Terms{
  static Future<bool> getTerms(BuildContext context) async{
    debugPrint("intentaa");
    try{
      final response = await Client().get(
        Uri.parse(Variables.apiPaths.terms),
        headers: <String,String>{
        'Content-Type'  : 'application/json; chartset=UTF-8',
        'tenant'      : context.read<DataProvider>().country.name.toUpperCase()
      }
      ).timeout(Variables.apiCallBack);
      // ignore: todo
      // TODO: printLogs
      debugPrint("INGRESA");
      debugPrint(response.body);
      debugPrint("objectdecode");
      //debugPrint(TermJson.fromJson(jsonDecode(utf8.decode(response.bodyBytes))).toString()+"asd");
      debugPrint(response.statusCode.toString()+"not asd");
      response.statusCode==200?
      context.read<DataProvider>().getTerms(
        terms: TermJson.fromJson(jsonDecode(utf8.decode(response.bodyBytes)))
        ):null;
      return response.statusCode==200;
    }
    on TimeoutException { debugPrint('getTerms [ Timeout ] exception'); return false; }
    on SocketException  { debugPrint('getTerms [ Socket  ] exception'); return false; }
    on ClientException  { debugPrint('getTerms [ Client  ] exception'); return false; }
    catch (e) { debugPrint('getTerms [ Code    ] exception ' + e.toString()); return false; }

  }
}