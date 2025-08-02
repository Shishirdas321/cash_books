class ErrorResponse {
  List<Errors>? errors;
  String? message;

  ErrorResponse({this.errors, this.message});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    message = "Something went wrong";
    if(json['message'] != null){
      message = json['message'];
    }else{
      if (json['errors'] != null) {
        if(json['errors'] is String){
          message = json['errors'];
        }else if(json['errors'] is List){
          errors = <Errors>[];
          json['errors'].forEach((v) {
            errors!.add(Errors.fromJson(v));
          });
          if((errors?.length ?? 0) > 0){
            message = errors![0].message ?? "";
          }
        }else{
          //
        }
      }else{
        //
      }
    }
  }
}

class Errors {
  String? code;
  String? message;

  Errors({this.code, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

}
