// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) {
  return AuthRequest(
    email: json['email'] as String?,
    password: json['password'] as String?,
  )..returnSecureToken = json['returnSecureToken'] as bool;
}

Map<String, dynamic> _$AuthRequestToJson(AuthRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  val['returnSecureToken'] = instance.returnSecureToken;
  return val;
}
