import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Todo {
  @JsonKey(name: 'stringValue')
  String? value;

  Todo({required this.value});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}