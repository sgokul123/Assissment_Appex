import 'package:appex_assignment/src/models/response_data.dart';

class BaseResponse {
  ResponseData data;
  int code;
  bool success;

  BaseResponse({this.data, this.code, this.success});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      data: ResponseData.fromJson(json["data"]),
      code: json["code"],
      success: json["success"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": this.data,
      "code": this.code,
      "success": this.success,
    };
  }
//

}
