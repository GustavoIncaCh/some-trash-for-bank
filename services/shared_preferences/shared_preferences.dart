
import 'package:bank9780/properties/Variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 👇 -------------------------------------------------------- LOGGED 👇
class SharedPrefs{
  static Future<bool> getLogged() async =>
  SharedPreferences.getInstance().then(
    (value) => value.getBool(Variables.localStore.logged)
    ?? false
  );

  static Future<bool> setLogged({ required bool state }) async =>
  SharedPreferences.getInstance().then(
    (value) => value.setBool(Variables.localStore.logged, state)
  );

  // 👇 ------------------------------------------------------ DATABASE 👇

  static Future<bool> getDBstatus() async =>
  SharedPreferences.getInstance().then(
    (value) => value.getBool(Variables.localStore.dataBase)
    ?? false
  );

  static Future<bool> setDBstatus({ required bool status }) async =>
  SharedPreferences.getInstance().then(
    (value) => value.setBool(Variables.localStore.dataBase, status)
  );

  // 👇 -------------------------------------------- VERSSION TIME DATE 👇

  static Future<String> getVerssionDate() async =>
  SharedPreferences.getInstance().then(
    (value) => value.getString(Variables.localStore.verssionDate)
    ?? Variables.localStore.defaultTime
  );

  static Future<bool> setVerssionDate({ required String date }) async =>
  SharedPreferences.getInstance().then(
    (value) => value.setString(Variables.localStore.verssionDate, date)
  );

  // 👇 --------------------------------------------- INSTALL TIME DATE 👇

  static Future<String> getInstallDate() async =>
  SharedPreferences.getInstance().then(
    (value) => value.getString(Variables.localStore.installDate)
    ?? Variables.localStore.defaultTime
  );

  static Future<bool> setInstallDate({ required String date }) async =>
  await SharedPreferences.getInstance().then(
    (value) => value.setString(Variables.localStore.installDate, date)
  );

  // 👇 ---------------------------------------------- UPDATE TIME DATE 👇

  static Future<String> getUpdateDate() async =>
  SharedPreferences.getInstance().then(
    (value) => value.getString(Variables.localStore.updateDate)
    ?? Variables.localStore.defaultTime
  );

  static Future<bool> setUpdateDate({ required String date }) async =>
  SharedPreferences.getInstance().then(
    (value) => value.setString(Variables.localStore.updateDate, date)
  );

  // 👇 ----------------------------------------------- TERMS ACCEPTANCE👇

  static Future<bool> getTermsAcceptance() async =>
  SharedPreferences.getInstance().then(
    (value) => value.getBool(Variables.localStore.terms)
    ?? false
  );

  static Future<bool> setTermsAcceptance({ required bool acceptance }) async =>
  SharedPreferences.getInstance().then(
    (value) => value.setBool(Variables.localStore.terms, acceptance)
  );
}