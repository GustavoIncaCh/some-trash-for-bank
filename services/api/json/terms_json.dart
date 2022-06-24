import 'dart:convert';

TermJson termJsonFromJson(String str) => TermJson.fromJson(json.decode(str));

String termJsonToJson(TermJson data) => json.encode(data.toJson());

//class TermJson {
//  TermJson({
//    required this.id,
//    required this.value,
//    required this.active,
//    required this.nameJson,
//    required this.eliminated,
//    required this.description,
//  });
//
//  int     id;
//  Value   value;
//  bool    active;
//  String  nameJson;
//  bool    eliminated;
//  var  description;
//
//  factory TermJson.fromJson(Map<String, dynamic> json) => TermJson(
//    id          : json[ "id"          ] ?? -1,
//    value       : Value.fromJson(json["value"]),
//    //value       : json[ "value" ] ?? Value(title: "title", description: "description"),
//    active      : json[ "active"      ] ?? false,
//    nameJson    : json[ "name_json"   ] ?? '',
//    eliminated  : json[ "eliminated"  ] ?? false,
//    description : json[ "description" ] ?? '',
//  );
//
//  Map<String, dynamic> toJson() => {
//    "id"          : id,
//    "value"       : value.toJson(),
//    "active"      : active,
//    "name_json"   : nameJson,
//    "eliminated"  : eliminated,
//    "description" : description,
//  };
//}
//
//class Value {
//  Value({
//    required this.title,
//    required this.description,
//  });
//
//  String title;
//  String description;
//
//  factory Value.fromJson(Map<String, dynamic> json) => Value(
//    title       : json["title"],
//    description : json["description"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "title"       : title,
//    "description" : description,
//  };
//}

class TermJson {
  int? status;
  List<Data>? data;

  TermJson({this.status, this.data});

  TermJson.fromJson(Map<String, dynamic> json) {
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
  Value? value;
  bool? active;
  String? nameJson;
  bool? eliminated;
  String? description;

  Data(
      {this.id,
      this.value,
      this.active,
      this.nameJson,
      this.eliminated,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'] != null ? Value.fromJson(json['value']) : null;
    active = json['active'];
    nameJson = json['name_json'];
    eliminated = json['eliminated'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (value != null) {
      data['value'] = value!.toJson();
    }
    data['active'] = active;
    data['name_json'] = nameJson;
    data['eliminated'] = eliminated;
    data['description'] = description;
    return data;
  }
}

class Value {
  String? title;
  String? description;

  Value({this.title, this.description});

  Value.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
