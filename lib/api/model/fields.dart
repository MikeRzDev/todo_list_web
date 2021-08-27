import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list_web/api/model/todo.dart';
part 'fields.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Fields {
  @JsonKey(name: 'todo')
  Todo? todo;

  Fields({required this.todo});

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);

  Map<String, dynamic> toJson() => _$FieldsToJson(this);
}
