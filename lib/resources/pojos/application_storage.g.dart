// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationStorage _$ApplicationStorageFromJson(Map<String, dynamic> json) {
  return ApplicationStorage(
    (json['cars'] as List)
        ?.map((e) => e == null ? null : Car.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['selectedCar'] as String,
    json['lang'] as String,
    json['darkMode'] as bool,
    json['accountStatus'] as String,
  );
}

Map<String, dynamic> _$ApplicationStorageToJson(ApplicationStorage instance) =>
    <String, dynamic>{
      'cars': instance.cars,
      'selectedCar': instance.selectedCar,
      'lang': instance.lang,
      'darkMode': instance.darkMode,
      'accountStatus': instance.accountStatus,
    };
