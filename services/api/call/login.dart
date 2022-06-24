import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bank9780/modules/provider/operation_provider.dart';
import 'package:bank9780/properties/Variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../../modules/provider/client_provider.dart';
import '../../../modules/provider/data_provider.dart';
import '../json/client_register_json.dart';
import '../json/login_json.dart';

class Login{
  static Future<bool> getLogin(BuildContext context) async {
    try{
            ClientRegisterJson client = context.read<ClientProvider>().clientRegister!;

        
        debugPrint("phone"+client.phone);
      // Make an Api call for getting full countries list
      final response = await Client().post(
        Uri.parse(Variables.apiPaths.clientLogin),
        headers: <String, String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'tenant'     : context.read<DataProvider>().country.name.toUpperCase()
        },
        body: jsonEncode(<String, dynamic>{
          // ----------------------------IP RONNY---------------------------//
          //"phone"             : client.phone=='' && client.document==''? "875 421 546" : client.phone,
          //"nroDocument"       : client.document=='' ? " 54872154" : client.document,
          //------------------IP GENERAL --------------------------//
          "phone"             : client.phone =='' && client.numDocument =='' ? "931548460" : client.phone.replaceAll(' ', ''),
          "numDocument"       : client.numDocument =='' ? "99999999" : client.numDocument,
          //------------------------------------------------------------
          //"phone"             : "666 666 123",
          //"nroDocument"       : "80955333",
          //"pin"               : "111111",
          "pin"               : client.pin == '' ? "999999" : client.pin,
        })
      ).timeout(Variables.apiCallBack);
      debugPrint(response.body.toString());
      debugPrint(client.pin);
      response.statusCode == 200?
      context.read<OperationProvider>().getLogin(
        login: ClientLoginJson.fromJson(jsonDecode(utf8.decode(response.bodyBytes)))
      ) : null;

      return response.statusCode == 200;
    }
    on TimeoutException { debugPrint('getLogin [ Timeout ] exception'); return false; }
    on SocketException  { debugPrint('getLogin [ Socket  ] exception'); return false; }
    on ClientException  { debugPrint('getLogin [ Client  ] exception'); return false; }
    catch (e) { debugPrint('getLogin [ Code    ] exception ' + e.toString()); return false; }
  }
}

Map<String, dynamic> parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}
