// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todos _$TodosFromJson(Map<String, dynamic> json) => Todos(
      id: json['id'] as String? ?? 'default',
      title: json['title'] as String? ?? 'default',
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$TodosToJson(Todos instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('completed', instance.completed);
  return val;
}
