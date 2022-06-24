import 'dart:convert';

List<TypesJson> typesJsonFromJson(String str) => List<TypesJson>.from(json.decode(str).map((x) => TypesJson.fromJson(x)));

String typesJsonToJson(List<TypesJson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class TypesJson {
  int? status;
  Data? data;

  TypesJson({this.status, this.data});

  TypesJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<StateUser>? stateUser;
  List<StateUser>? typeUser;
  List<StateUser>? typeDocument;
  List<StateUser>? typeCoin;
  List<StateUser>? security;
  List<StateUser>? statusTransaction;
  List<StateUser>? transactionType;
  List<StateUser>? typeVideoCall;
  List<StateUser>? motivesVideoCall;

  Data(
      {this.stateUser,
      this.typeUser,
      this.typeDocument,
      this.typeCoin,
      this.security,
      this.statusTransaction,
      this.transactionType,
      this.typeVideoCall,
      this.motivesVideoCall});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['stateUser'] != null) {
      stateUser = <StateUser>[];
      json['stateUser'].forEach((v) {
        stateUser!.add(StateUser.fromJson(v));
      });
    }
    if (json['typeUser'] != null) {
      typeUser = <StateUser>[];
      json['typeUser'].forEach((v) {
        typeUser!.add(StateUser.fromJson(v));
      });
    }
    if (json['typeDocument'] != null) {
      typeDocument = <StateUser>[];
      json['typeDocument'].forEach((v) {
        typeDocument!.add(StateUser.fromJson(v));
      });
    }
    if (json['typeCoin'] != null) {
      typeCoin = <StateUser>[];
      json['typeCoin'].forEach((v) {
        typeCoin!.add(StateUser.fromJson(v));
      });
    }
    security = json['security'];
    if (json['statusTransaction'] != null) {
      statusTransaction = <StateUser>[];
      json['statusTransaction'].forEach((v) {
        statusTransaction!.add(StateUser.fromJson(v));
      });
    }
    if (json['transactionType'] != null) {
      transactionType = <StateUser>[];
      json['transactionType'].forEach((v) {
        transactionType!.add(StateUser.fromJson(v));
      });
    }
    if (json['typeVideoCall'] != null) {
      typeVideoCall = <StateUser>[];
      json['typeVideoCall'].forEach((v) {
        typeVideoCall!.add(StateUser.fromJson(v));
      });
    }
    if (json['motivesVideoCall'] != null) {
      motivesVideoCall = <StateUser>[];
      json['motivesVideoCall'].forEach((v) {
        motivesVideoCall!.add(StateUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stateUser != null) {
      data['stateUser'] = stateUser!.map((v) => v.toJson()).toList();
    }
    if (typeUser != null) {
      data['typeUser'] = typeUser!.map((v) => v.toJson()).toList();
    }
    if (typeDocument != null) {
      data['typeDocument'] = typeDocument!.map((v) => v.toJson()).toList();
    }
    if (typeCoin != null) {
      data['typeCoin'] = typeCoin!.map((v) => v.toJson()).toList();
    }
    data['security'] = security;
    if (statusTransaction != null) {
      data['statusTransaction'] =
          statusTransaction!.map((v) => v.toJson()).toList();
    }
    if (transactionType != null) {
      data['transactionType'] =
          transactionType!.map((v) => v.toJson()).toList();
    }
    if (typeVideoCall != null) {
      data['typeVideoCall'] =
          typeVideoCall!.map((v) => v.toJson()).toList();
    }
    if (motivesVideoCall != null) {
      data['motivesVideoCall'] =
          motivesVideoCall!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StateUser {
  int? id;
  String? description;

  StateUser({this.id, this.description});

  StateUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    return data;
  }
}