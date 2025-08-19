import 'dart:convert';
/// success : true
/// message : "Book deleted successfully"

DeleteBookResponse deleteBookResponseFromJson(String str) => DeleteBookResponse.fromJson(json.decode(str));
String deleteBookResponseToJson(DeleteBookResponse data) => json.encode(data.toJson());
class DeleteBookResponse {
  DeleteBookResponse({
      this.success, 
      this.message,});

  DeleteBookResponse.fromJson(dynamic json) {
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