import 'dart:convert';

ClientLoginJson clientLoginJsonFromJson(String str) =>
ClientLoginJson.fromJson(json.decode(str));

String clientLoginJsonToJson(ClientLoginJson data) =>
json.encode(data.toJson());

class ClientLoginJson {
  String? message;
  String? token;
  int? status;

  ClientLoginJson({this.message, this.token, this.status});

  ClientLoginJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    data['status'] = status;
    return data;
  }
}