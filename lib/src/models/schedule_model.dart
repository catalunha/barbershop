import 'dart:convert';

// Criacao do ScheduleModel Aula Dia6Parte1 3min
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'schedule_model.freezed.dart';
// part 'schedule_model.g.dart';

// @freezed
// abstract class ScheduleModel with _$ScheduleModel {
//   @JsonKey(includeIfNull: false)
//   factory ScheduleModel({
//     required int id,
//     @JsonKey(name: 'barbershop_id') required int barbershopId,
//     @JsonKey(name: 'user_id') required int userId,
//     @JsonKey(name: 'client_name') required String clientName,
//     required DateTime date,
//     required int hour,
//   }) = _ScheduleModel;
//   factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
//       _$ScheduleModelFromJson(json);
// }

class ScheduleModel {
  final int id;
  final int barbershopId;
  final int userId;
  final String clientName;
  final DateTime date;
  final int hour;
  ScheduleModel({
    required this.id,
    required this.barbershopId,
    required this.userId,
    required this.clientName,
    required this.date,
    required this.hour,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': int id,
          'barbershop_id': int barbershopId,
          'user_id': int userId,
          'client_name': String clientName,
          'date': String date,
          'time': int hour,
        }:
        return ScheduleModel(
            id: id,
            barbershopId: barbershopId,
            userId: userId,
            clientName: clientName,
            date: DateTime.parse(date),
            hour: hour);
      case _:
        throw ArgumentError('Invalid json in ScheduleModel.fromJson');
    }
  }
}
