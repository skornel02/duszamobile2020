// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_vignette.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EVignette _$EVignetteFromJson(Map<String, dynamic> json) {
  return EVignette(
    json['id'] as String,
    json['start'] == null ? null : DateTime.parse(json['start'] as String),
    json['duration'] as int,
    json['area'] as String,
  );
}

Map<String, dynamic> _$EVignetteToJson(EVignette instance) => <String, dynamic>{
      'id': instance.id,
      'start': instance.start?.toIso8601String(),
      'duration': instance.duration,
      'area': instance.area,
    };
