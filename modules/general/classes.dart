//  list of application classes for provider
//-----------------------------------------------------
//* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
//  - email: 9780desarrollador09@gmail.com
//  - Date : 02/12/2021

import 'package:flutter/material.dart';

class PaymentItem{
  int      pk;
  IconData icon;
  String   symbol;
  String   name;

  PaymentItem({
    required this.pk,
    required this.icon,
    required this.symbol,
    required this.name,
  });
}

class User{
  int pk;
  String name;
  String surname;
  String pin;
  String document;
  String cellphoneNumber;
  String address;
  String paymentPlan;
  bool hasPhoto;
  AssetImage photo;
  Image photopath;
  User({
    required this.pk,
    required this.name,
    required this.surname,
    required this.pin,
    required this.document,
    required this.cellphoneNumber,
    required this.address,
    required this.paymentPlan,
    required this.hasPhoto,
    required this.photo,
    required this.photopath,
  });
}


class Contact{
  int    pk;
  String photo;
  String name;
  String document;

  Contact({
    required this.pk,
    required this.photo,
    required this.name,
    required this.document,
  });
}

class Account{
  int    pk;
  String bank;
  String name;
  String number;
  String interbank;
  Account({
    required this.pk,
    required this.bank,
    required this.name,
    required this.number,
    required this.interbank,
  });
}

class Company{
  int    pk;
  String document;
  String name;
  bool   check;
  Company({
    required this.pk,
    required this.document,
    required this.name,
    required this.check,
  });
}

class Wallet{
  int    pk;
  String name;
  String tokenLogo;
  String tokenName;
  String tokenAddress;
  bool   aciveEnable;

  Wallet({
    required this.pk,
    required this.name,
    required this.tokenLogo,
    required this.tokenName,
    required this.tokenAddress,
    this.aciveEnable = false,
  });
}

class Token{
  String name;
  String symbol;
  String logo;
  String address;
  num    amount;
  num    usd;
  num    gain;
  bool   token;
  Token({
    required this.name,
    required this.symbol,
    required this.logo,
    required this.address,
    required this.amount,
    required this.usd,
    required this.gain,
    required this.token,
  });
}