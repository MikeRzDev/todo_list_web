import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable(includeIfNull: false)
class AuthToken {
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'localId')
  String? localId;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'displayName')
  String? displayName;
  @JsonKey(name: 'idToken')
  String? idToken;
  @JsonKey(name: 'registered')
  bool? registered;
  @JsonKey(name: 'refreshToken')
  String? refreshToken;
  @JsonKey(name: 'expiresIn')
  String? expiresIn;

  AuthToken({
    this.kind,
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
    this.refreshToken,
    this.expiresIn,
  });

  @override
  String toString() => json.encode(this);

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}
