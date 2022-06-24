import 'package:bank9780/modules/general/classes.dart';
import 'package:bank9780/modules/general/enum.dart';
import 'package:bank9780/services/api/json/document_type.jon.dart';
import 'package:bank9780/services/api/json/locals_json.dart';
import 'package:bank9780/services/api/json/publicity_json.dart';
import 'package:bank9780/services/api/json/agencies_json.dart';
import 'package:bank9780/services/api/json/terms_json.dart';
import 'package:bank9780/services/api/json/types_json.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../services/api/json/cryptos_json.dart';


///  General Information building main class
///-----------------------------------------------------
///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
///  - email: 9780desarrollador09@gmail.com
///  - Date : 02/12/2021
class DataProvider extends ChangeNotifier{
  Countries country   = Countries.pe;
  Languages language  = Languages.es;
  List<LocalsJson>      departments     = [];
  List<String>          departmentNames = [];
  List<LocalsJson>      provinces       = [];
  List<String>          provinceNames   = [];
  List<DocumentTypeJson> documentTypes  = [];
  List<String>          documentTypesNames = [];
  LocalsJson?           department;
  LocalsJson?           province;
  PublicityJson?        publicity;
  /// New changes: new variables added
  AgenciesJson?         agencies;
  TermJson?             terms;
  bool registerText = true;
  AllCryptosJson?       allCryptos;
  TypesJson?       allTypes;

  /// Change [country] and [language] information
  changeLocales({
    required BuildContext context,
    required Countries country,
    required Languages language,
  }) {
    context.setLocale(Locale(language.name));
    this.language = language;
    this.country  = country;
    notifyListeners();
  }

  changeRegisterText({required bool state}){
    registerText=state;
    notifyListeners();
  }

  getPublicity({required PublicityJson publicity}){
    //debugPrint("Ingresa al get publicity del provider");
    this.publicity = publicity;
    notifyListeners();
  }

  getAgencies({required AgenciesJson agencies}){
    //debugPrint("Ingresa al get Agencies del provider");
    this.agencies = agencies;
    notifyListeners();
  }

  getTerms({required TermJson terms}){
    //debugPrint("Ingresa al get terms del provider");
    this.terms = terms;
    notifyListeners();
  }

  getAllCryptos({required AllCryptosJson allCryptos}){
    //debugPrint("Ingresa al get terms del provider");
    this.allCryptos = allCryptos;
    notifyListeners();
  }

  getDocumentTypes({required List<DocumentTypeJson> documentTypes}){
    this.documentTypes = documentTypes;

    documentTypesNames.clear();
    for(var item in documentTypes){
      documentTypesNames.add(item.descripcion);
    }
    notifyListeners();
  }

  getTypes({required TypesJson allTypes}){
    this.allTypes = allTypes;
    print("esta en class");
    print(allTypes.toJson());

    documentTypesNames.clear();
    for (var element in allTypes.data!.typeDocument!) {
      documentTypesNames.add(element.description!);
      }

    notifyListeners();
  }

  getDepartments({required List<LocalsJson> departments}) {
    this.departments = departments;

    departmentNames.clear();
    for(var item in this.departments){
      departmentNames.add(item.name);
    }

    if(departments.isNotEmpty) {
      department = departments.first;
    }
    notifyListeners();
  }

  changeDepartment({required int index}) {
    department = departments[index];
    notifyListeners();
  }

  getProvinces({required List<LocalsJson> provinces}) {
    this.provinces = provinces;

    provinceNames.clear();
    for(var item in provinces){
      provinceNames.add(item.name);
    }

    if(provinces.isNotEmpty) {
      province = provinces.first;
    }
    notifyListeners();
  }

  changeProvince({required int index}) {
    province = provinces[index];
    notifyListeners();
  }

  // -------------------------------------------------------------

  int type = 0;
  bool internal = true;
  int itemIndex = 0;


  ///- token internal [token] true  and [internal] true  -> 1
  ///- token external [token] true  and [internal] false -> 2
  ///- fiat internal  [token] false and [internal] true  -> 3
  ///- fiar external  [token] false and [internal] false -> 4
  changeType({bool? internal}){
    this.internal = internal?? this.internal;
    type = this.internal? token.token ? 1: 2: token.token ? 3: 4;
    notifyListeners();
  }
  changeTypePushed({bool? internal}){
    type = 5;
    notifyListeners();
  }

  PaymentItem paymentItem = PaymentItem(
    pk     : 0,
    icon   : Icons.close,
    symbol : '',
    name   : ''
  );

  List<PaymentItem> paymentItems = [
    PaymentItem(
      pk     : 0,
      icon   : Icons.paid_outlined,
      symbol : 'USD',
      name   : 'DOLLAR'
    ),
    PaymentItem(
      pk     : 1,
      icon   : Icons.local_atm,
      symbol : 'PEN',
      name   : 'SOL'
    ),
    PaymentItem(
      pk     : 2,
      icon   : Icons.payment_outlined,
      symbol : 'ATM',
      name   : 'TARGET'
    ),
  ];

  setPaymentItem(int index){
    itemIndex   = index;
    paymentItem = paymentItems[index];
    if(index != 2){
      token       = tokens[
        tokens.indexWhere((element) => element.symbol == paymentItem.symbol)
      ];
    }
    notifyListeners();
  }

  //---------------------------------------- TOKENS

  Token token = Token(
    name    : '',
    symbol  : '',
    address : '',
    logo    : 'lib/assets/img/tokens/btc.png',
    amount  : 0,
    usd     : 0,
    gain    : 0,
    token   : false
  );

  Token receiveToken = Token(
    name    : '',
    symbol  : '',
    address : '',
    logo    : 'lib/assets/img/tokens/btc.png',
    amount  : 0,
    usd     : 0,
    gain    : 0,
    token   : false
  );

  //----------------------------------------- ITEMS

  Wallet wallet  = Wallet(
    pk           : -1,
    name         : '',
    tokenLogo    : 'lib/assets/img/tokens/btc.png',
    tokenName    : '',
    tokenAddress : '',
  );

  Contact contact = Contact(
    pk       : -1,
    photo    : 'lib/assets/img/photo.png',
    name     : '',
    document : '',
  );

  Account account = Account(
    pk        : -1,
    bank      : '',
    name      : '',
    number    : '',
    interbank : '',
  );

  Company company = Company(
    pk       : -1,
    document : '',
    name     : '',
    check    : false,
  );

  //---------------------------------- SEARCH ITEMS

  Wallet searchWallet = Wallet(
    pk          : -1,
    name        : '',
    tokenLogo   : 'lib/assets/img/tokens/btc.png',
    tokenName   : '',
    tokenAddress: '',
  );

  Contact searchContact = Contact(
    pk       : -1,
    photo    : 'lib/assets/img/photo.png',
    name     : '',
    document : '',
  );

  Account searchAccount = Account(
    pk        : -1,
    bank      : '',
    name      : '',
    number    : '',
    interbank : '',
  );

  Company searchCompany = Company(
    pk       : -1,
    document : '',
    name     : '',
    check    : false,
  );

  //------------------------------------ FAKE LISTS

  List<Token> tokens = [
    //__________________________________________
    Token(
      name    : 'Bitcoin',
      symbol  : 'BTC',
      address : 'bc1qnwszqsvvhrp9pcstkeln9hwxsgv0flwrfg6y3z',
      logo    : 'lib/assets/img/tokens/btc.png',
      amount  : 10.12345678,
      usd     : 15047.20,
      gain    : 0.10,
      token   : true
    ),
    //__________________________________________
    Token(
      name    : 'Ethereum',
      symbol  : 'ETH',
      address : '0xCc9A434b028392153272B24f0Ec14461A0BCf2ED',
      logo    : 'lib/assets/img/tokens/eth.png',
      amount  : 20.12345678,
      usd     : 20.20,
      gain    : 0.20,
      token   : true
    ),
    //__________________________________________
    Token(
      name    : 'Litecoin',
      symbol  : 'LTC',
      address : 'ltc1qwzlf5g5w95xldtyz2c4u8pup8hrtc8vyzhzyaf',
      logo    : 'lib/assets/img/tokens/ltc.png',
      amount  : 30.12345678,
      usd     : 30.30,
      gain    : 0.30,
      token   : true
    ),
    //__________________________________________
    Token(
      name    : 'Dogecoin',
      symbol  : 'DOGE',
      address : '',
      logo    : 'lib/assets/img/tokens/doge.png',
      amount  : 40.12345678,
      usd     : 40.40,
      gain    : 0.40,
      token   : true
    ),
    //__________________________________________
    Token(
      name    : 'Dólares',
      symbol  : 'USD',
      address : '',
      logo    : 'lib/assets/img/tokens/usd.png',
      amount  : 1.00,
      usd     : 1.00,
      gain    : 0,
      token   : false
    ),
    //__________________________________________
    Token(
      name    : 'Soles',
      symbol  : 'PEN',
      address : '',
      logo    : 'lib/assets/img/tokens/nsol.png',
      amount  : 4.00,
      usd     : 1.00,
      gain    : 0,
      token   : false
    ),
  ];

  List<Wallet> wallets = [
    //__________________________________________
    Wallet(
      pk           : 0,
      name         : 'Jonas',
      tokenName    : 'Bitcoin',
      tokenLogo    : 'lib/assets/img/tokens/btc.png',
      tokenAddress : 'bc1qj4n2gy82jl8ccqslyk963n4jz0f6hsr7uegyem'
    ),
    //__________________________________________
    Wallet(
      pk           : 1,
      name         : 'Michi',
      tokenName    : 'Bitcoin',
      tokenLogo    : 'lib/assets/img/tokens/btc.png',
      tokenAddress : 'bc1qxav3kl0tc4g9jtvyg3fkwzyv5pfmgceqaqva5x'
    ),
    //__________________________________________
    Wallet(
      pk           : 2,
      name         : 'Javo',
      tokenName    : 'Bitcoin',
      tokenLogo    : 'lib/assets/img/tokens/btc.png',
      tokenAddress : '195YkgobRENzAzbPKyX6oToEkY8KUMBJ1x'
    ),
    //__________________________________________
    Wallet(
      pk           : 3,
      name         : 'lilith',
      tokenName    : 'Bitcoin',
      tokenLogo    : 'lib/assets/img/tokens/btc.png',
      tokenAddress : '1M2tSaA5BTwxajZTGFhjVGPGVui6usNF1r'
    ),
    //__________________________________________
    Wallet(
      pk           : 4,
      name         : 'Ayanami',
      tokenName    : 'Bitcoin',
      tokenLogo    : 'lib/assets/img/tokens/btc.png',
      tokenAddress : 'bc1q9n8eth8huddcdtahlt5y0d595syrt72ffnf62a'
    ),
  ];

  List<Contact> contacs = [
    //__________________________________________
    Contact(
      pk       : 0,
      photo    : 'lib/assets/img/photo.png',
      name     : 'Maria mercedes para servirle a usted',
      document : '12345678'
    ),
    //__________________________________________
    Contact(
      pk       : 1,
      photo    : 'lib/assets/img/photo.png',
      name     : 'Maria la del Barrio',
      document : '87654321'
    ),
    //__________________________________________
    Contact(
      pk       : 2,
      photo    : 'lib/assets/img/photo.png',
      name     : 'Soraya Montenegro',
      document : '87655678'
    ),
    //__________________________________________
    Contact(
      pk       : 3,
      photo    : 'lib/assets/img/photo.png',
      name     : 'Fernando de las casas',
      document : '12344321'
    ),
    //__________________________________________
  ];

  List<Account> accounts = [
    //__________________________________________
    Account(
      pk        : 0,
      bank      : 'BCP',
      name      : 'Jonas',
      number    : '215-2-7895-4598',
      interbank : '12345678912345678912',
    ),
    //__________________________________________
    Account(
      pk        : 1,
      bank      : 'Interbank',
      name      : 'Michi',
      number    : '4567892132-79-1',
      interbank : '22312335345436345435',
    ),
    //__________________________________________
    Account(
      pk        : 2,
      bank      : 'Scotiabank',
      name      : 'Javo',
      number    : '45678-458-56446',
      interbank : '34332314645437547546',
    ),
    //__________________________________________
    Account(
      pk        : 3,
      bank      : 'Banco de la Nación',
      name      : 'Lilith',
      number    : '87654156341551',
      interbank : '45333452342343463635',
    ),
  ];

  List<Company> companies = [
    Company(
      pk       : 0,
      document : '10208922584',
      name     : 'Hosting Labs SAC',
      check    : false,
    ),
    Company(
      pk       : 1,
      document : '10208922584',
      name     : 'Olo Del Peru SAC',
      check    : false,
    ),
    Company(
      pk       : 2,
      document : '10208922584',
      name     : 'Bitel',
      check    : false,
    ),
    Company(
      pk       : 3,
      document : '10208922584',
      name     : 'Payvalida SAC',
      check    : false,
    ),
    Company(
      pk       : 4,
      document : '10208922584',
      name     : 'RCP Internet',
      check    : false,
    ),
    Company(
      pk       : 5,
      document : '10208922584',
      name     : 'Vision Peru Multimedia',
      check    : false,
    ),
    Company(
      pk       : 6,
      document : '10208922584',
      name     : 'Sedapal',
      check    : false,
    ),
  ];

  //----------------------------------- SEARCH DATA

  setSearchWallet(Wallet wallet){
    searchWallet = wallet;
    notifyListeners();
  }

  setSearchContact(Contact contact){
    searchContact = contact;
    notifyListeners();
  }

  setSearchAccount(Account account){
    searchAccount = account;
    notifyListeners();
  }

  setSearchCompany(Company company){
    searchCompany = company;
    notifyListeners();
  }

  //--------------------------------- CHANGE TOKENS

  changeToken(int index, bool main){
    main
    ? token        = tokens[index]
    : receiveToken = tokens[index];
    changeType();
    notifyListeners();
  }

  changeReceiveToken(int index){
    receiveToken = tokens[index];
    changeType();
    notifyListeners();
  }

  //---------------------------------- CHANGE ITEMS

  changeWallet(Wallet wallet){
    this.wallet = wallet;
    notifyListeners();
  }

  changeContact(Contact contact){
    this.contact = contact;
    notifyListeners();
  }

  changeAccount(Account account){
    this.account = account;
    notifyListeners();
  }

  changeCompany(Company company){
    this.company = company;
    notifyListeners();
  }

  //---------------------------------- WALLET CHANGE ACTIVE

  changeActiveWallet(Wallet wallet){
    wallet.aciveEnable = !wallet.aciveEnable;
    notifyListeners();
  }
}