// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) {
  return AuthToken(
    kind: json['kind'] as String?,
    localId: json['localId'] as String?,
    email: json['email'] as String?,
    displayName: json['displayName'] as String?,
    idToken: json['idToken'] as String?,
    registered: json['registered'] as bool?,
    refreshToken: json['refreshToken'] as String?,
    expiresIn: json['expiresIn'] as String?,
  );
}

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kind', instance.kind);
  writeNotNull('localId', instance.localId);
  writeNotNull('email', instance.email);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('idToken', instance.idToken);
  writeNotNull('registered', instance.registered);
  writeNotNull('refreshToken', instance.refreshToken);
  writeNotNull('expiresIn', instance.expiresIn);
  return val;
}
