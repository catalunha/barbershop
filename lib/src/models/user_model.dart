import 'package:freezed_annotation/freezed_annotation.dart';

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
sealed class UserModel {
  final int id;
  final String name;
  final String email;
  final String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return switch (json['profile']) {
      'ADM' => UserModelAdm.fromMap(json),
      'EMPLOYEE' => UserModelEmployee.fromMap(json),
      _ => throw ArgumentError('Json inválido')
    };
  }
}

class UserModelAdm extends UserModel {
  final List<String>? workDays;
  final List<int>? workHours;
  UserModelAdm({
    this.workDays,
    this.workHours,
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
  });
  factory UserModelAdm.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'email': String email,
      } =>
        UserModelAdm(
          id: id,
          name: name,
          email: email,
          workDays: json['work_days']?.cast<String>(),
          workHours: json['work_hours']?.cast<int>(),
          avatar: json['avatar'],
        ),
      _ => throw ArgumentError('Json Inválido')
    };
  }
}

class UserModelEmployee extends UserModel {
  final int barbershopId;
  final List<String> workDays;
  final List<int> workHours;
  UserModelEmployee({
    required this.barbershopId,
    required this.workDays,
    required this.workHours,
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
  });
  factory UserModelEmployee.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'email': String email,
        'barbershopId': int barbershopId,
        'work_days': List<String> workDays,
        'work_hours': List<String> workHours,
      } =>
        UserModelEmployee(
          id: id,
          name: name,
          email: email,
          barbershopId: barbershopId,
          workDays: workDays.cast<String>(),
          workHours: workHours.cast<int>(),
          avatar: json['avatar'],
        ),
      _ => throw ArgumentError('Json Inválido')
    };
  }
}
/*
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anamnese_group_model.freezed.dart';
part 'anamnese_group_model.g.dart';

@freezed
abstract class AnamneseGroupModel with _$AnamneseGroupModel {
  factory AnamneseGroupModel({
    @JsonKey(includeIfNull: false) String? id,
    required String name,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'order_of_questions', includeIfNull: false)
    @Default([])
    List<String> orderOfQuestions,
  }) = _AnamneseGroupModel;
  factory AnamneseGroupModel.fromJson(Map<String, dynamic> json) =>
      _$AnamneseGroupModelFromJson(json);
}

*/