import 'package:bank9780/modules/general/button_class.dart';
import 'package:flutter/material.dart';

///  Menu provider list
///-----------------------------------------------------

class MenuProvider extends ChangeNotifier {
  // PORFOLIO VAR
  double penSum = 0.0;
  double usdSum = 0.0;
  double btcSum = 0.0;
  double sum = 0.0;
  int type = 1;
  String active = 'USD';
  // VAR for boundPages and transactions
  List<double> bounds=[300,1000,0,2000];
  List<double> boundValues=[0,0,0,0];
  // fingerPrint var

  // PORTFOLIO COINS
  List<CoinItem> allCoins = <CoinItem>[
    CoinItem(
      coinName: "Sol",
      coin: "Dolar",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/dollar-symbol.png',
      ),
      fiat: true,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "Bitcoin",
      coin: "BTC",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/btc.png',
      ),
      fiat: true,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "Etherreum",
      coin: "ETH",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/eth.png',
      ),
      fiat: false,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "Dash",
      coin: "DASH",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/dash.png',
      ),
      fiat: false,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "Litecoin",
      coin: "LTC",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/ltc.png',
      ),
      fiat: false,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "Filecoin",
      coin: "FIL",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/fil.png',
      ),
      fiat: false,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "Firo",
      coin: "FIRO",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/firo.png',
      ),
      fiat: false,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "Groestlcoin",
      coin: "GRS",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/grs.png',
      ),
      fiat: false,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "Harmony",
      coin: "ONE",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/one.png',
      ),
      fiat: false,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "Syscoin",
      coin: "SYS",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/sys.png',
      ),
      fiat: false,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "VeChain",
      coin: "VET",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/vet.png',
      ),
      fiat: false,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
    CoinItem(
      coinName: "Tezo",
      coin: "XTZ",
      usdCost: 10.0,
      btcCost: 0.001,
      penCost: 5.0,
      coinIcon: Image.asset(
        'lib/assets/img/tokens/xtz.png',
      ),
      fiat: false,
      wallet: "19NynWYzsnYt6T3mhSx7myxjTfkG6Yodic",
      active: false,
    ),
  ];

  // ACCOUNT LIST - BANK ACC
  List<AccountItem> allAccountProvider = [
    const AccountItem(
      name: "Confirm this is MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "21548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "21548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI THE COOLEST",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "NOT NOW MICHI",
      type: "DÓLARES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MISIFUS",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "THISISDEFINITELYNOTME",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
    const AccountItem(
      name: "MICHI",
      type: "SOLES",
      accountNumber: "012345698712545454",
      interbankAccount: "021548656256546546565465",
      bank: "INTERBANK",
    ),
  ];

  // HELP LIST
  List<HelpItem> allHelp = <HelpItem>[
    HelpItem(
      title:
          "¡Recuerde que tiene que realizar la llamada, para finalizar su registro!",
      description:
          "¡Recuerde que tiene que realizar la llamada, para finalizar su registro!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "Realizaste una operación en tu banca por internet.",
      description: "Realizaste una operación en tu banca por internet.",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
    HelpItem(
      title: "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      description:
          "¡Tiene una operación pendiente, por favor proceda a concluirla!",
      date: DateTime.now(),
    ),
  ];

  // PORTFOLIO FUNCTIONS
//addBankAccount({required AccountItem accountAdd}){
//    allAccountProvider.insert(0, accountAdd);
//    notifyListeners();
//  }

  setActiveStatus(CoinItem coin, bool value) {
    coin.active = value;
    notifyListeners();
  }

  totalPortfolio(int type) {
    //int a=1;
    switch(type){
      case 0:
      sum = penSum;
      active = 'PEN';
      break;
      case 1:
      sum = usdSum;
      active = 'USD';
      break;
      case 2:
      sum = btcSum;
      active = 'BTC';
      break;
      default:
      break;
    }
    // if (type) {
    //   sum = usdSum;
    //   active = 'USD';
    // }
    // else{
    //   sum = btcSum;
    //   active = 'BTC';
    // }
    this.type = type;
    notifyListeners();
  }

  activeCoinPortfolio(CoinItem coin, bool active) {
    if (active) {
        usdSum = usdSum + coin.usdCost;
        btcSum = btcSum + coin.btcCost;
        penSum = penSum + coin.penCost;
        //n.btcCost;
    }
    else{
        usdSum = usdSum - coin.usdCost;
        btcSum = btcSum - coin.btcCost;
        penSum = penSum - coin.penCost;
        //n.btcCost;
    }

    type==0 ? sum = penSum : type==1 ? sum = usdSum : sum =btcSum;
    notifyListeners();
  }

  changeBound(int index, double value){
    boundValues[index]= value;
    notifyListeners();
  }

  // ACCOUNT ITEMS - 
  addBankAccount({required AccountItem accountAdd}) {
    allAccountProvider.insert(0, accountAdd);
    notifyListeners();
  }

  // HELP ITEMS -- 
  addHelpItem({required HelpItem accountAdd}) {
    allHelp.insert(0, accountAdd);
    notifyListeners();
  }

  switchHelp({required HelpItem switchItem}) {
    switchItem.switchOff = true;
    notifyListeners();
  }
}
