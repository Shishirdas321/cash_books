import 'dart:convert';
/// success : true
/// message : "Team member added successfully"
/// data : {"business_id":9,"user_id":14,"role":"partner","status":1,"created_by":1,"updated_by":1,"updated_at":"2025-11-04T09:29:59.000000Z","created_at":"2025-11-04T09:29:59.000000Z","id":45,"business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"user":{"id":14,"first_name":"shishir","last_name":"das","email":"newtest2@gmail.com","phone":"8801320000000","email_verified_at":null,"created_at":"2025-08-11T05:18:06.000000Z","updated_at":"2025-08-11T05:18:06.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}}

AddTeamMember addTeamMemberFromJson(String str) => AddTeamMember.fromJson(json.decode(str));
String addTeamMemberToJson(AddTeamMember data) => json.encode(data.toJson());
class AddTeamMember {
  AddTeamMember({
      this.success, 
      this.message, 
      this.data,});

  AddTeamMember.fromJson(dynamic json) {
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

/// business_id : 9
/// user_id : 14
/// role : "partner"
/// status : 1
/// created_by : 1
/// updated_by : 1
/// updated_at : "2025-11-04T09:29:59.000000Z"
/// created_at : "2025-11-04T09:29:59.000000Z"
/// id : 45
/// business : {"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"}
/// user : {"id":14,"first_name":"shishir","last_name":"das","email":"newtest2@gmail.com","phone":"8801320000000","email_verified_at":null,"created_at":"2025-08-11T05:18:06.000000Z","updated_at":"2025-08-11T05:18:06.000000Z"}
/// creator : {"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}
/// updater : {"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.businessId, 
      this.userId, 
      this.role, 
      this.status, 
      this.createdBy, 
      this.updatedBy, 
      this.updatedAt, 
      this.createdAt, 
      this.id, 
      this.business, 
      this.user, 
      this.creator, 
      this.updater,});

  Data.fromJson(dynamic json) {
    businessId = json['business_id'];
    userId = json['user_id'];
    role = json['role'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    business = json['business'] != null ? Business.fromJson(json['business']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    creator = json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    updater = json['updater'] != null ? Updater.fromJson(json['updater']) : null;
  }
  int? businessId;
  int? userId;
  String? role;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? updatedAt;
  String? createdAt;
  int? id;
  Business? business;
  User? user;
  Creator? creator;
  Updater? updater;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['business_id'] = businessId;
    map['user_id'] = userId;
    map['role'] = role;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    if (business != null) {
      map['business'] = business?.toJson();
    }
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

/// id : 14
/// first_name : "shishir"
/// last_name : "das"
/// email : "newtest2@gmail.com"
/// phone : "8801320000000"
/// email_verified_at : null
/// created_at : "2025-08-11T05:18:06.000000Z"
/// updated_at : "2025-08-11T05:18:06.000000Z"

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

/// id : 9
/// name : "A4B"
/// status : 1
/// created_by : 1
/// updated_by : 1
/// created_at : "2025-08-12T07:01:10.000000Z"
/// updated_at : "2025-08-12T07:01:10.000000Z"

Business businessFromJson(String str) => Business.fromJson(json.decode(str));
String businessToJson(Business data) => json.encode(data.toJson());
class Business {
  Business({
      this.id, 
      this.name, 
      this.status, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt,});

  Business.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}