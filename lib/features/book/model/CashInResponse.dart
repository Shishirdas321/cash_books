import 'dart:convert';
/// success : true
/// message : "Item created successfully"
/// data : {"opt_date":"2024-01-15T00:00:00.000000Z","opt_time":"14:30","type":1,"amount":"1000.00","book_id":"8","contact_id":1,"category_id":1,"payment_mode_id":1,"remarks":"Sales payment from customer","status":1,"created_by":1,"updated_by":1,"updated_at":"2025-09-02T05:34:23.000000Z","created_at":"2025-09-02T05:34:23.000000Z","id":3,"book":{"id":8,"name":"A4B Business","balance":"3000.00"},"contact":{"id":1,"name":"Jane Doe Up","mobile_no":"+0987654321"},"category":{"id":1,"name":"Administrative Expenses"},"payment_mode":{"id":1,"name":"Cash"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das"}}

CashInResponse cashInResponseFromJson(String str) => CashInResponse.fromJson(json.decode(str));
String cashInResponseToJson(CashInResponse data) => json.encode(data.toJson());
class CashInResponse {
  CashInResponse({
      this.success, 
      this.message, 
      this.data,});

  CashInResponse.fromJson(dynamic json) {
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

/// opt_date : "2024-01-15T00:00:00.000000Z"
/// opt_time : "14:30"
/// type : 1
/// amount : "1000.00"
/// book_id : "8"
/// contact_id : 1
/// category_id : 1
/// payment_mode_id : 1
/// remarks : "Sales payment from customer"
/// status : 1
/// created_by : 1
/// updated_by : 1
/// updated_at : "2025-09-02T05:34:23.000000Z"
/// created_at : "2025-09-02T05:34:23.000000Z"
/// id : 3
/// book : {"id":8,"name":"A4B Business","balance":"3000.00"}
/// contact : {"id":1,"name":"Jane Doe Up","mobile_no":"+0987654321"}
/// category : {"id":1,"name":"Administrative Expenses"}
/// payment_mode : {"id":1,"name":"Cash"}
/// creator : {"id":1,"first_name":"Tushar","last_name":"Das"}
/// updater : {"id":1,"first_name":"Tushar","last_name":"Das"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.optDate, 
      this.optTime, 
      this.type, 
      this.amount, 
      this.bookId, 
      this.contactId, 
      this.categoryId, 
      this.paymentModeId, 
      this.remarks, 
      this.status, 
      this.createdBy, 
      this.updatedBy, 
      this.updatedAt, 
      this.createdAt, 
      this.id, 
      this.book, 
      this.contact, 
      this.category, 
      this.paymentMode, 
      this.creator, 
      this.updater,});

  Data.fromJson(dynamic json) {
    optDate = json['opt_date'];
    optTime = json['opt_time'];
    type = json['type'];
    amount = json['amount'];
    bookId = json['book_id'];
    contactId = json['contact_id'];
    categoryId = json['category_id'];
    paymentModeId = json['payment_mode_id'];
    remarks = json['remarks'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    book = json['book'] != null ? Book.fromJson(json['book']) : null;
    contact = json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    category = json['category'] != null ? Categorys.fromJson(json['category']) : null;
    paymentMode = json['payment_mode'] != null ? PaymentMode.fromJson(json['payment_mode']) : null;
    creator = json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    updater = json['updater'] != null ? Updater.fromJson(json['updater']) : null;
  }
  String? optDate;
  String? optTime;
  int? type;
  String? amount;
  String? bookId;
  int? contactId;
  int? categoryId;
  int? paymentModeId;
  String? remarks;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? updatedAt;
  String? createdAt;
  int? id;
  Book? book;
  Contact? contact;
  Categorys? category;
  PaymentMode? paymentMode;
  Creator? creator;
  Updater? updater;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['opt_date'] = optDate;
    map['opt_time'] = optTime;
    map['type'] = type;
    map['amount'] = amount;
    map['book_id'] = bookId;
    map['contact_id'] = contactId;
    map['category_id'] = categoryId;
    map['payment_mode_id'] = paymentModeId;
    map['remarks'] = remarks;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    if (book != null) {
      map['book'] = book?.toJson();
    }
    if (contact != null) {
      map['contact'] = contact?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (paymentMode != null) {
      map['payment_mode'] = paymentMode?.toJson();
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

Updater updaterFromJson(String str) => Updater.fromJson(json.decode(str));
String updaterToJson(Updater data) => json.encode(data.toJson());
class Updater {
  Updater({
      this.id, 
      this.firstName, 
      this.lastName,});

  Updater.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }
  int? id;
  String? firstName;
  String? lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    return map;
  }

}

/// id : 1
/// first_name : "Tushar"
/// last_name : "Das"

Creator creatorFromJson(String str) => Creator.fromJson(json.decode(str));
String creatorToJson(Creator data) => json.encode(data.toJson());
class Creator {
  Creator({
      this.id, 
      this.firstName, 
      this.lastName,});

  Creator.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }
  int? id;
  String? firstName;
  String? lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    return map;
  }

}

/// id : 1
/// name : "Cash"

PaymentMode paymentModeFromJson(String str) => PaymentMode.fromJson(json.decode(str));
String paymentModeToJson(PaymentMode data) => json.encode(data.toJson());
class PaymentMode {
  PaymentMode({
      this.id, 
      this.name,});

  PaymentMode.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

/// id : 1
/// name : "Administrative Expenses"

Categorys categoryFromJson(String str) => Categorys.fromJson(json.decode(str));
String categoryToJson(Categorys data) => json.encode(data.toJson());
class Categorys{
  Categorys({
      this.id, 
      this.name,});

  Categorys.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

/// id : 1
/// name : "Jane Doe Up"
/// mobile_no : "+0987654321"

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));
String contactToJson(Contact data) => json.encode(data.toJson());
class Contact {
  Contact({
      this.id, 
      this.name, 
      this.mobileNo,});

  Contact.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    mobileNo = json['mobile_no'];
  }
  int? id;
  String? name;
  String? mobileNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['mobile_no'] = mobileNo;
    return map;
  }

}

/// id : 8
/// name : "A4B Business"
/// balance : "3000.00"

Book bookFromJson(String str) => Book.fromJson(json.decode(str));
String bookToJson(Book data) => json.encode(data.toJson());
class Book {
  Book({
      this.id, 
      this.name, 
      this.balance,});

  Book.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    balance = json['balance'];
  }
  int? id;
  String? name;
  String? balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['balance'] = balance;
    return map;
  }

}