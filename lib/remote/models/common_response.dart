class CommonResponse {
  CommonResponse({
    this.statusCode,
    this.message,
    this.success
  });

  CommonResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    success = json['success'];
  }

  int? statusCode;
  String? message;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['success'] = success;
    return map;
  }
}