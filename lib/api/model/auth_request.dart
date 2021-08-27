import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

@JsonSerializable(includeIfNull: false)
class AuthRequest {
  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'returnSecureToken')
  bool returnSecureToken = true;

  AuthRequest({this.email, this.password});

  @override
  String toString() => json.encode(this);

  factory AuthRequest.fromJson(Map<String, dynamic> json) => _$AuthRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
