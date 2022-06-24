import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bank9780/modules/general/enum.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/Variables.dart';
import 'package:bank9780/services/api/json/client_register_json.dart';
import 'package:bank9780/services/api/json/first_register_json.dart';
import 'package:bank9780/services/database/queries/register_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Clients{
  static Future<bool> postClient(BuildContext context) async {
    try{
      ClientRegisterJson client = context.read<ClientProvider>().clientRegister!;
      Countries country = context.read<DataProvider>().country;
      Languages language = context.read<DataProvider>().language;
      
      // ignore: todo
      /// TODO: this function must be called in the interface
      /// ------------------------------------------------------------------
      
      //client.names            = "Sabado";
      //client.surnames         = "Hernandes";
      //client.idTypeDocument     = 11;
      //client.document         = "96857412";
      //client.dateBirth         = "1997-07-10T17:32:28Z";
      //client.address        = "Direccion nueva";
      //client.email            = "sabar9@gmail.com";
      // todo: for elder version uncoment isocountry
      //client.isoCountry       = country.name.toUpperCase();
      //if (client.pin=="") client.pin = "111111";
      //client.idDepartament    = "04";
      //client.idProvince       = "0401";
      client.prefixPhone  = country == Countries.pe? '+51' : '+11';
      //client.phone            = "951478236";
      client.isoLanguage       = language == Languages.es? 'es' : 'pt';

      //client.names            = "Nani";
      //client.surnames         = "Rogue";
      if (client.idTypeDocument==0) client.idTypeDocument     = 11;
      //client.document         = "98765432";
      //client.dateBirth         = "1998-10-25T17:32:28Z";
      //client.address        = "Faerlina-Horda";
      //client.email            = "naniRogue@gmail.com";
      //client.isoCountry       = country.name.toUpperCase();
      //client.pin              = "333333";
      if (client.idDepartament=="") client.idDepartament    = "01";
      if (client.idProvince=="") client.idProvince       = client.idDepartament+"01";
      //client.prefixPhone  = country == Countries.pe? '+51' : '+11';
      //client.phone            = "147258369";
      //client.isoLanguage       = language == Languages.es? 1 : 3;
      client.descriptionDevice = "phone";
      //context.read<ClientProvider>().phoneValidateSpace(phone: context.read<ClientProvider>().clientRegister!.phone);

      //debugPrint("names  "+context.read<ClientProvider>().clientRegister!.names);
      //debugPrint("surnames  "+context.read<ClientProvider>().clientRegister!.surnames);
      //debugPrint("idTypeDocument  "+context.read<ClientProvider>().clientRegister!.idTypeDocument.toString());
      //debugPrint("document  "+context.read<ClientProvider>().clientRegister!.numDocument);
      //debugPrint("dateBirth  "+context.read<ClientProvider>().clientRegister!.dateBirth);
      //debugPrint("address  "+context.read<ClientProvider>().clientRegister!.address);
      //debugPrint("email  "+context.read<ClientProvider>().clientRegister!.email);
      //debugPrint("codRefer  "+context.read<ClientProvider>().clientRegister!.codRefer);
      ////debugPrint("fatherRefer  "+context.read<ClientProvider>().clientRegister!.fatherRefer);
      ////debugPrint("isoCountry  "+context.read<ClientProvider>().clientRegister!.isoCountry);
      //debugPrint("pin  "+context.read<ClientProvider>().clientRegister!.pin);
      //debugPrint("idDepartament  "+context.read<ClientProvider>().clientRegister!.idDepartament);
      //debugPrint("idProvince  "+context.read<ClientProvider>().clientRegister!.idProvince);
      //debugPrint("prefixPhone  "+context.read<ClientProvider>().clientRegister!.prefixPhone);
      //debugPrint("phone  "+context.read<ClientProvider>().clientRegister!.phone);
      //debugPrint("isoLanguage  "+context.read<ClientProvider>().clientRegister!.isoLanguage.toString());
      //debugPrint("desciptionDevice  "+context.read<ClientProvider>().clientRegister!.descriptionDevice);
      
          debugPrint("clien sin phone"+client.phone);
          debugPrint("clien phone"+client.phone.replaceAll(' ', '').toString());
      final response = await Client().post(
        Uri.parse(Variables.apiPaths.clientRegister),
        headers: <String, String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'tenant'     : context.read<DataProvider>().country.name
        },
        body: jsonEncode(<String, dynamic>{
          "names"              : client.names,
          "surnames"          : client.surnames,
          "idTypeDocument"    : client.idTypeDocument,
          "numDocument"          : client.numDocument,
          "dateBirth"          : client.dateBirth,
          "address"         : client.address,
          "email"             : client.email,
          "codRefer"          : client.codRefer,
          //todo: check for the fatherRefer 
          //"fatherRefer"       : client.fatherRefer,
          //"isoCountry"        : client.isoCountry,
          "pin"               : client.pin,
          "idDepartment"      : client.idDepartament,
          "idProvince"        : client.idProvince,
          "prefixPhone"   : client.prefixPhone,
          "phone"       : client.phone.replaceAll(' ', ''),
          "isoLanguage"        : client.isoLanguage,
          "descriptionDevice" : client.descriptionDevice,
        })
      ).timeout(Variables.apiCallBack);

      // ignore: todo
      // TODO: printlogs
      debugPrint("ingresa a los clientes");
      debugPrint(response.request.toString());
      debugPrint(response.body);
      debugPrint(response.isRedirect.toString());
      response.statusCode == 200
          ? context.read<ClientProvider>().getFirstRegister(
              firstRegisterJson: FirstRegisterJson.fromJson(
                  jsonDecode(utf8.decode(response.bodyBytes))))
          : null;

      // response.statusCode == 200?
      // context.read<DataProvider>().getPublicity(
      //   publicity: PublicityJson.fromJson(jsonDecode(utf8.decode(response.bodyBytes)))
      // ) : null;

      // If response is successful returns the list
      // If something worng return an empty list
    RegisterData.idDevice(context, idDevice: context.read<ClientProvider>().firstRegisterJson!.idDevice!);
    RegisterData.idUser(context, idUser: context.read<ClientProvider>().firstRegisterJson!.idUser!);
    RegisterData.token(context, token: context.read<ClientProvider>().firstRegisterJson!.token!);
      return response.statusCode == 200;
    }
    on TimeoutException { debugPrint('Clients.registerClient [ Timeout ] exception'); return false; }
    on SocketException  { debugPrint('Clients.registerClient [ Socket  ] exception'); return false; }
    on ClientException  { debugPrint('Clients.registerClient [ Client  ] exception'); return false; }
    // catch (e) { debugPrint('Clients.registerClient [ Code    ] exception ' + e.toString()); return false; }
  }
}