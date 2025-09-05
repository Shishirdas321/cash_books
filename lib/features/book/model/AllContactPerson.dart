/*
import 'dart:convert';
/// success : true
/// message : "Contact persons retrieved successfully"
/// data : {"current_page":1,"data":[],"first_page_url":"https://cash.tushar-das.xyz/api/books/9/contact-persons?page=1","from":null,"last_page":1,"last_page_url":"https://cash.tushar-das.xyz/api/books/9/contact-persons?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://cash.tushar-das.xyz/api/books/9/contact-persons?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"https://cash.tushar-das.xyz/api/books/9/contact-persons","per_page":15,"prev_page_url":null,"to":null,"total":0}

AllContactPerson allContactPersonFromJson(String str) => AllContactPerson.fromJson(json.decode(str));
String allContactPersonToJson(AllContactPerson data) => json.encode(data.toJson());
class AllContactPerson {
  AllContactPerson({
      this.success, 
      this.message, 
      this.data,});

  AllContactPerson.fromJson(dynamic json) {
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
/// data : []
/// first_page_url : "https://cash.tushar-das.xyz/api/books/9/contact-persons?page=1"
/// from : null
/// last_page : 1
/// last_page_url : "https://cash.tushar-das.xyz/api/books/9/contact-persons?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://cash.tushar-das.xyz/api/books/9/contact-persons?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "https://cash.tushar-das.xyz/api/books/9/contact-persons"
/// per_page : 15
/// prev_page_url : null
/// to : null
/// total : 0

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
        data?.add(Dynamic.fromJson(v));
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
  List<dynamic>? data;
  String? firstPageUrl;
  dynamic from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  dynamic to;
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

}*/
//
// class ContactPersonResponse {
//   bool success;
//   String? message;
//   ContactPersonData? data;
//
//   ContactPersonResponse({
//     required this.success,
//     this.message,
//     this.data,
//   });
//
//   factory ContactPersonResponse.fromJson(Map<String, dynamic> json) => ContactPersonResponse(
//     success: json["success"],
//     message: json["message"],
//     data: json["data"] != null ? ContactPersonData.fromJson(json["data"]) : null,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "data": data?.toJson(),
//   };
// }
//
// class ContactPersonData {
//   int? currentPage;
//   List<ContactPerson> data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Link> links;
//   String? nextPageUrl;
//   String? path;
//   int? perPage;
//   String? prevPageUrl;
//   int? to;
//   int? total;
//
//   ContactPersonData({
//     this.currentPage,
//     this.data = const [],
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.links = const [],
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });
//
//   factory ContactPersonData.fromJson(Map<String, dynamic> json) => ContactPersonData(
//     currentPage: json["current_page"],
//     data: json["data"] != null
//         ? List<ContactPerson>.from(json["data"].map((x) => ContactPerson.fromJson(x)))
//         : [],
//     firstPageUrl: json["first_page_url"],
//     from: json["from"],
//     lastPage: json["last_page"],
//     lastPageUrl: json["last_page_url"],
//     links: json["links"] != null
//         ? List<Link>.from(json["links"].map((x) => Link.fromJson(x)))
//         : [],
//     nextPageUrl: json["next_page_url"],
//     path: json["path"],
//     perPage: json["per_page"],
//     prevPageUrl: json["prev_page_url"],
//     to: json["to"],
//     total: json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "current_page": currentPage,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "first_page_url": firstPageUrl,
//     "from": from,
//     "last_page": lastPage,
//     "last_page_url": lastPageUrl,
//     "links": List<dynamic>.from(links.map((x) => x.toJson())),
//     "next_page_url": nextPageUrl,
//     "path": path,
//     "per_page": perPage,
//     "prev_page_url": prevPageUrl,
//     "to": to,
//     "total": total,
//   };
// }
//
// class ContactPerson {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//
//   ContactPerson({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//   });
//
//   factory ContactPerson.fromJson(Map<String, dynamic> json) => ContactPerson(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     phone: json["phone"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "phone": phone,
//   };
// }
//
// class Link {
//   String? url;
//   String? label;
//   bool? active;
//
//   Link({
//     this.url,
//     this.label,
//     this.active,
//   });
//
//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//     url: json["url"],
//     label: json["label"],
//     active: json["active"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "url": url,
//     "label": label,
//     "active": active,
//   };
// }

class ContactPersonResponse {
  final bool success;
  final String message;
  final ContactPersonData data;

  ContactPersonResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ContactPersonResponse.fromJson(Map<String, dynamic> json) {
    return ContactPersonResponse(
      success: json['success'],
      message: json['message'],
      data: ContactPersonData.fromJson(json['data']),
    );
  }
}

class ContactPersonData {
  final int currentPage;
  final List<ContactPerson> data;
  final int? from;
  final int lastPage;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final int? prevPageUrl;
  final int to;
  final int total;

  ContactPersonData({
    required this.currentPage,
    required this.data,
    required this.from,
    required this.lastPage,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory ContactPersonData.fromJson(Map<String, dynamic> json) {
    return ContactPersonData(
      currentPage: json['current_page'],
      data: (json['data'] as List)
          .map((e) => ContactPerson.fromJson(e))
          .toList(),
      from: json['from'],
      lastPage: json['last_page'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class ContactPerson {
  final int id;
  final int bookId;
  final String name;
  final String? mobileNo;
  final int status;
  final int createdBy;
  final int updatedBy;
  final String createdAt;
  final String updatedAt;
  final Books book;
  final User creator;
  final User updater;

  ContactPerson({
    required this.id,
    required this.bookId,
    required this.name,
    this.mobileNo,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.book,
    required this.creator,
    required this.updater,
  });

  factory ContactPerson.fromJson(Map<String, dynamic> json) {
    return ContactPerson(
      id: json['id'],
      bookId: json['book_id'],
      name: json['name'],
      mobileNo: json['mobile_no'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      book: Books.fromJson(json['book']),
      creator: User.fromJson(json['creator']),
      updater: User.fromJson(json['updater']),
    );
  }
}

class Books {
  final int id;
  final int businessId;
  final String name;
  final String balance;
  final int status;
  final int createdBy;
  final int updatedBy;
  final String createdAt;
  final String updatedAt;

  Books({
    required this.id,
    required this.businessId,
    required this.name,
    required this.balance,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
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
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

