import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bank9780/properties/variables.dart';
import 'package:bank9780/services/api/json/auth_prob1.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/src/provider.dart';

import '../../../modules/provider/client_provider.dart';
import '../../../modules/provider/data_provider.dart';
import '../json/client_register_json.dart';
//import '../json/validateSecurityCode_json.dart';

class ValidateSecurityCode{
  static Future<bool> getValidateSecurityCode(BuildContext context) async {
    try{
      ClientRegisterJson client = context.read<ClientProvider>().clientRegister!;
      // Make an Api call for getting full countries list
      final response = await Client().post(
        Uri.parse(Variables.apiPaths.clientValidateSecurityCode),
        headers: <String, String>{
          'Authorization': 'Bearer ${context.read<ClientProvider>().firstRegisterJson!.token!}',
          //HttpHeaders.authorizationHeader: context.read<ClientProvider>().firstRegisterJson!.token!,
          'Content-Type'  : 'application/json; charset=UTF-8',
          'tenant'        : context.read<DataProvider>().country.name.toUpperCase(),
          'device'        : context.read<ClientProvider>().firstRegisterJson!.idDevice!
        },
        body: jsonEncode(<String, dynamic>{
          // add de phone code
          "code"                : context.read<ClientProvider>().securityCode
        }),
      ).timeout(Variables.apiCallBack);
      
      context.read<ClientProvider>().getVideoLink(videoLink: GetVideoLink.fromJson(jsonDecode(utf8.decode(response.bodyBytes))));
      debugPrint("----------------------------------------");
      debugPrint(context.read<ClientProvider>().firstRegisterJson!.token!);
      debugPrint("----------------------------------------");
      debugPrint(context.read<ClientProvider>().firstRegisterJson!.idDevice!);
      debugPrint("----------------------------------------");
      debugPrint(response.body.toString());
      debugPrint("answer");
      debugPrint(context.read<ClientProvider>().securityCode.toString());

      return response.statusCode == 200;
    }
    on TimeoutException { debugPrint('getValidateSecurityCode [ Timeout ] exception'); return false; }
    on SocketException  { debugPrint('getValidateSecurityCode [ Socket  ] exception'); return false; }
    on ClientException  { debugPrint('getValidateSecurityCode [ Client  ] exception'); return false; }
    catch (e) { debugPrint('getValidateSecurityCode [ Code    ] exception ' + e.toString()); return false; }
  }
}