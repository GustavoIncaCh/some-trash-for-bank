import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../../modules/provider/operation_provider.dart';
import '../json/forgot_pin_json.dart';


/// Agencies called from the API
/// ---------------------------------------------------------

class ForgotPin{
  static Future<bool> getForgottenPin(BuildContext context) async{
    debugPrint("intentaa");
    try{
      final response = await Client().post(
        Uri.parse(Variables.apiPaths.clientForgottenPin),
        headers: <String,String>{
        'Content-Type'  : 'application/json; chartset=UTF-8',
        'tenant'      : context.read<DataProvider>().country.name.toUpperCase()
      },
        body: jsonEncode(<String, dynamic>{
          "telephone"             : context.read<OperationProvider>().forgottenPinPhone,
          "nroDocument"       : context.read<OperationProvider>().forgottenPinDocument,
        })
      ).timeout(Variables.apiCallBack);
      
      // ignore: todo
      // TODO: printLogs
      debugPrint("INGRESA");
      debugPrint(response.body);
      //debugPrint(context.read<OperationProvider>().forgottenPinPhone+"asd");
      //debugPrint(context.read<OperationProvider>().forgottenPinDocument+"dsa");
      debugPrint("objectdecode");
      //debugPrint(TermJson.fromJson(jsonDecode(utf8.decode(response.bodyBytes))).toString()+"asd");
      debugPrint(response.statusCode.toString()+"not asd");
      //response.statusCode!=200?
      context.read<OperationProvider>().getForgottenPin(
        forgottenPin: ClientForgottenPinJson.fromJson(jsonDecode(utf8.decode(response.bodyBytes))));
       // :null;
      return response.statusCode==200;
    }
    on TimeoutException { debugPrint('getForgottenPin [ Timeout ] exception'); return false; }
    on SocketException  { debugPrint('getForgottenPin [ Socket  ] exception'); return false; }
    on ClientException  { debugPrint('getForgottenPin [ Client  ] exception'); return false; }
    catch (e) { debugPrint('getForgottenPin [ Code    ] exception ' + e.toString()); return false; }

  }
}