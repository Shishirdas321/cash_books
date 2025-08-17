import 'dart:convert';
/// success : true
/// message : "Business deleted successfully"

DeleteBusinessResponse deleteBusinessResponseFromJson(String str) => DeleteBusinessResponse.fromJson(json.decode(str));
String deleteBusinessResponseToJson(DeleteBusinessResponse data) => json.encode(data.toJson());
class DeleteBusinessResponse {
  DeleteBusinessResponse({
      this.success, 
      this.message,});

  DeleteBusinessResponse.fromJson(dynamic json) {
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