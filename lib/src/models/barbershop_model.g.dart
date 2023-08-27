// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barbershop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BarbershopModel _$$_BarbershopModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'email', 'opening_days', 'opening_hours'],
  );
  return _$_BarbershopModel(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    openingDays: (json['opening_days'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    openingHours:
        (json['opening_hours'] as List<dynamic>).map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$$_BarbershopModelToJson(_$_BarbershopModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'opening_days': instance.openingDays,
      'opening_hours': instance.openingHours,
    };
