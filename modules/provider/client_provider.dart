import 'dart:io';

import 'package:bank9780/services/api/json/auth_prob1.dart';
import 'package:bank9780/services/api/json/client_register_json.dart';
import 'package:bank9780/services/api/json/first_register_json.dart';

import 'package:flutter/material.dart';

///  User Information building main class
///-----------------------------------------------------
///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
///  - email: 9780desarrollador09@gmail.com
///  - Date : 14/02/2022
class ClientProvider extends ChangeNotifier {
  ClientRegisterJson? clientRegister;
  FirstRegisterJson? firstRegisterJson;
  int securityCode=0;
  bool terms = false;
  File? dniFront;
  File? dniBack;
  File? selfie;
  String? webViewVideoCall;
  GetVideoLink? videoLink;
  // ids
  String idDevice = '';
  String idUser = '';
  String token = '';

  /// Create a new [clientRegister] object for posting
  clientRegisterCreate(BuildContext context){
    clientRegister = ClientRegisterJson(
      names             : "",
      surnames          : "",
      idTypeDocument    : 0,
      numDocument       : "",
      dateBirth         : "",
      address           : "",
      email             : "",
      codRefer          : "",
      //todo: check for the fatherRefer 
      //fatherRefer       : "",
      //isoCountry        : "",
      pin               : "",
      idDepartament     : "",
      idProvince        : "",
      prefixPhone       : "",
      phone             : "",
      isoLanguage       : '',
      descriptionDevice : "",
    );
    notifyListeners();
  }

  getVideoLink({required GetVideoLink videoLink}){
    this.videoLink = videoLink;
    notifyListeners();
  }

  getWebViewVideoCallasync({required String webViewVideoCall}){
    this.webViewVideoCall = webViewVideoCall;
    notifyListeners();
  }
  changeSecurityCode({required int securityCode}){
    this.securityCode = securityCode;
    notifyListeners();
  }

  getFirstRegister({required FirstRegisterJson firstRegisterJson}){
    //debugPrint("Ingresa al get terms del provider");
    this.firstRegisterJson = firstRegisterJson;
    notifyListeners();
  }

  getDniFront({required File dniFront}){
    debugPrint("Ingresa al get image front dni del provider");
    this.dniFront = dniFront;
    notifyListeners();
  }
  
  getDniBack({required File dniBack}){
    debugPrint("Ingresa al get image back dni del provider");
    this.dniBack = dniBack;
    notifyListeners();
  }
  
  getSelfie({required File selfie}){
    debugPrint("Ingresa al get image selfie del provider");
    this.selfie = selfie;
    notifyListeners();
  }

  /// this will be used when DB get information
  clientRegisterFill({
    required String names,
    required String surnames,
    required String numDocument,
    required int    idTypeDocument,
    required String dateBirth,
    required String address,
    required String email,
    required String codRefer,
    required String fatherRefer,
    required String pin,
    required String idDepartament,
    required String idProvince,
    required String prefixPhone,
    required String phone,
    required String descriptionDevice,
    required String idDevice,
    required String idUser,
    required String token,
  }){
    clientRegister!.names               = names;
    clientRegister!.surnames            = surnames;
    clientRegister!.numDocument         = numDocument;
    clientRegister!.idTypeDocument      = idTypeDocument;
    clientRegister!.dateBirth           = dateBirth;
    clientRegister!.address             = address;
    clientRegister!.email               = email;
    clientRegister!.codRefer            = codRefer;
    //clientRegister!.fatherRefer         = fatherRefer;
    clientRegister!.pin                 = pin;
    clientRegister!.idDepartament       = idDepartament;
    clientRegister!.idProvince          = idProvince;
    clientRegister!.prefixPhone         = prefixPhone;
    clientRegister!.phone               = phone;
    clientRegister!.descriptionDevice   = descriptionDevice;
    this.idDevice = idDevice;
    this.idUser = idUser;
    this.token = token;
    notifyListeners();
  }

  // idsFill({
  //   required String idDevice,
  //   required String idUser,
  //   required String token,
  // }){
    
  //   this.idDevice = idDevice;
  //   this.idUser = idUser;
  //   this.token = token;
  //   notifyListeners();
  // }

  bool firstClientFields() {
    return
  clientRegister!.names.isNotEmpty &&
  clientRegister!.surnames.isNotEmpty &&
  clientRegister!.numDocument.isNotEmpty &&
  clientRegister!.dateBirth.isNotEmpty;
  }
  bool secondClientFields() =>
  clientRegister!.phone.isNotEmpty ||
  clientRegister!.address.isNotEmpty ||
  clientRegister!.email.isNotEmpty;

  /// Delete [clientRegister] after register is done
  clientRegisterDelete() {
    clientRegister = null;
    notifyListeners();
  }

  /// Delete [clientRegister] after register is done
  switchTerms({required bool state}) {
    terms = state;
    notifyListeners();
  }
  

  /// Change [clientRegister.names]
  changeClientRegisterNames({required String names}) {
    clientRegister!.names = names;
    notifyListeners();
  }

  /// Change [clientRegister.surnames]
  changeClientRegisterSurnames({required String surnames}) {
    clientRegister!.surnames = surnames;
    notifyListeners();
  }

  /// Change [clientRegister.idTypeDocument]
  changeClientRegisterDocumentype({required int idTypeDocument}) {
    clientRegister!.idTypeDocument = idTypeDocument;
    notifyListeners();
  }

  /// Change [clientRegister.numDocument]
  changeClientRegisternumDocument({required String numDocument}) {
    clientRegister!.numDocument = numDocument;
    notifyListeners();
  }

  /// Change [clientRegister.dateBirth]
  changeClientRegisterdateBirth({required String dateBirth}) {
    clientRegister!.dateBirth = dateBirth;
    notifyListeners();
  }

  /// Change [clientRegister.address]
  changeClientRegisteraddress({required String address}) {
    clientRegister!.address = address;
    notifyListeners();
  }

  /// Change [clientRegister.email]
  changeClientRegisterEmail({required String email}) {
    clientRegister!.email = email;
    notifyListeners();
  }

  /// Change [clientRegister.codRefer]
  changeClientRegisterCodRefer({required String codRefer}) {
    clientRegister!.codRefer = codRefer;
    notifyListeners();
  }

    //todo: check for the fatherRefer 
  /// Change [clientRegister.fatherRefer]
  //changeClientRegisterFatherRefer({required String fatherRefer}) {
  //  clientRegister!.fatherRefer = fatherRefer;
  //  notifyListeners();
  //}

  /// Change [clientRegister.pin]
  changeClientRegisterPin({required String pin}) {
    clientRegister!.pin = pin;
    notifyListeners();
  }

  /// Change [clientRegister.idDepartament]
  changeClientRegisterIdDepartament({required String idDepartament}) {
    clientRegister!.idDepartament = idDepartament;
    notifyListeners();
  }

  /// Change [clientRegister.idProvince]
  changeClientRegisterIdProvince({required String idProvince}) {
    clientRegister!.idProvince = idProvince;
    notifyListeners();
  }

  /// Change [clientRegister.prefixPhone]
  changeClientRegisterprefixPhone({required String prefixPhone}) {
    clientRegister!.prefixPhone = prefixPhone;
    notifyListeners();
  }

  /// Change [clientRegister.telephone]
  changeClientRegisterPhone({required String phone}) {
    clientRegister!.phone = phone;
    notifyListeners();
  }

  phoneValidateSpace({required String phone}) {
    clientRegister!.phone = phone.replaceAll(' ', '');
    notifyListeners();
  }

  /// Change [clientRegister.descriptionDevice]
  changeClientDescriptionDevice({required String descriptionDevice}) {
    clientRegister!.descriptionDevice = descriptionDevice;
    notifyListeners();
  }

  setIdDevice({required String idDevice}){
    this.idDevice = idDevice;
    notifyListeners();
  }

  setIdUser({required String idUser}){
    this.idUser = idUser;
    notifyListeners();
  }

  setToken({required String token}){
    this.token = token;
    notifyListeners();
  }

}