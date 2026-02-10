// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_ce_flutter/adapters.dart';

part 'source_dto.g.dart';

@HiveType(typeId: 2)
class SourceDto {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;

  const SourceDto({
    this.id,
    this.name,
  });

  SourceDto copyWith({
    String? id,
    String? name,
  }) {
    return SourceDto(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory SourceDto.fromJsonMap(Map<String, dynamic> map) {
    return SourceDto(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceDto.fromJsonString(String source) =>
      SourceDto.fromJsonMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Source(id: $id, name: $name)';

  @override
  bool operator ==(covariant SourceDto other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
