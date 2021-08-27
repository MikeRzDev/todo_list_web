// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoRequest _$TodoRequestFromJson(Map<String, dynamic> json) {
  return TodoRequest(
    fields: json['fields'] == null
        ? null
        : Fields.fromJson(json['fields'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TodoRequestToJson(TodoRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fields', instance.fields);
  return val;
}
