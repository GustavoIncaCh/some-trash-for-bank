import 'dart:convert';

AllCryptosJson allCryptosJsonFromJson(String str) =>
    AllCryptosJson.fromJson(json.decode(str));

String allCryptosJsonToJson(AllCryptosJson data) => json.encode(data.toJson());

// ignore: todo
// TODO: back must pass the values properly
// CommissionExchange - String and Double variables
// called in the same 'get' with diferent values in id: 1 and id: 2

class AllCryptosJson {
  int? status;
  List<Data>? data;

  AllCryptosJson({this.status, this.data});

  AllCryptosJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? logs;
  String? name;
  int? order;
  bool? active;
  String? symbol;
  String? formato;
  String? urlLogo;
  String? askPrice;
  String? bidPrice;
  String? priceBuy;
  String? nameImage;
  String? priceSell;
  CommissionExchange? commissionExchange;
  CommissionShipping? commissionShipping;
  CommissionPurchaseSale? commissionPurchaseSale;
  CommissionServicePayment? commissionServicePayment;

  Data(
      {this.id,
      this.logs,
      this.name,
      this.order,
      this.active,
      this.symbol,
      this.formato,
      this.urlLogo,
      this.askPrice,
      this.bidPrice,
      this.priceBuy,
      this.nameImage,
      this.priceSell,
      this.commissionExchange,
      this.commissionShipping,
      this.commissionPurchaseSale,
      this.commissionServicePayment});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logs = json['logs'];
    name = json['name'];
    order = json['order'];
    active = json['active'];
    symbol = json['symbol'];
    formato = json['formato'];
    urlLogo = json['url_logo'];
    askPrice = json['ask_price'];
    bidPrice = json['bid_price'];
    priceBuy = json['price_buy'];
    nameImage = json['name_image'];
    priceSell = json['price_sell'];
    commissionExchange = json['commission_exchange'] != null
        ? CommissionExchange.fromJson(json['commission_exchange'])
        : null;
    commissionShipping = json['commission_shipping'] != null
        ? CommissionShipping.fromJson(json['commission_shipping'])
        : null;
    commissionPurchaseSale = json['commission_purchase_sale'] != null
        ? CommissionPurchaseSale.fromJson(json['commission_purchase_sale'])
        : null;
    commissionServicePayment = json['commission_service_payment'] != null
        ? CommissionServicePayment.fromJson(json['commission_service_payment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logs'] = logs;
    data['name'] = name;
    data['order'] = order;
    data['active'] = active;
    data['symbol'] = symbol;
    data['formato'] = formato;
    data['url_logo'] = urlLogo;
    data['ask_price'] = askPrice;
    data['bid_price'] = bidPrice;
    data['price_buy'] = priceBuy;
    data['name_image'] = nameImage;
    data['price_sell'] = priceSell;
    if (commissionExchange != null) {
      data['commission_exchange'] = commissionExchange!.toJson();
    }
    if (commissionShipping != null) {
      data['commission_shipping'] = commissionShipping!.toJson();
    }
    if (commissionPurchaseSale != null) {
      data['commission_purchase_sale'] = commissionPurchaseSale!.toJson();
    }
    if (commissionServicePayment != null) {
      data['commission_service_payment'] = commissionServicePayment!.toJson();
    }
    return data;
  }
}

class CommissionExchange {
  List<Limits>? limits;
  String? safetyMargin;
  String? maxMiningCost;
  String? minMiningCost;
  String? averageMiningCost;

  CommissionExchange(
      {this.limits,
      this.safetyMargin,
      this.maxMiningCost,
      this.minMiningCost,
      this.averageMiningCost});

  CommissionExchange.fromJson(Map<String, dynamic> json) {
    if (json['limits'] != null) {
      limits = <Limits>[];
      json['limits'].forEach((v) {
        limits!.add(Limits.fromJson(v));
      });
    }
    safetyMargin = json['safetyMargin'];
    maxMiningCost = json['maxMiningCost'];
    minMiningCost = json['minMiningCost'];
    averageMiningCost = json['averageMiningCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (limits != null) {
      data['limits'] = limits!.map((v) => v.toJson()).toList();
    }
    data['safetyMargin'] = safetyMargin;
    data['maxMiningCost'] = maxMiningCost;
    data['minMiningCost'] = minMiningCost;
    data['averageMiningCost'] = averageMiningCost;
    return data;
  }
}

class Limits {
  int? limit;
  String? title;
  int? commissionFixed;
  int? commissionVariable;

  Limits(
      {this.limit, this.title, this.commissionFixed, this.commissionVariable});

  Limits.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    title = json['title'];
    commissionFixed = json['commissionFixed'];
    commissionVariable = json['commissionVariable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['title'] = title;
    data['commissionFixed'] = commissionFixed;
    data['commissionVariable'] = commissionVariable;
    return data;
  }
}

class CommissionShipping {
  External? external;
  External? internal;

  CommissionShipping({this.external, this.internal});

  CommissionShipping.fromJson(Map<String, dynamic> json) {
    external =
        json['external'] != null ? External.fromJson(json['external']) : null;
    internal =
        json['internal'] != null ? External.fromJson(json['internal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (external != null) {
      data['external'] = external!.toJson();
    }
    if (internal != null) {
      data['internal'] = internal!.toJson();
    }
    return data;
  }
}

class External {
  String? commission;
  String? safetyMargin;
  String? averageMiningCost;

  External({this.commission, this.safetyMargin, this.averageMiningCost});

  External.fromJson(Map<String, dynamic> json) {
    commission = json['commission'];
    safetyMargin = json['safetyMargin'];
    averageMiningCost = json['averageMiningCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['commission'] = commission;
    data['safetyMargin'] = safetyMargin;
    data['averageMiningCost'] = averageMiningCost;
    return data;
  }
}

class CommissionPurchaseSale {
  Buy? buy;
  Sell? sell;

  CommissionPurchaseSale({this.buy, this.sell});

  CommissionPurchaseSale.fromJson(Map<String, dynamic> json) {
    buy = json['buy'] != null ? Buy.fromJson(json['buy']) : null;
    sell = json['sell'] != null ? Sell.fromJson(json['sell']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (buy != null) {
      data['buy'] = buy!.toJson();
    }
    if (sell != null) {
      data['sell'] = sell!.toJson();
    }
    return data;
  }
}

class Buy {
  List<Limits>? limits;
  String? commission;
  int? safetyMargin;
  int? maxMiningCost;
  String? minMiningCost;
  String? averageMiningCost;

  Buy(
      {this.limits,
      this.commission,
      this.safetyMargin,
      this.maxMiningCost,
      this.minMiningCost,
      this.averageMiningCost});

  Buy.fromJson(Map<String, dynamic> json) {
    if (json['limits'] != null) {
      limits = <Limits>[];
      json['limits'].forEach((v) {
        limits!.add(Limits.fromJson(v));
      });
    }
    commission = json['commission'];
    safetyMargin = json['safetyMargin'];
    maxMiningCost = json['maxMiningCost'];
    minMiningCost = json['minMiningCost'];
    averageMiningCost = json['averageMiningCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (limits != null) {
      data['limits'] = limits!.map((v) => v.toJson()).toList();
    }
    data['commission'] = commission;
    data['safetyMargin'] = safetyMargin;
    data['maxMiningCost'] = maxMiningCost;
    data['minMiningCost'] = minMiningCost;
    data['averageMiningCost'] = averageMiningCost;
    return data;
  }
}

class Sell {
  String? commissionFixed;
  //double? commissionVariable;
  int? commissionVariable;

  Sell({this.commissionFixed, this.commissionVariable});

  Sell.fromJson(Map<String, dynamic> json) {
    commissionFixed = json['commissionFixed'];
    commissionVariable = json['commissionVariable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['commissionFixed'] = commissionFixed;
    data['commissionVariable'] = commissionVariable;
    return data;
  }
}

class CommissionServicePayment {
  String? commission;
  String? safetyMargin;
  String? maxMiningCost;
  String? minMiningCost;
  String? averageMiningCost;

  CommissionServicePayment(
      {this.commission,
      this.safetyMargin,
      this.maxMiningCost,
      this.minMiningCost,
      this.averageMiningCost});

  CommissionServicePayment.fromJson(Map<String, dynamic> json) {
    commission = json['commission'];
    safetyMargin = json['safetyMargin'];
    maxMiningCost = json['maxMiningCost'];
    minMiningCost = json['minMiningCost'];
    averageMiningCost = json['averageMiningCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['commission'] = commission;
    data['safetyMargin'] = safetyMargin;
    data['maxMiningCost'] = maxMiningCost;
    data['minMiningCost'] = minMiningCost;
    data['averageMiningCost'] = averageMiningCost;
    return data;
  }
}
