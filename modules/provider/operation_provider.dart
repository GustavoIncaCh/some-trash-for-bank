import 'package:flutter/material.dart';

import '../../services/api/json/forgot_pin_json.dart';
import '../../services/api/json/login_json.dart';

/// App Operations
class OperationProvider extends ChangeNotifier{
  ClientForgottenPinJson? forgottenPin;
  String forgottenPinPhone='';
  String forgottenPinDocument='';
  ClientLoginJson? login;
  Map<String, dynamic> loginData={};
  // loginWithoutUser
  bool isObscure = true;


  getForgottenPin({required ClientForgottenPinJson forgottenPin}){
    //debugPrint("Ingresa al get forgotten pin del provider");
    this.forgottenPin = forgottenPin;
    notifyListeners();
  }

  getForgottenPinPhone({required String forgottenPinPhone}){
    //debugPrint("Ingresa al get forgotten pin del provider");
    this.forgottenPinPhone = forgottenPinPhone;
    notifyListeners();
  }

  getForgottenPinDocument({required String forgottenPinDocument}){
    //debugPrint("Ingresa al get forgotten pin del provider");
    this.forgottenPinDocument = forgottenPinDocument;
    notifyListeners();
  }

  getLogin({required ClientLoginJson login}){
    //debugPrint("Ingresa al get forgotten pin del provider");
    this.login = login;
    notifyListeners();
  }

  getLoginData({required Map<String, dynamic> loginData})async{
    //debugPrint("Ingresa al get forgotten pin del provider");
    this.loginData = loginData;
    notifyListeners();
  }

  getIsObscure({required bool isObscure}){
    //debugPrint("Ingresa al get forgotten pin del provider");
    this.isObscure = isObscure;
    notifyListeners();
  }

}