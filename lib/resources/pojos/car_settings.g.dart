// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarSettings _$CarSettingsFromJson(Map<String, dynamic> json) {
  return CarSettings(
    json['image'] as String,
    (json['cost'] as num)?.toDouble(),
    json['year'] as int,
  );
}

Map<String, dynamic> _$CarSettingsToJson(CarSettings instance) =>
    <String, dynamic>{
      'image': instance.image,
      'cost': instance.cost,
      'year': instance.year,
    };
