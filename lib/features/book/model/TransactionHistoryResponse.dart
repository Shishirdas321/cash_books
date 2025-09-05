
import 'dart:convert';

/// Top-level response
class TransactionHistoryResponse {
  bool? success;
  String? message;
  TransactionData? data;

  TransactionHistoryResponse({this.success, this.message, this.data});

  factory TransactionHistoryResponse.fromJson(Map<String, dynamic> json) {
    return TransactionHistoryResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? TransactionData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.toJson(),
  };
}

/// Paginated transaction data
class TransactionData {
  int? currentPage;
  List<TransactionItem>? transactions;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  TransactionData({
    this.currentPage,
    this.transactions,
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

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      currentPage: json['current_page'],
      transactions: json['data'] != null
          ? List<TransactionItem>.from(json['data'].map((x) => TransactionItem.fromJson(x)))
          : null,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: json['links'] != null
          ? List<Links>.from(json['links'].map((x) => Links.fromJson(x)))
          : null,
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'data': transactions?.map((x) => x.toJson()).toList(),
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

/// Individual transaction
class TransactionItem {
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
  Booke? book;
  Contact? contact;
  TransactionCategory? category;
  PaymentMode? paymentMode;
  User? creator;
  User? updater;

  TransactionItem({
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

  factory TransactionItem.fromJson(Map<String, dynamic> json) => TransactionItem(
    id: json['id'],
    optDate: json['opt_date'],
    optTime: json['opt_time'],
    type: json['type'],
    amount: json['amount'],
    bookId: json['book_id'],
    contactId: json['contact_id'],
    categoryId: json['category_id'],
    paymentModeId: json['payment_mode_id'],
    remarks: json['remarks'],
    status: json['status'],
    createdBy: json['created_by'],
    updatedBy: json['updated_by'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    book: json['book'] != null ? Booke.fromJson(json['book']) : null,
    contact: json['contact'] != null ? Contact.fromJson(json['contact']) : null,
    category: json['category'] != null ? TransactionCategory.fromJson(json['category']) : null,
    paymentMode: json['payment_mode'] != null ? PaymentMode.fromJson(json['payment_mode']) : null,
    creator: json['creator'] != null ? User.fromJson(json['creator']) : null,
    updater: json['updater'] != null ? User.fromJson(json['updater']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'opt_date': optDate,
    'opt_time': optTime,
    'type': type,
    'amount': amount,
    'book_id': bookId,
    'contact_id': contactId,
    'category_id': categoryId,
    'payment_mode_id': paymentModeId,
    'remarks': remarks,
    'status': status,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'book': book?.toJson(),
    'contact': contact?.toJson(),
    'category': category?.toJson(),
    'payment_mode': paymentMode?.toJson(),
    'creator': creator?.toJson(),
    'updater': updater?.toJson(),
  };
}

/// Reusable user model for creator/updater
class User {
  int? id;
  String? firstName;
  String? lastName;

  User({this.id, this.firstName, this.lastName});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    firstName: json['first_name'],
    lastName: json['last_name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
  };
}

/// Book model
class Booke {
  int? id;
  String? name;
  String? balance;

  Booke({this.id, this.name, this.balance});

  factory Booke.fromJson(Map<String, dynamic> json) => Booke(
    id: json['id'],
    name: json['name'],
    balance: json['balance'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'balance': balance,
  };
}

/// Contact model
class Contact {
  int? id;
  String? name;
  String? mobileNo;

  Contact({this.id, this.name, this.mobileNo});

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json['id'],
    name: json['name'],
    mobileNo: json['mobile_no'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'mobile_no': mobileNo,
  };
}

/// Category model
class TransactionCategory {
  int? id;
  String? name;

  TransactionCategory({this.id, this.name});

  factory TransactionCategory.fromJson(Map<String, dynamic> json) => TransactionCategory(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}

/// Payment mode model
class PaymentMode {
  int? id;
  String? name;

  PaymentMode({this.id, this.name});

  factory PaymentMode.fromJson(Map<String, dynamic> json) => PaymentMode(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}

/// Pagination links
class Links {
  String? url;
  String? label;
  bool? active;

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

/// Helper functions
TransactionHistoryResponse transactionHistoryResponseFromJson(String str) =>
    TransactionHistoryResponse.fromJson(json.decode(str));

String transactionHistoryResponseToJson(TransactionHistoryResponse data) =>
    json.encode(data.toJson());
