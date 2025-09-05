/*
import 'dart:convert';
/// success : true
/// message : "Categories retrieved successfully"
/// data : {"current_page":1,"data":[{"id":8,"book_id":5,"name":"New","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-28T11:42:07.000000Z","updated_at":"2025-08-28T11:42:07.000000Z","book":{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":9,"book_id":5,"name":"ok","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-28T11:46:35.000000Z","updated_at":"2025-08-28T11:46:35.000000Z","book":{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":5,"book_id":5,"name":"okay","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-28T11:32:37.000000Z","updated_at":"2025-08-28T11:32:37.000000Z","book":{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":6,"book_id":5,"name":"Payment","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-28T11:39:18.000000Z","updated_at":"2025-08-28T11:39:18.000000Z","book":{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":7,"book_id":5,"name":"Payment","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-28T11:39:39.000000Z","updated_at":"2025-08-28T11:39:39.000000Z","book":{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}}],"first_page_url":"https://cash.tushar-das.xyz/api/books/5/categories?page=1","from":1,"last_page":1,"last_page_url":"https://cash.tushar-das.xyz/api/books/5/categories?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://cash.tushar-das.xyz/api/books/5/categories?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"https://cash.tushar-das.xyz/api/books/5/categories","per_page":15,"prev_page_url":null,"to":5,"total":5}

GetCategoryResponse getCategoryResponseFromJson(String str) => GetCategoryResponse.fromJson(json.decode(str));
String getCategoryResponseToJson(GetCategoryResponse data) => json.encode(data.toJson());
class GetCategoryResponse {
  GetCategoryResponse({
      this.success, 
      this.message, 
      this.data,});

  GetCategoryResponse.fromJson(dynamic json) {
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

/// current_page : 1
/// data : [{"id":8,"book_id":5,"name":"New","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-28T11:42:07.000000Z","updated_at":"2025-08-28T11:42:07.000000Z","book":{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":9,"book_id":5,"name":"ok","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-28T11:46:35.000000Z","updated_at":"2025-08-28T11:46:35.000000Z","book":{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":5,"book_id":5,"name":"okay","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-28T11:32:37.000000Z","updated_at":"2025-08-28T11:32:37.000000Z","book":{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":6,"book_id":5,"name":"Payment","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-28T11:39:18.000000Z","updated_at":"2025-08-28T11:39:18.000000Z","book":{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":7,"book_id":5,"name":"Payment","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-28T11:39:39.000000Z","updated_at":"2025-08-28T11:39:39.000000Z","book":{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}}]
/// first_page_url : "https://cash.tushar-das.xyz/api/books/5/categories?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://cash.tushar-das.xyz/api/books/5/categories?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://cash.tushar-das.xyz/api/books/5/categories?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "https://cash.tushar-das.xyz/api/books/5/categories"
/// per_page : 15
/// prev_page_url : null
/// to : 5
/// total : 5

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.currentPage, 
      this.data, 
      this.firstPageUrl, 
      this.from, 
      this.lastPage, 
      this.lastPageUrl, 
      this.links, 
      this.nextPageUrl, 
      this.path, 
      this.perPage, 
      this.prevPageUrl, 
      this.to, 
      this.total,});

  Data.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }

}

/// url : null
/// label : "&laquo; Previous"
/// active : false

Links linksFromJson(String str) => Links.fromJson(json.decode(str));
String linksToJson(Links data) => json.encode(data.toJson());
class Links {
  Links({
      this.url, 
      this.label, 
      this.active,});

  Links.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
  dynamic url;
  String? label;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }

}

/// id : 8
/// book_id : 5
/// name : "New"
/// status : 1
/// created_by : 1
/// updated_by : 1
/// created_at : "2025-08-28T11:42:07.000000Z"
/// updated_at : "2025-08-28T11:42:07.000000Z"
/// book : {"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z"}
/// creator : {"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}
/// updater : {"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.bookId, 
      this.name, 
      this.status, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt, 
      this.book, 
      this.creator, 
      this.updater,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    bookId = json['book_id'];
    name = json['name'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    book = json['book'] != null ? Book.fromJson(json['book']) : null;
    creator = json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    updater = json['updater'] != null ? Updater.fromJson(json['updater']) : null;
  }
  int? id;
  int? bookId;
  String? name;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  Book? book;
  Creator? creator;
  Updater? updater;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['book_id'] = bookId;
    map['name'] = name;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (book != null) {
      map['book'] = book?.toJson();
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

/// id : 5
/// business_id : 9
/// name : "Cash"
/// balance : "1000.00"
/// status : 1
/// created_by : 1
/// updated_by : 1
/// created_at : "2025-08-18T11:01:47.000000Z"
/// updated_at : "2025-08-19T08:17:47.000000Z"

Book bookFromJson(String str) => Book.fromJson(json.decode(str));
String bookToJson(Book data) => json.encode(data.toJson());
class Book {
  Book({
      this.id, 
      this.businessId, 
      this.name, 
      this.balance, 
      this.status, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt,});

  Book.fromJson(dynamic json) {
    id = json['id'];
    businessId = json['business_id'];
    name = json['name'];
    balance = json['balance'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? businessId;
  String? name;
  String? balance;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['business_id'] = businessId;
    map['name'] = name;
    map['balance'] = balance;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}*/
class AllCategoriesResponse {
  final bool? success;
  final String? message;
  final CategoryData? data;

  AllCategoriesResponse({this.success, this.message, this.data});

  factory AllCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      AllCategoriesResponse(
        success: json['success'],
        message: json['message'],
        data: json['data'] != null
            ? CategoryData.fromJson(json['data'])
            : null,
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.toJson(),
  };
}

class CategoryData {
  final int? currentPage;
  final List<Category>? categories;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Links>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  CategoryData({
    this.currentPage,
    this.categories,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    currentPage: json['current_page'],
    categories: json['data'] != null
        ? List<Category>.from(
        json['data'].map((x) => Category.fromJson(x)))
        : [],
    firstPageUrl: json['first_page_url'],
    from: json['from'],
    lastPage: json['last_page'],
    lastPageUrl: json['last_page_url'],
    links: json['links'] != null
        ? List<Links>.from(
        json['links'].map((x) => Links.fromJson(x)))
        : [],
    nextPageUrl: json['next_page_url'],
    path: json['path'],
    perPage: json['per_page'],
    prevPageUrl: json['prev_page_url'],
    to: json['to'],
    total: json['total'],
  );

  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'data': categories?.map((x) => x.toJson()).toList(),
    'first_page_url': firstPageUrl,
    'from': from,
    'last_page': lastPage,
    'last_page_url': lastPageUrl,
    'links': links?.map((x) => x.toJson()).toList(),
    'next_page_url': nextPageUrl,
    'path': path,
    'per_page': perPage,
    'prev_page_url': prevPageUrl,
    'to': to,
    'total': total,
  };
}

class Category {
  final int? id;
  final int? bookId;
  final String? name;
  final int? status;
  final int? createdBy;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;
  final Bookss? book;
  final User? creator;
  final User? updater;

  Category({
    this.id,
    this.bookId,
    this.name,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.book,
    this.creator,
    this.updater,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'],
    bookId: json['book_id'],
    name: json['name'],
    status: json['status'],
    createdBy: json['created_by'],
    updatedBy: json['updated_by'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    book: json['book'] != null ? Bookss.fromJson(json['book']) : null,
    creator:
    json['creator'] != null ? User.fromJson(json['creator']) : null,
    updater:
    json['updater'] != null ? User.fromJson(json['updater']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'book_id': bookId,
    'name': name,
    'status': status,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'book': book?.toJson(),
    'creator': creator?.toJson(),
    'updater': updater?.toJson(),
  };
}

class Bookss {
  final int? id;
  final int? businessId;
  final String? name;
  final String? balance;
  final int? status;
  final int? createdBy;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;

  Bookss({
    this.id,
    this.businessId,
    this.name,
    this.balance,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Bookss.fromJson(Map<String, dynamic> json) => Bookss(
    id: json['id'],
    businessId: json['business_id'],
    name: json['name'],
    balance: json['balance'],
    status: json['status'],
    createdBy: json['created_by'],
    updatedBy: json['updated_by'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'business_id': businessId,
    'name': name,
    'balance': balance,
    'status': status,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final dynamic emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    email: json['email'],
    phone: json['phone'],
    emailVerifiedAt: json['email_verified_at'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'phone': phone,
    'email_verified_at': emailVerifiedAt,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class Links {
  final dynamic url;
  final String? label;
  final bool? active;

  Links({this.url, this.label, this.active});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    url: json['url'],
    label: json['label'],
    active: json['active'],
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'label': label,
    'active': active,
  };
}
