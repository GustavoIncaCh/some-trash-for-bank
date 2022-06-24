import 'package:flutter/material.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/modules/general/enum.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: implementation_imports
import 'package:provider/src/provider.dart';

/// Class "Visitor" for the list in portfolio
/// ---------------------------------------------------
class VisitorItem {
  String coinName;
  bool active;
  VisitorItem({
    required this.coinName,
    this.active = false,
  });
}

/// Class "Coin" for the list in portfolio
/// ---------------------------------------------------
class CoinItem {
  final String coinName;
  final String coin;
  final double penCost;
  final double usdCost;
  final double btcCost;
  //final Icon coinIcon;
  final Image coinIcon;
  final bool fiat;
  final String wallet;
  bool active;
  //bool get fiatData{
  //  return fiat;
  //}
  //void set fiatData(bool fiat, bool newFiat) {
  //  fiat = newFiat;
  //}
  CoinItem({
    required this.coin,
    required this.coinName,
    required this.penCost,
    required this.usdCost,
    required this.btcCost,
    required this.coinIcon,
    this.fiat = true,
    required this.wallet,
    this.active = true,
  });
}

/// Class History for RecordPage listview item
/// ---------------------------------------------------
class HistoryItem {
  final String name;
  final String type;
  final DateTime date;
  final double coinAmount;
  final double usdAmount;
  final double penAmount;
  final String state;
  final String detailTitle;
  final String detail;
  final double commission;
  //final Icon coinIcon;
  final bool fiat;
  const HistoryItem({
    required this.name,
    required this.type,
    required this.date,
    required this.coinAmount,
    required this.usdAmount,
    required this.penAmount,
    required this.state,
    required this.fiat,
    required this.detailTitle,
    required this.detail,
    required this.commission,
  });
}

/// Class History for RecordPage listview item
/// ---------------------------------------------------
class AccountItem {
  final String name;
  final String type;
  //final DateTime date;
  final String accountNumber;
  final String interbankAccount;
  final String bank;
  const AccountItem({
    required this.name,
    required this.type,
    //required this.date,
    required this.accountNumber,
    required this.interbankAccount,
    required this.bank,
  });
}

/// Class Payment for FavoritePage listview item
/// Payment page items - first
/// ---------------------------------------------------
class PaymentItemOwn {
  final String name;
  final String code;
  //final DateTime date;
  const PaymentItemOwn({
    required this.name,
    required this.code,
  });
}

/// Class Bill for FavoritePage listview item
/// Bill page items - second
/// ---------------------------------------------------
class BillItem {
  final String name;
  final String coin;
  final Image coinIcon;
  final String bill;
  //final DateTime date;
  const BillItem({
    required this.name,
    required this.coin,
    required this.coinIcon,
    required this.bill,
  });
}

/// Class Contact for FavoritePage listview item
/// Contact page items - Third
/// ---------------------------------------------------
class ContactItem {
  final String name;
  final String dni;
  final Image userPhoto;
  //final DateTime date;
  const ContactItem({
    required this.name,
    required this.dni,
    required this.userPhoto,
  });
}

/// DropDownButton Menu Class
/// ---------------------------------------------------
class ItemMenu {
  final String text;
  final LatLng mapsItem;
  final VoidCallback? onClicked;
  const ItemMenu({
    required this.text,
    this.mapsItem = const LatLng(0, 0),
    this.onClicked,
  });
  LatLng get mapItem {
    return mapsItem;
  }
}

/// Notification page - Items for list
/// ---------------------------------------------------
class NotificationItem {
  final String text;
  final String url;
  final DateTime date;
  const NotificationItem({
    required this.text,
    required this.url,
    required this.date,
  });
}

/// Help page - Items for list
/// ---------------------------------------------------
class HelpItem {
  final String title;
  final String description;
  final DateTime date;
  bool switchOff;
  HelpItem({
    required this. title,
    required this.description,
    required this.date,
    this.switchOff=false,
  });
}

/// Help page - Items for list
/// ---------------------------------------------------
class ReferralRecordItem {
  final DateTime date;
  final String referral;
  final String type;
  final String coin;
  final String amount;
  final String comission;
  final String collectionPeriod;
  const ReferralRecordItem({
    required this.date,
    required this.referral,
    required this.type,
    required this.coin,
    required this.amount,
    required this.comission,
    required this.collectionPeriod,
  });
}

/// Add the list and name on the DropButton Item
/// create the object Menu item
/// use the switch case to add functionality to the button

class ItemMenus extends ChangeNotifier {
  String hintName = "¿Criptomonedas?";
  changeQuestionHint({required String changeName}){
    hintName = changeName;
    notifyListeners();
  }

  static List<ItemMenu> configurationPageButtons = [
    changePIN,
    auth,
    changeVideo,
    digitalKey
  ];

  static List<ItemMenu> configurationPageButtons2 = [spanish, portuguese];

  static List<ItemMenu> historialPageButtons = [
    sendNrecive,
    exchange,
    servicesPay,
    buyNsell
  ];

  static List<ItemMenu> agenciesPage = [
    agencie1,
    agencie2,
    agencie3,
    agencie4,
  ];

  static List<ItemMenu> questionsPage = [
    question1,
    question2,
    question3,
    question4,
  ];

  /// configuration items
  /// ----------------------------------------------------------
  static const changePIN = ItemMenu(text: 'Cambiar PIN');
  static const auth = ItemMenu(text: 'Autenticador');
  static const changeVideo = ItemMenu(text: 'Cambiar Video');
  static const digitalKey = ItemMenu(text: 'Huella Digital');
  static const spanish = ItemMenu(text: 'Español');
  static const portuguese = ItemMenu(text: 'Portugues');

  /// recordPage items
  /// -----------------------------------------------------------
  static const sendNrecive = ItemMenu(text: 'Envío y Recepciones');
  static const exchange = ItemMenu(text: 'Intercambio');
  static const servicesPay = ItemMenu(text: 'Pago de Servicios');
  static const buyNsell = ItemMenu(text: 'Compra y Venta');

  /// agencies items
  /// ------------------------------------------------------------
  static const agencie1 = ItemMenu(
    text: 'Av. Aramburú 118, of. 3, Miraflores',
    mapsItem: LatLng(-12.103509636404775, -77.03125940235793),
  );
  static const agencie2 = ItemMenu(
    text: 'Calle Rivero 115, Arequipa',
    mapsItem: LatLng(-16.39819781766054, -71.53373638697535),
  );
  static const agencie3 = ItemMenu(
    text: 'Jiron Gamarra 384, Trujillo',
    mapsItem: LatLng(-8.109303698454994, -79.02783253122071),
  );
  static const agencie4 = ItemMenu(
    text: 'Av. de la cultura Mza H, Lte 3, Cusco',
    mapsItem: LatLng(-13.527659791560131, -71.94204290234545),
  );

  /// contact - questionPage items
  /// -----------------------------------------------------------
  static const question1 = ItemMenu(text: "Compra y venta de criptomonedas");
  static const question2 = ItemMenu(text: "Pago de servicios");
  static const question3 =
      ItemMenu(text: "Envío y recepción de criptomonedas/FIAT");
  static const question4 = ItemMenu(text: "Otros");

  // int historyState = 0;
  onChanged(BuildContext context, ItemMenu item) {
    //Map itemsMenuRoutes ={
    //  ItemMenus.changePIN: Routes.portfolio(context),
    //};
    switch (item) {
      case ItemMenus.changePIN:
        //Routes.portfolio(context);
        Routes.pinChangePage(context: context, process: Process.check, pages: Pages.change);
        //Do something
        break;
      case ItemMenus.auth:
        Routes.qrauthenticator(context);
        //Do something
        break;
      case ItemMenus.changeVideo:
        Routes.changevideo(context);
        //Do something
        break;
      case ItemMenus.digitalKey:
        Routes.fingerprint(context);
        //Do something
        break;
      case ItemMenus.spanish:
        //Routes.bounds(context);
//        DataProvider().changeLocales(
        //          context: context, country: Countries.pe, language: Languages.es);
        //Navigator.pop(context);
        //Routes.configlang(context);
        //Do something
        context.read<DataProvider>().changeLocales(
            context: context, country: Countries.pe, language: Languages.es);
        break;
      case ItemMenus.portuguese:
        //Routes.portfolio(context);
        context.read<DataProvider>().changeLocales(
            context: context, country: Countries.br, language: Languages.pt);
        //Routes.configlang(context);
        //Do something
        break;
      case ItemMenus.sendNrecive:
        //Routes.bounds(context);
        /*
  late List<CoinItem> coinsItems= allCoins;
        void searchCoin(String query) {
    final coins = allCoins.where((coin) {
      final titleLower = coin.coin.toLowerCase();
      final authorLower = coin.coinName.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      coinsItems = coins;
    });
  }
  */
        //Do something
        break;
      case ItemMenus.exchange:
        //Routes.portfolio(context);
        //Do something
        break;
      case ItemMenus.servicesPay:
        //Routes.bounds(context);
        //Do something
        break;
      case ItemMenus.buyNsell:
        //Routes.portfolio(context);
        //Do something
        break;
      case ItemMenus.agencie1:
        ItemMenus.agencie1.onClicked;
        //return Agencies().ubicationList[0];
        //      Future<void> _goToTheLake() async {
        //  final GoogleMapController controller = await _controller.future;
        //  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        //    bearing: 192.8334901395799,
        //    target: LatLng(-12.103509636404775, -77.03125940235793),
        //    tilt: 59.440717697143555,
        //    zoom: 19.151926040649414),),);
        //}
        //Routes.portfolio(context);
        //Do something
        break;
      case ItemMenus.agencie2:
        //Routes.portfolio(context);
        //Do something
        break;
      case ItemMenus.agencie3:
        //Routes.portfolio(context);
        //Do something
        break;
      case ItemMenus.agencie4:
        //Routes.portfolio(context);
        //Do something
        break;
      case ItemMenus.question1:
      changeQuestionHint(changeName: "Compra y venta de criptomonedas");
        break;
      case ItemMenus.question2:
      changeQuestionHint(changeName: "Pago de servicios");
        break;
      case ItemMenus.question3:
      changeQuestionHint(changeName: "Envío y recepción de criptomonedas/FIAT");
        break;
      case ItemMenus.question4:
      changeQuestionHint(changeName: "Otros");
        break;
    }
  }
}
