import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable(includeIfNull: false)
class AppConfig {

  @JsonKey(name: 'firebase_api_key')
  String? firebaseApiKey;


  AppConfig({this.firebaseApiKey});

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  static Future<AppConfig> load() async {
    final contents = await rootBundle.loadString(
      'assets/config/app_config.json',
    );

    return AppConfig.fromJson(jsonDecode(contents));
  }
}
