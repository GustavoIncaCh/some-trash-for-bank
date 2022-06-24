import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/Variables.dart';
import 'package:bank9780/services/api/json/locals_json.dart';
import 'package:bank9780/services/api/json/types_json.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class RegisteringInformation{
 //static Future<bool> getTerms(BuildContext context) async{
 //  debugPrint("intentaa");
 //  try{
 //    final response = await Client().get(
 //      Uri.parse(Variables.apiPaths.terms),
 //      headers: <String,String>{
 //      'Content-Type'  : 'application/json; chartset=UTF-8',
 //      'cod_pais'      : context.read<DataProvider>().country.name.toUpperCase()
 //    }
 //    ).timeout(Variables.apiCallBack);
 //    
 //    // todo: printLogs
 //    debugPrint("INGRESA");
 //    debugPrint(response.body);
 //    debugPrint("response.body");
 //    debugPrint(response.statusCode.toString());
 //    response.statusCode==200?
 //    context.read<DataProvider>().getTerms(
 //      terms: TermJson.fromJson(jsonDecode(utf8.decode(response.bodyBytes)))
 //      ):debugPrint("asd");
 //    debugPrint("INGRESA2");
 //    return response.statusCode==200;
 //  }
 //  on TimeoutException { debugPrint('getTerms [ Timeout ] exception'); return false; }
 //  on SocketException  { debugPrint('getTerms [ Socket  ] exception'); return false; }
 //  on ClientException  { debugPrint('getTerms [ Client  ] exception'); return false; }
 //  catch (e) { debugPrint('getTerms [ Code    ] exception ' + e.toString()); return false; }

 //}

  static Future<bool> getDepartments(BuildContext context) async {
    try{
      final response = await Client().get(
        Uri.parse(Variables.apiPaths.departments),
        headers: <String, String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'tenant'     : context.read<DataProvider>().country.name.toUpperCase()
        }
      ).timeout(Variables.apiCallBack);
      response.statusCode == 200?
      context.read<DataProvider>().getDepartments(
        departments: jsonDecode(utf8.decode(response.bodyBytes))['data']
          .cast<Map<String, dynamic>>()
          .map<LocalsJson>(
            (json) => LocalsJson.fromJson(json)
          ).toList()
      ) : null;

      return response.statusCode == 200;
    }
    on TimeoutException { debugPrint('RegisteringInformation.getDepartments [ Timeout ] exception'); return false; }
    on SocketException  { debugPrint('RegisteringInformation.getDepartments [ Socket  ] exception'); return false; }
    on ClientException  { debugPrint('RegisteringInformation.getDepartments [ Client  ] exception'); return false; }
    catch (e) { debugPrint('RegisteringInformation.getDepartments [ Code    ] exception ' + e.toString()); return false; }
  }

  static Future<bool> getProvinces(BuildContext context) async {
    try{
      String path = Variables.apiPaths.provinces +
      '?idDepartment=' +
      context.read<DataProvider>().department!.id;

      // Make an Api call for getting full countries list
      final response = await Client().get(
        Uri.parse(path),
        headers: <String, String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'tenant'     : context.read<DataProvider>().country.name.toUpperCase()
        },
      ).timeout(Variables.apiCallBack);

      // print(jsonDecode(utf8.decode(response.bodyBytes))['data']);

      response.statusCode == 200?
      context.read<DataProvider>().getProvinces(
        provinces: jsonDecode(utf8.decode(response.bodyBytes))['data']
          .cast<Map<String, dynamic>>()
          .map<LocalsJson>(
            (json) => LocalsJson.fromJson(json)
          ).toList()
      ) : null;

      // If response is successful returns the list
      // If something worng return an empty list
      return response.statusCode == 200;
    }
    on TimeoutException { debugPrint('RegisteringInformation.getProvinces [ Timeout ] exception'); return false; }
    on SocketException  { debugPrint('RegisteringInformation.getProvinces [ Socket  ] exception'); return false; }
    on ClientException  { debugPrint('RegisteringInformation.getProvinces [ Client  ] exception'); return false; }
    catch (e) { debugPrint('RegisteringInformation.getProvinces [ Code    ] exception ' + e.toString()); return false; }
  }

  static Future<bool> getDocumnetTypes(BuildContext context) async {
    try{
      debugPrint("intenta");
      final response = await Client().get(
        Uri.parse(Variables.apiPaths.documentType),
        headers: <String, String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'tenant'     : context.read<DataProvider>().country.name.toUpperCase()
        }
      ).timeout(Variables.apiCallBack);
      debugPrint("intenta con respeusta" +response.statusCode.toString());
      
      debugPrint("termina intenta"+ response.body);
      response.statusCode == 200
      ? context.read<DataProvider>().getTypes(
        allTypes: TypesJson.fromJson( jsonDecode(utf8.decode(response.bodyBytes)))
      )
      : null;
      
      debugPrint("termina intenta");

      return response.statusCode == 200;
    }
    on TimeoutException { debugPrint('RegisteringInformation.getDocumnetTypes [ Timeout ] exception'); return false; }
    on SocketException  { debugPrint('RegisteringInformation.getDocumnetTypes [ Socket  ] exception'); return false; }
    on ClientException  { debugPrint('RegisteringInformation.getDocumnetTypes [ Client  ] exception'); return false; }
    catch (e) { debugPrint('RegisteringInformation.getDocumnetTypes [ Code    ] exception ' + e.toString()); return false; }
  }
}