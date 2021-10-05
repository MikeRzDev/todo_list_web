import 'package:json_annotation/json_annotation.dart'; 

part 'error_response.g.dart'; 

@JsonSerializable(includeIfNull: false)
class ErrorResponse {
  @JsonKey(name: 'error')
  ErrorList? errorList;

  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;

  ErrorResponse({this.errorList});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ErrorList {
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'errors')
  List<Error>? errors;

  ErrorList({this.code, this.message, this.errors});

  factory ErrorList.fromJson(Map<String, dynamic> json) => _$ErrorListFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorListToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Error {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'domain')
  String? domain;
  @JsonKey(name: 'reason')
  String? reason;

  Error({this.message, this.domain, this.reason});

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

