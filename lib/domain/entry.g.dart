// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return Entity(
    json['title'] as String,
    json['url'] as String,
    (json['aspectRatio'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'aspectRatio': instance.aspectRatio,
    };
