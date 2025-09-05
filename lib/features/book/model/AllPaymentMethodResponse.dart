import 'dart:convert';

AllPaymentMethodResponse allPaymentMethodResponseFromJson(String str) =>
    AllPaymentMethodResponse.fromJson(json.decode(str));

String allPaymentMethodResponseToJson(AllPaymentMethodResponse data) =>
    json.encode(data.toJson());

class AllPaymentMethodResponse {
  bool? success;
  String? message;
  PaymentMethodPagination? data;

  AllPaymentMethodResponse({
    this.success,
    this.message,
    this.data,
  });

  factory AllPaymentMethodResponse.fromJson(Map<String, dynamic> json) =>
      AllPaymentMethodResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] != null
            ? PaymentMethodPagination.fromJson(json["data"])
            : null,
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

/// Pagination Data
class PaymentMethodPagination {
  int? currentPage;
  List<PaymentMethod>? data;
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

  PaymentMethodPagination({
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

  factory PaymentMethodPagination.fromJson(Map<String, dynamic> json) =>
      PaymentMethodPagination(
        currentPage: json["current_page"],
        data: json["data"] != null
            ? List<PaymentMethod>.from(
            json["data"].map((x) => PaymentMethod.fromJson(x)))
            : [],
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] != null
            ? List<Links>.from(json["links"].map((x) => Links.fromJson(x)))
            : [],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data?.map((x) => x.toJson()).toList(),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": links?.map((x) => x.toJson()).toList(),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

/// Individual Payment Method
class PaymentMethod {
  int? id;
  int? businessId;
  String? name;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  Business? business;
  User? creator;
  User? updater;

  PaymentMethod({
    this.id,
    this.businessId,
    this.name,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.business,
    this.creator,
    this.updater,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
    id: json["id"],
    businessId: json["business_id"],
    name: json["name"],
    status: json["status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    business:
    json["business"] != null ? Business.fromJson(json["business"]) : null,
    creator:
    json["creator"] != null ? User.fromJson(json["creator"]) : null,
    updater:
    json["updater"] != null ? User.fromJson(json["updater"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "name": name,
    "status": status,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "business": business?.toJson(),
    "creator": creator?.toJson(),
    "updater": updater?.toJson(),
  };
}

/// Business Info
class Business {
  int? id;
  String? name;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

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
    id: json["id"],
    name: json["name"],
    status: json["status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

/// Creator / Updater (User)
class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

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
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

/// Pagination Links
class Links {
  dynamic url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
