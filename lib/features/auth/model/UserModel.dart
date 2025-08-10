import 'dart:convert';
/// id : 1
/// first_name : "Tushar"
/// last_name : "Das"
/// full_name : "Tushar Das"
/// email : "tushar2499@gmail.com"
/// phone : "+8801815920898"
/// last_login_at : null
/// token : "24|2xWdW69o97fL1jojZRZ9NU65hEqDaL3nkJGWqZeXc3e48bd4"
/// token_type : "Bearer"

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.fullName, 
      this.email, 
      this.phone, 
      this.lastLoginAt, 
      this.token, 
      this.tokenType,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    lastLoginAt = json['last_login_at'];
    token = json['token'];
    tokenType = json['token_type'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? phone;
  dynamic lastLoginAt;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['full_name'] = fullName;
    map['email'] = email;
    map['phone'] = phone;
    map['last_login_at'] = lastLoginAt;
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}