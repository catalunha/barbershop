// Criacao do BarbershopModel Aula Dia2Parte2 23min
import 'package:freezed_annotation/freezed_annotation.dart';

part 'barbershop_model.freezed.dart';
part 'barbershop_model.g.dart';

@freezed
abstract class BarbershopModel with _$BarbershopModel {
  @JsonKey(includeIfNull: false)
  factory BarbershopModel({
    required int id,
    @JsonKey(required: true) required String name,
    @JsonKey(required: true) required String email,
    @JsonKey(name: 'opening_days', required: true)
    required List<String> openingDays,
    @JsonKey(name: 'opening_hours', required: true)
    required List<int> openingHours,
  }) = _BarbershopModel;
  factory BarbershopModel.fromJson(Map<String, dynamic> json) =>
      _$BarbershopModelFromJson(json);
}



/*
part 'user_model.freezed.dart';
// part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  @JsonKey(includeIfNull: false)
  factory UserModel({
    required int id,
    required String name,
    required String email,
    List<String>? workDays,
    List<int>? workHours,
    String? avatar,
  }) = _UserModel;
}
*/