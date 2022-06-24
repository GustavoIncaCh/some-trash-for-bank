import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/services/database/body.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';

class RegisterData{

  /// Register [setIds.idDevice] from [ClientProvider]
  static Future<void> idDevice(
    BuildContext context,
    { required String idDevice }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawUpdate( "UPDATE registerTable Set idDevice = ?", [ idDevice ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (idDevice) VALUES (?)", [ idDevice ] );
    }
    context.read<ClientProvider>().setIdDevice( idDevice: idDevice );
  }

  /// Register [setIds.idUser] from [ClientProvider]
  static Future<void> idUser(
    BuildContext context,
    { required String idUser }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawUpdate( "UPDATE registerTable Set idUser = ?", [ idUser ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (idUser) VALUES (?)", [ idUser ] );
    }
    context.read<ClientProvider>().setIdUser( idUser: idUser );
  }

  /// Register [setIds.token] from [ClientProvider]
  static Future<void> token(
    BuildContext context,
    { required String token }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawUpdate( "UPDATE registerTable Set token = ?", [ token ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (token) VALUES (?)", [ token ] );
    }
    context.read<ClientProvider>().setToken( token: token );
  }

  /// Register [clientRegister.names] from [ClientProvider]
  static Future<void> names(
    BuildContext context,
    { required String names }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawUpdate( "UPDATE registerTable Set names = ?", [ names ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (names) VALUES (?)", [ names ] );
    }
    context.read<ClientProvider>().changeClientRegisterNames( names: names );
  }

  /// Register [clientRegister.surnames] from [ClientProvider]
  static Future<void> surnames(
    BuildContext context,
    { required String surnames }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawUpdate( "UPDATE registerTable Set surnames = ?", [ surnames ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (surnames) VALUES (?)", [ surnames ] );
    }
    context.read<ClientProvider>().changeClientRegisterSurnames( surnames: surnames );
  }

  /// Register [clientRegister.idTypeDocument] from [ClientProvider]
  static Future<void> documentype(
    BuildContext context,
    { required int idTypeDocument }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set idTypeDocument = ?", [ idTypeDocument ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (idTypeDocument) VALUES (?)", [ idTypeDocument ] );
    }
    context.read<ClientProvider>().changeClientRegisterDocumentype( idTypeDocument: idTypeDocument );
  }

  /// Register [clientRegister.document] from [ClientProvider]
  static Future<void> numDocument(
    BuildContext context,
    { required String numDocument }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set numDocument = ?", [ numDocument ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (numDocument) VALUES (?)", [ numDocument ] );
    }
    context.read<ClientProvider>().changeClientRegisternumDocument( numDocument: numDocument );
  }

  /// Register [clientRegister.dateBirth] from [ClientProvider]
  static Future<void> dateBirth(
    BuildContext context,
    { required String dateBirth }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set dateBirth = ?", [ dateBirth ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (dateBirth) VALUES (?)", [ dateBirth ] );
    }
    context.read<ClientProvider>().changeClientRegisterdateBirth( dateBirth: dateBirth );
  }

  /// Register [clientRegister.address] from [ClientProvider]
  static Future<void> address(
    BuildContext context,
    { required String address }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set address = ?", [ address ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (address) VALUES (?)", [ address ] );
    }
    context.read<ClientProvider>().changeClientRegisteraddress( address: address );
  }

  /// Register [clientRegister.email] from [ClientProvider]
  static Future<void> email(
    BuildContext context,
    { required String email }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set email = ?", [ email ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (email) VALUES (?)", [ email ] );
    }
    context.read<ClientProvider>().changeClientRegisterEmail( email: email );
  }

  /// Register [clientRegister.codRefer] from [ClientProvider]
  static Future<void> codRefer(
    BuildContext context,
    { required String codRefer }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set codRefer = ?", [ codRefer ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (codRefer) VALUES (?)", [ codRefer ] );
    }
    context.read<ClientProvider>().changeClientRegisterCodRefer( codRefer: codRefer );
  }

    //todo: check for the fatherRefer 
  /// Register [clientRegister.fatherRefer] from [ClientProvider]
//static Future<void> fatherRefer(
//  BuildContext context,
//  { required String fatherRefer }
//) async {
//  Database database = await DataBase.path();
//  if( await database.rawInsert( "UPDATE registerTable Set fatherRefer = ?", [ fatherRefer ] ) == 0) {
//    await database.rawInsert( "INSERT INTO registerTable (fatherRefer) VALUES (?)", [ fatherRefer ] );
//    context.read<ClientProvider>().changeClientRegisterFatherRefer( fatherRefer: fatherRefer );
//  }
//}
//
  /// Register [clientRegister.pin] from [ClientProvider]
  static Future<void> pin(
    BuildContext context,
    { required String pin }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set pin = ?", [ pin ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (pin) VALUES (?)", [ pin ] );
    }
    context.read<ClientProvider>().changeClientRegisterPin( pin: pin );
  }

  /// Register [clientRegister.idDepartament] from [ClientProvider]
  static Future<void> idDepartament(
    BuildContext context,
    { required String idDepartament }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set idDepartament = ?", [ idDepartament ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (idDepartament) VALUES (?)", [ idDepartament ] );
    }
    context.read<ClientProvider>().changeClientRegisterIdDepartament( idDepartament: idDepartament );
  }

  /// Register [clientRegister.idProvince] from [ClientProvider]
  static Future<void> idProvince(
    BuildContext context,
    { required String idProvince }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set idProvince = ?", [ idProvince ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (idProvince) VALUES (?)", [ idProvince ] );
    }
    context.read<ClientProvider>().changeClientRegisterIdProvince(idProvince: idProvince);
  }

  /// Register [clientRegister.prefixPhone] from [ClientProvider]
  static Future<void> prefixPhone(
    BuildContext context,
    { required String prefixPhone }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set prefixPhone = ?", [ prefixPhone ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (prefixPhone) VALUES (?)", [ prefixPhone ] );
    }
    context.read<ClientProvider>().changeClientRegisterprefixPhone(prefixPhone: prefixPhone);
  }

  /// Register [clientRegister.telephone] from [ClientProvider]
  static Future<void> phone(
    BuildContext context,
    { required String phone }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set phone = ?", [ phone ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (phone) VALUES (?)", [ phone ] );
    }
    context.read<ClientProvider>().changeClientRegisterPhone(phone: phone);
  }
  
  /// Register [clientRegister.descriptionDevice] from [ClientProvider]
  static Future<void> descriptionDevice(
    BuildContext context,
    { required String descriptionDevice }
  ) async {
    Database database = await DataBase.path();
    if( await database.rawInsert( "UPDATE registerTable Set descriptionDevice = ?", [ descriptionDevice ] ) == 0) {
      await database.rawInsert( "INSERT INTO registerTable (descriptionDevice) VALUES (?)", [ descriptionDevice ] );
    }
    context.read<ClientProvider>().changeClientDescriptionDevice(descriptionDevice: descriptionDevice);
  }

  ///! DELETE ALL INFORMATION
  static Future<void> deleteAll(BuildContext context) async {
    Database database = await DataBase.path();
    await database.rawInsert( "DELETE FROM registerTable" );
    context.read<ClientProvider>().clientRegisterDelete();
  }

  static Future<void> getFirstData(BuildContext context) async {
    Database database = await DataBase.path();
    List<Map> query = await database.rawQuery( 'SELECT * FROM registerTable' );
    Future.delayed(
      const Duration(milliseconds: 50),
      () {
        if(query.isNotEmpty){
          context.read<ClientProvider>().clientRegisterFill(
            names               : query.last[ 'names'             ] ?? '' ,
            surnames            : query.last[ 'surnames'          ] ?? '' ,
            numDocument         : query.last[ 'numDocument'       ] ?? '' ,
            idTypeDocument      : query.last[ 'idTypeDocument'    ] ?? 0  ,
            dateBirth           : query.last[ 'dateBirth'         ] ?? '' ,
            address             : query.last[ 'address'           ] ?? '' ,
            email               : query.last[ 'email'             ] ?? '' ,
            codRefer            : query.last[ 'codRefer'          ] ?? '' ,
            fatherRefer         : query.last[ 'fatherRefer'       ] ?? '' ,
            pin                 : query.last[ 'pin'               ] ?? '' ,
            idDepartament       : query.last[ 'idDepartament'     ] ?? '' ,
            idProvince          : query.last[ 'idProvince'        ] ?? '' ,
            prefixPhone         : query.last[ 'prefixPhone'       ] ?? '' ,
            phone               : query.last[ 'phone'             ] ?? '' ,
            descriptionDevice   : query.last[ 'descriptionDevice' ] ?? '' ,
            idDevice            : query.last[ 'idDevice'          ] ?? '' ,
            idUser              : query.last[ 'idUser'            ] ?? '' ,
            token               : query.last[ 'token'             ] ?? '' ,
          );
        }
      }
    );
    // print(query.first);
    // return query.isNotEmpty
    // ? ClientRegisterJson.fromJson(json.decode(query.first.toString().replaceAll('null', '')))
    // : ClientRegisterJson();
  }

  // static Future<void> getIds(BuildContext context) async {
  //   Database database = await DataBase.path();
  //   List<Map> query = await database.rawQuery( 'SELECT * FROM registerTable' );
  //   Future.delayed(
  //     const Duration(milliseconds: 50),
  //     () {
  //       if(query.isNotEmpty){
  //         context.read<ClientProvider>().idsFill(
  //           idDevice    : query.last[ 'idDevice'  ] ?? '' ,
  //           idUser      : query.last[ 'idUser'    ] ?? '' ,
  //           token       : query.last[ 'token'     ] ?? '' ,
  //         );
  //       }
  //     }
  //   );
  //   // print(query.first);
  //   // return query.isNotEmpty
  //   // ? ClientRegisterJson.fromJson(json.decode(query.first.toString().replaceAll('null', '')))
  //   // : ClientRegisterJson();
  // }

}