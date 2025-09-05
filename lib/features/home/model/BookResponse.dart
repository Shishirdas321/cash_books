


class AllBookResponse {
  final bool success;
  final String message;
  final BookData? data;

  AllBookResponse({required this.success, required this.message, this.data});

  factory AllBookResponse.fromJson(Map<String, dynamic> json) => AllBookResponse(
    success: json['success'] ?? false,
    message: json['message'] ?? '',
    data: json['data'] != null ? BookData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.toJson(),
  };
}

class BookData {
  final int? currentPage;
  final List<Book>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  BookData({
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
    this.total,
  });

  factory BookData.fromJson(Map<String, dynamic> json) => BookData(
    currentPage: json['current_page'],
    data: json['data'] != null
        ? List<Book>.from(json['data'].map((x) => Book.fromJson(x)))
        : [],
    firstPageUrl: json['first_page_url'],
    from: json['from'],
    lastPage: json['last_page'],
    lastPageUrl: json['last_page_url'],
    links: json['links'] != null
        ? List<Link>.from(json['links'].map((x) => Link.fromJson(x)))
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
    'data': data?.map((x) => x.toJson()).toList(),
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

class Book {
  final int? id;
  final int? businessId;
  final String? name;
  final String? balance;
  final int? status;
  final int? createdBy;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;
  final String? totalCashIn;
  final String? totalCashOut;
  final Business? business;
  final User? creator;
  final User? updater;

  Book({
    this.id,
    this.businessId,
    this.name,
    this.balance,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.totalCashIn,
    this.totalCashOut,
    this.business,
    this.creator,
    this.updater,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json['id'],
    businessId: json['business_id'],
    name: json['name'],
    balance: json['balance'],
    status: json['status'],
    createdBy: json['created_by'],
    updatedBy: json['updated_by'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    totalCashIn: json['total_cash_in'],
    totalCashOut: json['total_cash_out'],
    business:
    json['business'] != null ? Business.fromJson(json['business']) : null,
    creator: json['creator'] != null ? User.fromJson(json['creator']) : null,
    updater: json['updater'] != null ? User.fromJson(json['updater']) : null,
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
    'total_cash_in': totalCashIn,
    'total_cash_out': totalCashOut,
    'business': business?.toJson(),
    'creator': creator?.toJson(),
    'updater': updater?.toJson(),
  };
}

class Business {
  final int? id;
  final String? name;
  final int? status;
  final int? createdBy;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;

  Business({
    this.id,
    this.name,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    id: json['id'],
    name: json['name'],
    status: json['status'],
    createdBy: json['created_by'],
    updatedBy: json['updated_by'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
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
  final String? emailVerifiedAt;
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

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({this.url, this.label, this.active});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
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
