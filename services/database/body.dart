import 'package:bank9780/properties/Variables.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBase{

  static Future<Database> path() async => await openDatabase(
    join(await getDatabasesPath(), Variables.localStore.databaseName),
    version: Variables.localStore.databaseVersion
  );

  static Future<bool> create() async{
    String path = join(await getDatabasesPath(), Variables.localStore.databaseName);
    if (await databaseExists(path) == true){ await deleteDatabase(path); }
    Database database = await openDatabase(path, version: Variables.localStore.databaseVersion);

    await database.execute(
      "CREATE TABLE registerTable ("
        "names           TEXT,"
        "surnames        TEXT,"
        "idTypeDocument    INTEGER,"
        "numDocument        TEXT,"
        "dateBirth       TEXT,"
        "address       TEXT,"
        "email           TEXT,"
        "codRefer        TEXT,"
        "fatherRefer     TEXT,"
        "isoCountry      TEXT,"
        "pin             TEXT,"
        "idDepartament   TEXT,"
        "idProvince      TEXT,"
        "prefixPhone      TEXT,"
        "phone           TEXT,"
        "isoLanguage      TEXT,"
        "imageFront      TEXT,"
        "imageBack       TEXT,"
        "imageSelfie     TEXT,"
        "descriptionDevice    TEXT,"
        "idDevice             TEXT,"
        "idUser               TEXT,"
        "token               TEXT"
      ")"
    );
    // await database.execute(
    //   " CREATE TABLE idsTable ("
    //     "idDevice             TEXT,"
    //     "idUser               TEXT,"
    //     "token               TEXT"
    //   ")"
    // );
    return true;
  }
}