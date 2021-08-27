// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentList _$DocumentListFromJson(Map<String, dynamic> json) {
  return DocumentList(
    documents: (json['documents'] as List<dynamic>?)
        ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DocumentListToJson(DocumentList instance) =>
    <String, dynamic>{
      'documents': instance.documents,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return Document(
    name: json['name'] as String?,
    fields: json['fields'] == null
        ? null
        : Fields.fromJson(json['fields'] as Map<String, dynamic>),
    createTime: json['createTime'] as String?,
    updateTime: json['updateTime'] as String?,
  );
}

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'name': instance.name,
      'fields': instance.fields,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
    };
