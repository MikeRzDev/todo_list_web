// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return ErrorResponse(
    errorList: json['error'] == null
        ? null
        : ErrorList.fromJson(json['error'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int?
    ..message = json['message'] as String?
    ..status = json['status'] as String?;
}

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.errorList);
  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  writeNotNull('status', instance.status);
  return val;
}

ErrorList _$ErrorListFromJson(Map<String, dynamic> json) {
  return ErrorList(
    code: json['code'] as int?,
    message: json['message'] as String?,
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ErrorListToJson(ErrorList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  writeNotNull('errors', instance.errors);
  return val;
}

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return Error(
    message: json['message'] as String?,
    domain: json['domain'] as String?,
    reason: json['reason'] as String?,
  );
}

Map<String, dynamic> _$ErrorToJson(Error instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('domain', instance.domain);
  writeNotNull('reason', instance.reason);
  return val;
}
