import 'dart:convert';

ClientRegisterJson clientRegisterJsonFromJson(String str) =>
ClientRegisterJson.fromJson(json.decode(str));

String clientRegisterJsonToJson(ClientRegisterJson data) =>
json.encode(data.toJson());

class ClientRegisterJson {
  ClientRegisterJson({
    this.phone                = '',
    this.pin                  = '',
    this.numDocument          = '',
    this.names                = '',
    this.surnames             = '',
    this.email                = '',
    this.idTypeDocument       = 0,
    this.address              = '',
    this.dateBirth            = '',
    this.codRefer             = '',
    //todo: check for the fatherRefer
    //this.fatherRefer        = '',
    // todo: terminar de cambiar los prefix de usuarios
    this.prefixPhone          = '',
    //this.isoCountry         = '',
    this.idDepartament        = '',
    this.idProvince           = '',
    this.isoLanguage          = '',
    this.descriptionDevice    = '',
  });

  String names;
  String surnames;
  int    idTypeDocument;
  String numDocument;
  String dateBirth;
  String address;
  String email;
  String codRefer;
  //String fatherRefer;
  //String isoCountry;
  String  pin;
  String idDepartament;
  String idProvince;
  String prefixPhone;
  String phone;
  String isoLanguage;
  String descriptionDevice;

  factory ClientRegisterJson.fromJson(Map<String, dynamic> json) => ClientRegisterJson(
    names             : json[ "names"             ] ?? '',
    surnames          : json[ "surnames"          ] ?? '',
    idTypeDocument    : int.parse(json[ "idTypeDocument"    ] ?? '0'),
    numDocument       : json[ "numDocument"       ] ?? '',
    dateBirth         : json[ "dateBirth"         ] ?? '',
    address           : json[ "address"           ] ?? '',
    email             : json[ "email"             ] ?? '',
    codRefer          : json[ "codRefer"          ] ?? '',
    //fatherRefer       : json[ "fatherRefer"     ] ?? '',
    //isoCountry        : json[ "isoCountry"      ] ?? '',
    pin               : json[ "pin"               ] ?? '',
    idDepartament     : json[ "idDepartament"     ] ?? '',
    idProvince        : json[ "idProvince"        ] ?? '',
    prefixPhone       : json[ "prefixPhone"       ] ?? '',
    phone             : json[ "phone"             ] ?? '',
    isoLanguage       : json[ "isoLanguage"       ] ?? '',
    descriptionDevice : json[ "descriptionDevice" ] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "names"             : names,
    "surnames"          : surnames,
    "idTypeDocument"    : idTypeDocument,
    "numDocument"       : numDocument,
    "dateBirth"         : dateBirth,
    "address"           : address,
    "email"             : email,
    "codRefer"          : codRefer,
    //"fatherRefer"       : fatherRefer,
    //"isoCountry"        : isoCountry,
    "pin"               : pin,
    "idDepartament"     : idDepartament,
    "idProvince"        : idProvince,
    "prefixPhone"       : prefixPhone,
    "phone"             : phone,
    "isoLanguage"       : isoLanguage,
    "descriptionDevice" : descriptionDevice,
  };
}
