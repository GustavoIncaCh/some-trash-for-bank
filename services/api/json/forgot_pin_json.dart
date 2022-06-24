import 'dart:convert';

ClientForgottenPinJson clientForgottenPinJsonFromJson(String str) =>
ClientForgottenPinJson.fromJson(json.decode(str));

String clientForgottenPinJsonToJson(ClientForgottenPinJson data) =>
json.encode(data.toJson());

class ClientForgottenPinJson {
  int? status;
  String? message;
  String? idRequest;
  int? idState;

  ClientForgottenPinJson({this.status, this.message, this.idRequest, this.idState});

  ClientForgottenPinJson.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    idRequest = json['idRequest'];
    idState = json['idState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['idRequest'] = idRequest;
    data['idState'] = idState;
    return data;
  }
}