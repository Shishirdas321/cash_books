import 'dart:convert';
/// success : true
/// message : "Book access list retrieved successfully"
/// data : [{"id":null,"book_id":9,"user_id":1,"role":"admin","status":1,"is_creator":true,"created_by":1,"updated_by":1,"created_at":"2025-08-18T12:00:08.000000Z","updated_at":"2025-09-02T05:27:36.000000Z","user":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}}]

GetAllUserWithAccessResponse getAllUserWithAccessResponseFromJson(String str) => GetAllUserWithAccessResponse.fromJson(json.decode(str));
String getAllUserWithAccessResponseToJson(GetAllUserWithAccessResponse data) => json.encode(data.toJson());
class GetAllUserWithAccessResponse {
  GetAllUserWithAccessResponse({
      this.success, 
      this.message, 
      this.data,});

  GetAllUserWithAccessResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : null
/// book_id : 9
/// user_id : 1
/// role : "admin"
/// status : 1
/// is_creator : true
/// created_by : 1
/// updated_by : 1
/// created_at : "2025-08-18T12:00:08.000000Z"
/// updated_at : "2025-09-02T05:27:36.000000Z"
/// user : {"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}
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
      this.isCreator, 
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
    isCreator = json['is_creator'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    creator = json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    updater = json['updater'] != null ? Updater.fromJson(json['updater']) : null;
  }
  dynamic id;
  int? bookId;
  int? userId;
  String? role;
  int? status;
  bool? isCreator;
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
    map['is_creator'] = isCreator;
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

/// id : 1
/// first_name : "Tushar"
/// last_name : "Das"
/// email : "tushar2499@gmail.com"
/// phone : "+8801815920898"
/// email_verified_at : null
/// created_at : "2025-07-29T10:08:21.000000Z"
/// updated_at : "2025-07-29T10:08:21.000000Z"

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