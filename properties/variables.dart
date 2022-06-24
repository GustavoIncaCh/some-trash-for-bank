class Variables{

  //static const String   apiUrl      = 'http://161.97.162.17:3000';
  //static const String   apiUrl      = 'http://192.168.3.24:3000';
  //static const String   apiUrl      = 'https://api.9780banco.com';
  static const String apiUrl = 'http://192.168.3.21:3000';
  // http://192.168.3.26:3000 Joao
  // http://192.168.3.53:3000 Raul
  // http://192.168.3.38:3000 Ronny
  // reduce the time for responce
  static const Duration apiCallBack = Duration(milliseconds: 5000);
  static ApiPaths apiPaths    = ApiPaths(
    clientValidateSecurityCode  : apiUrl + '/client/validateSecurityCode',
    anouncements       : apiUrl + '/client/getPublicity',
    clientLogin        : apiUrl + '/client/login',
    clientForgottenPin : apiUrl + '/client/forgotPin',
    //clientRegister     : apiUrl + '/client/registerUser',
    clientRegister     : apiUrl + '/client/registerUserStep1',
    departments        : apiUrl + '/client/getDepartments',
    provinces          : apiUrl + '/client/getProvinces',
    //documentType       : apiUrl + '/client/typeDocument',
    documentType       : apiUrl + '/client/getTypes',
    terms              : apiUrl + '/client/getTerms',
    clientAgencies     : apiUrl + '/client/getAgencies',
    allCryptos         : apiUrl + '/client/getAllCryptos',
    registerUserStep2  : apiUrl + '/client/registerUserStep2',
  );

  static final LocalStore localStore = LocalStore(
    logged       : 'tib8KvqmZUtJx8TdikX28XbcSkfEUjYo',
    terms        : 'YGZFt895vDu1vgyEH5Wg9IxisJdJTDHf',
    dataBase     : '0mV7WiCTabBL47Eyh3c1dfJqeV2vG6eT',
    verssionDate : 'M0oKqpwzROVFzwejUl7JApSSe9G6cRir',
    installDate  : 'L2MDDNqNleDv9SJbRIwKbC56axUVMDaw',
    updateDate   : 'deOVzhezI4imtZfAWJkVAsIby1wTZa7G',
    defaultTime  : '2020-09-03 00:00:00',
    //--------------------------------------
    databaseVersion : 1,
    databaseName    : "88wZe7TAFkV3xNtfifw826sUQFfvab6k.db"
  );
}

class LocalStore{
  String logged;
  String terms;
  String dataBase;
  String verssionDate;
  String installDate;
  String updateDate;
  String defaultTime;
  String databaseName;
  int    databaseVersion;
  LocalStore({
    required this.logged,
    required this.terms,
    required this.dataBase,
    required this.verssionDate,
    required this.installDate,
    required this.updateDate,
    required this.defaultTime,
    required this.databaseName,
    required this.databaseVersion,
  });
}

class ApiPaths{
  final String anouncements;
  final String clientLogin;
  final String clientForgottenPin;
  final String clientRegister;
  final String departments;
  final String provinces;
  final String documentType;
  final String terms;
  final String clientAgencies;
  final String allCryptos;
  final String clientValidateSecurityCode;
  final String registerUserStep2;
  ApiPaths({
    required this.anouncements,
    required this.clientLogin,
    required this.clientForgottenPin,
    required this.clientRegister,
    required this.departments,
    required this.provinces,
    required this.documentType,
    required this.terms,
    required this.clientAgencies,
    required this.allCryptos,
    required this.clientValidateSecurityCode,
    required this.registerUserStep2,
  });
}