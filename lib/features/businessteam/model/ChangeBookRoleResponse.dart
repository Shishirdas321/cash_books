import 'dart:convert';
/// success : true
/// message : "Book access updated successfully"
/// data : {"id":3,"book_id":8,"user_id":2,"role":"admin","status":1,"created_by":1,"updated_by":1,"created_at":"2025-11-24T14:52:37.000000Z","updated_at":"2025-11-24T14:53:35.000000Z","user":{"id":2,"first_name":"John","last_name":"Doe","email":"john.doe@example.com","phone":"1234567890","email_verified_at":null,"created_at":"2025-07-29T11:02:55.000000Z","updated_at":"2025-07-29T11:02:55.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}}

ChangeBookRoleResponse changeBookRoleResponseFromJson(String str) => ChangeBookRoleResponse.fromJson(json.decode(str));
String changeBookRoleResponseToJson(ChangeBookRoleResponse data) => json.encode(data.toJson());
class ChangeBookRoleResponse {
  ChangeBookRoleResponse({
      this.success, 
      this.message, 
      this.data,});

  ChangeBookRoleResponse.fromJson(dynamic json) {
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

/// id : 3
/// book_id : 8
/// user_id : 2
/// role : "admin"
/// status : 1
/// created_by : 1
/// updated_by : 1
/// created_at : "2025-11-24T14:52:37.000000Z"
/// updated_at : "2025-11-24T14:53:35.000000Z"
/// user : {"id":2,"first_name":"John","last_name":"Doe","email":"john.doe@example.com","phone":"1234567890","email_verified_at":null,"created_at":"2025-07-29T11:02:55.000000Z","updated_at":"2025-07-29T11:02:55.000000Z"}
/// creator : {"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}
/// updater : {"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.bookId, 
      this.userId, 
      this.role, 
      this.status, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt, 
      this.user, 
      this.creator, 
      this.updater,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    bookId = json['book_id'];
    userId = json['user_id'];
    role = json['role'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    creator = json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    updater = json['updater'] != null ? Updater.fromJson(json['updater']) : null;
  }
  int? id;
  int? bookId;
  int? userId;
  String? role;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  User? user;
  Creator? creator;
  Updater? updater;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['book_id'] = bookId;
    map['user_id'] = userId;
    map['role'] = role;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (creator != null) {
      map['creator'] = creator?.toJson();
    }
    if (updater != null) {
      map['updater'] = updater?.toJson();
    }
    return map;
  }

}

/// id : 1
/// first_name : "Tushar"
/// last_name : "Das"
/// email : "tushar2499@gmail.com"
/// phone : "+8801815920898"
/// email_verified_at : null
/// created_at : "2025-07-29T10:08:21.000000Z"
/// updated_at : "2025-07-29T10:08:21.000000Z"

Updater updaterFromJson(String str) => Updater.fromJson(json.decode(str));
String updaterToJson(Updater data) => json.encode(data.toJson());
class Updater {
  Updater({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  Updater.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 1
/// first_name : "Tushar"
/// last_name : "Das"
/// email : "tushar2499@gmail.com"
/// phone : "+8801815920898"
/// email_verified_at : null
/// created_at : "2025-07-29T10:08:21.000000Z"
/// updated_at : "2025-07-29T10:08:21.000000Z"

Creator creatorFromJson(String str) => Creator.fromJson(json.decode(str));
String creatorToJson(Creator data) => json.encode(data.toJson());
class Creator {
  Creator({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  Creator.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 2
/// first_name : "John"
/// last_name : "Doe"
/// email : "john.doe@example.com"
/// phone : "1234567890"
/// email_verified_at : null
/// created_at : "2025-07-29T11:02:55.000000Z"
/// updated_at : "2025-07-29T11:02:55.000000Z"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}