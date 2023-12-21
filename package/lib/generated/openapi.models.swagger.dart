// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

part 'openapi.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class Todos {
  const Todos({
    this.id,
    this.title,
    this.completed,
  });

  factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);

  static const toJsonFactory = _$TodosToJson;
  Map<String, dynamic> toJson() => _$TodosToJson(this);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 'default')
  final String? id;
  @JsonKey(name: 'title', includeIfNull: false, defaultValue: 'default')
  final String? title;
  @JsonKey(name: 'completed', includeIfNull: false)
  final bool? completed;
  static const fromJsonFactory = _$TodosFromJson;

  @override
  String toString() => jsonEncode(this);
}

extension $TodosExtension on Todos {
  Todos copyWith({String? id, String? title, bool? completed}) {
    return Todos(
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed);
  }

  Todos copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? title,
      Wrapped<bool?>? completed}) {
    return Todos(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        completed: (completed != null ? completed.value : this.completed));
  }
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
