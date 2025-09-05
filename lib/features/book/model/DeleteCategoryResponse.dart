import 'dart:convert';
/// success : true
/// message : "Category deleted successfully"

DeleteCategoryResponse deleteCategoryResponseFromJson(String str) => DeleteCategoryResponse.fromJson(json.decode(str));
String deleteCategoryResponseToJson(DeleteCategoryResponse data) => json.encode(data.toJson());
class DeleteCategoryResponse {
  DeleteCategoryResponse({
      this.success, 
      this.message,});

  DeleteCategoryResponse.fromJson(dynamic json) {
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