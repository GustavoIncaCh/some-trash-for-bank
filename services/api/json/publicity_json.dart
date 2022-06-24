import 'dart:convert';

PublicityJson publicityJsonFromJson(String str) => PublicityJson.fromJson(json.decode(str));

String publicityJsonToJson(PublicityJson data) => json.encode(data.toJson());

class PublicityJson {
  PublicityJson({
    required this.status,
    required this.data,
  });

  int status;
  List<Datum> data;

  factory PublicityJson.fromJson(Map<String, dynamic> json) => PublicityJson(
    status : json["status"],
    data   : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status" : status,
    "data"   : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.url,
    required this.active,
  });

  String url;
  bool   active;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    url    : json["url"],
    active : json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url"    : url,
    "active" : active,
  };
}
