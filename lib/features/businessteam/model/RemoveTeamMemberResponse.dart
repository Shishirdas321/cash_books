import 'dart:convert';
/// success : true
/// message : "Team member access removed successfully"

RemoveTeamMemberResponse removeTeamMemberResponseFromJson(String str) => RemoveTeamMemberResponse.fromJson(json.decode(str));
String removeTeamMemberResponseToJson(RemoveTeamMemberResponse data) => json.encode(data.toJson());
class RemoveTeamMemberResponse {
  RemoveTeamMemberResponse({
      this.success, 
      this.message,});

  RemoveTeamMemberResponse.fromJson(dynamic json) {
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