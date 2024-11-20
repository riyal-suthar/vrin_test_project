abstract class Serializable {
  Map<String, dynamic> toJson();
}

class ApiResponse<T extends Serializable> {
  bool success;
  int? code;
  String? message;
  ErrorResponseModel? error;
  T? data;

  ApiResponse({this.message, this.code, this.data, required this.success, this.error});

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>)? create) {
    // print("COME IN FROM JSON 👀");
    return ApiResponse<T>(
      success: json["success"],
      code: json["code"],
      message: json["message"],
      data: json['data'] != null ? _parseData<T>(json["data"], create) : null,
      error: json["errors"] == null ? null : _parseError(json["errors"]),
    );
  }

  static T? _parseData<T extends Serializable>(dynamic data, T Function(Map<String, dynamic>)? create) {
    return data is Map<String, dynamic> && create != null ? create(data) : null;
  }

  static ErrorResponseModel _parseError(dynamic errors) {
    if (errors is Map<String, dynamic>) {
      return ErrorResponseModel.fromJson(errors);
    } else if (errors is String) {
      return ErrorResponseModel.fromString(errors);
    }
    throw const FormatException("Invalid error format in API Response _parseError");
  }
}

class ErrorResponseModel {
  int? code;
  String? message;

  ErrorResponseModel({this.code, this.message});

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(code: json['code'] as int?, message: json['message'] as String?);
  }

  factory ErrorResponseModel.fromString(String error) {
    return ErrorResponseModel(message: error);
  }
}
