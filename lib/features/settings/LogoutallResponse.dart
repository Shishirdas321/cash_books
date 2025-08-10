import 'dart:convert';
/// success : true
/// message : "Logged out from all devices successfully"

LogoutallResponse logoutallResponseFromJson(String str) => LogoutallResponse.fromJson(json.decode(str));
String logoutallResponseToJson(LogoutallResponse data) => json.encode(data.toJson());
class LogoutallResponse {
  LogoutallResponse({
      this.success, 
      this.message,});

  LogoutallResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
  }
  bool? success;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    return map;
  }

}