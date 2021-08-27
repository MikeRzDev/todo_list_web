import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list_web/api/model/fields.dart';
import 'package:todo_list_web/api/model/todo.dart';

part 'todo_request.g.dart';

@JsonSerializable(includeIfNull: false)
class TodoRequest {
  @JsonKey(name: 'fields')
  Fields? fields;

  TodoRequest({this.fields});

  factory TodoRequest.fromJson(Map<String, dynamic> json) => _$TodoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TodoRequestToJson(this);
  @override
  String toString() => json.encode(this);

  TodoRequest.fromValue(String text) {
    fields = Fields(todo: Todo(value: text));
  }

}
