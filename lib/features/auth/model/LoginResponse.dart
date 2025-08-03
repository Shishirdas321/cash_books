import 'dart:convert';
/// success : true
/// message : "Login successful"
/// data : {"user":{"id":1,"first_name":"Tushar","last_name":"Das","full_name":"Tushar Das","email":"tushar2499@gmail.com","phone":"+8801815920898","last_login_at":null},"token":"28|xYI5Rq8WztDBLTpGKSL38A43YDUmC2RjjLobd1Acc1aaac96","token_type":"Bearer"}

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
      this.success, 
      this.message, 
      this.data,});

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// user : {"id":1,"first_name":"Tushar","last_name":"Das","full_name":"Tushar Das","email":"tushar2499@gmail.com","phone":"+8801815920898","last_login_at":null}
/// token : "28|xYI5Rq8WztDBLTpGKSL38A43YDUmC2RjjLobd1Acc1aaac96"
/// token_type : "Bearer"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.user, 
      this.token, 
      this.tokenType,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    tokenType = json['token_type'];
  }
  User? user;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}

/// id : 1
/// first_name : "Tushar"
/// last_name : "Das"
/// full_name : "Tushar Das"
/// email : "tushar2499@gmail.com"
/// phone : "+8801815920898"
/// last_login_at : null

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.fullName, 
      this.email, 
      this.phone, 
      this.lastLoginAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    lastLoginAt = json['last_login_at'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? phone;
  dynamic lastLoginAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['full_name'] = fullName;
    map['email'] = email;
    map['phone'] = phone;
    map['last_login_at'] = lastLoginAt;
    return map;
  }

}