import 'dart:convert';

UpdateTransactionResponse updateTransactionResponseFromJson(String str) =>
    UpdateTransactionResponse.fromJson(json.decode(str));
String updateTransactionResponseToJson(UpdateTransactionResponse data) =>
    json.encode(data.toJson());

class UpdateTransactionResponse {
  UpdateTransactionResponse({
    this.success,
    this.message,
    this.data,
  });

  UpdateTransactionResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? TransactionData.fromJson(json['data']) : null;
  }

  bool? success;
  String? message;
  TransactionData? data;

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

class TransactionData {
  TransactionData({
    this.id,
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
    this.createdAt,
    this.updatedAt,
    this.book,
    this.contact,
    this.category,
    this.paymentMode,
    this.creator,
    this.updater,
  });

  TransactionData.fromJson(dynamic json) {
    id = json['id'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    book = json['book'] != null ? TransactionBook.fromJson(json['book']) : null;
    contact = json['contact'] != null ? TransactionContact.fromJson(json['contact']) : null;
    category = json['category'] != null ? TransactionCategory.fromJson(json['category']) : null;
    paymentMode = json['payment_mode'] != null ? TransactionPaymentMode.fromJson(json['payment_mode']) : null;
    creator = json['creator'] != null ? TransactionCreator.fromJson(json['creator']) : null;
    updater = json['updater'] != null ? TransactionUpdater.fromJson(json['updater']) : null;
  }

  int? id;
  String? optDate;
  String? optTime;
  int? type;
  String? amount;
  int? bookId;
  int? contactId;
  int? categoryId;
  int? paymentModeId;
  String? remarks;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  TransactionBook? book;
  TransactionContact? contact;
  TransactionCategory? category;
  TransactionPaymentMode? paymentMode;
  TransactionCreator? creator;
  TransactionUpdater? updater;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
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
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
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

class TransactionUpdater {
  TransactionUpdater({
    this.id,
    this.firstName,
    this.lastName,
  });

  TransactionUpdater.fromJson(dynamic json) {
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

class TransactionCreator {
  TransactionCreator({
    this.id,
    this.firstName,
    this.lastName,
  });

  TransactionCreator.fromJson(dynamic json) {
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

class TransactionPaymentMode {
  TransactionPaymentMode({
    this.id,
    this.name,
  });

  TransactionPaymentMode.fromJson(dynamic json) {
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

class TransactionCategory {
  TransactionCategory({
    this.id,
    this.name,
  });

  TransactionCategory.fromJson(dynamic json) {
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

class TransactionContact {
  TransactionContact({
    this.id,
    this.name,
    this.mobileNo,
  });

  TransactionContact.fromJson(dynamic json) {
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

class TransactionBook {
  TransactionBook({
    this.id,
    this.name,
    this.balance,
  });

  TransactionBook.fromJson(dynamic json) {
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