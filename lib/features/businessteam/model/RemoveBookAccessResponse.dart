import 'dart:convert';
/// success : true
/// message : "Book access revoked successfully"

RemoveBookAccessResponse removeBookAccessResponseFromJson(String str) => RemoveBookAccessResponse.fromJson(json.decode(str));
String removeBookAccessResponseToJson(RemoveBookAccessResponse data) => json.encode(data.toJson());
class RemoveBookAccessResponse {
  RemoveBookAccessResponse({
      this.success, 
      this.message,});

  RemoveBookAccessResponse.fromJson(dynamic json) {
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