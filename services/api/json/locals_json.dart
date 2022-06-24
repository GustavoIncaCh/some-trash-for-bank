import 'dart:convert';

List<LocalsJson> localsJsonFromJson(String str) => List<LocalsJson>.from(json.decode(str).map((x) => LocalsJson.fromJson(x)));

String localsJsonToJson(List<LocalsJson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocalsJson {
  LocalsJson({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory LocalsJson.fromJson(Map<String, dynamic> json) => LocalsJson(
    id  : json["id"]   ?? '',
    name: json["name"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id"  : id,
    "name": name,
  };
}
