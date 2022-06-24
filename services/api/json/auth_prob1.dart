import 'dart:convert';

GetVideoLink getVideoLinkFromJson(String str) => GetVideoLink.fromJson(json.decode(str));

String getVideoLinkToJson(GetVideoLink data) => json.encode(data.toJson());

class GetVideoLink {
  int? status;
  String? message;
  String? urlVideoCall;

  GetVideoLink({this.status, this.message, this.urlVideoCall});

  GetVideoLink.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    urlVideoCall = json['urlVideoCall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['urlVideoCall'] = urlVideoCall;
    return data;
  }
}