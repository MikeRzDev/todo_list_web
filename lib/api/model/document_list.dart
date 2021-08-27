import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list_web/api/model/fields.dart';
import 'package:todo_list_web/api/model/todo.dart';

part 'document_list.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class DocumentList {
  @JsonKey(name: 'documents')
  List<Document>? documents;

  DocumentList({this.documents});

  factory DocumentList.fromJson(Map<String, dynamic> json) => _$DocumentListFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentListToJson(this);
  
  List<Todo?>? get todoList => documents?.map((document) => document.fields?.todo).toList();
}

@JsonSerializable(ignoreUnannotated: false)
class Document {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'fields')
  Fields? fields;
  @JsonKey(name: 'createTime')
  String? createTime;
  @JsonKey(name: 'updateTime')
  String? updateTime;

  Document({this.name, this.fields, this.createTime, this.updateTime});

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);


}
