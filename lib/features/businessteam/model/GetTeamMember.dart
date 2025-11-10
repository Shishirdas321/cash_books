class BusinessTeamResponse {
  final bool? success;
  final String? message;
  final List<TeamMember>? data;

  BusinessTeamResponse({this.success, this.message, this.data});

  factory BusinessTeamResponse.fromJson(Map<String, dynamic> json) =>
      BusinessTeamResponse(
        success: json['success'],
        message: json['message'],
        data: json['data'] != null
            ? List<TeamMember>.from(
            json['data'].map((x) => TeamMember.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.map((x) => x.toJson()).toList(),
  };
}

class TeamMember {
  final int? id;
  final int? businessId;
  final int? userId;
  final String? role;
  final int? status;
  final int? createdBy;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;
  final User? user;
  final User? creator;
  final User? updater;

  TeamMember({
    this.id,
    this.businessId,
    this.userId,
    this.role,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.creator,
    this.updater,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
    id: json['id'],
    businessId: json['business_id'],
    userId: json['user_id'],
    role: json['role'],
    status: json['status'],
    createdBy: json['created_by'],
    updatedBy: json['updated_by'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    user: json['user'] != null ? User.fromJson(json['user']) : null,
    creator:
    json['creator'] != null ? User.fromJson(json['creator']) : null,
    updater:
    json['updater'] != null ? User.fromJson(json['updater']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'business_id': businessId,
    'user_id': userId,
    'role': role,
    'status': status,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'user': user?.toJson(),
    'creator': creator?.toJson(),
    'updater': updater?.toJson(),
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
