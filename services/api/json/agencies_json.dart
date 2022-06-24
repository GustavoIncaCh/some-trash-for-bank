import 'dart:convert';

/// Data from API ~ getAgencies
/// Made by Gus, hope its been done well :c
/// -----------------------------------------------------

AgenciesJson agenciesJsonFromJson(String str) =>
    AgenciesJson.fromJson(json.decode(str));

String agenciesJsonToJson(AgenciesJson data) => json.encode(data.toJson());

class AgenciesJson {
  AgenciesJson({
    required this.status,
    required this.data,
  });

  int status;
  List<AgenciesData> data;

  factory AgenciesJson.fromJson(Map<String, dynamic> json) => AgenciesJson(
        status: json["status"],
        data: List<AgenciesData>.from(
            json["data"].map((x) => AgenciesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AgenciesData {
  AgenciesData({
    required this.description,
    required this.direction,
    required this.telephone,
    required this.lat,
    required this.long,
    required this.active,
  });

  String description;
  String direction;
  String telephone;
  String lat;
  String long;
  bool active;

  factory AgenciesData.fromJson(Map<String, dynamic> json) => AgenciesData(
        description: json["description"],
        direction: json["direction"],
        telephone: json["telephone"],
        lat: json["lat"],
        long: json["long"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "direction": direction,
        "telephone": telephone,
        "lat": lat,
        "long": long,
        "active": active,
      };
}
