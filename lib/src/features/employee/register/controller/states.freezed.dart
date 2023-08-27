// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmployeeRegisterState {
  EmployeeRegisterStateStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get registerAdm => throw _privateConstructorUsedError;
  List<String> get workDays => throw _privateConstructorUsedError;
  List<int> get workHours => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmployeeRegisterStateCopyWith<EmployeeRegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeRegisterStateCopyWith<$Res> {
  factory $EmployeeRegisterStateCopyWith(EmployeeRegisterState value,
          $Res Function(EmployeeRegisterState) then) =
      _$EmployeeRegisterStateCopyWithImpl<$Res, EmployeeRegisterState>;
  @useResult
  $Res call(
      {EmployeeRegisterStateStatus status,
      String? error,
      bool registerAdm,
      List<String> workDays,
      List<int> workHours});
}

/// @nodoc
class _$EmployeeRegisterStateCopyWithImpl<$Res,
        $Val extends EmployeeRegisterState>
    implements $EmployeeRegisterStateCopyWith<$Res> {
  _$EmployeeRegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? registerAdm = null,
    Object? workDays = null,
    Object? workHours = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EmployeeRegisterStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      registerAdm: null == registerAdm
          ? _value.registerAdm
          : registerAdm // ignore: cast_nullable_to_non_nullable
              as bool,
      workDays: null == workDays
          ? _value.workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workHours: null == workHours
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmployeeRegisterStateCopyWith<$Res>
    implements $EmployeeRegisterStateCopyWith<$Res> {
  factory _$$_EmployeeRegisterStateCopyWith(_$_EmployeeRegisterState value,
          $Res Function(_$_EmployeeRegisterState) then) =
      __$$_EmployeeRegisterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmployeeRegisterStateStatus status,
      String? error,
      bool registerAdm,
      List<String> workDays,
      List<int> workHours});
}

/// @nodoc
class __$$_EmployeeRegisterStateCopyWithImpl<$Res>
    extends _$EmployeeRegisterStateCopyWithImpl<$Res, _$_EmployeeRegisterState>
    implements _$$_EmployeeRegisterStateCopyWith<$Res> {
  __$$_EmployeeRegisterStateCopyWithImpl(_$_EmployeeRegisterState _value,
      $Res Function(_$_EmployeeRegisterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? registerAdm = null,
    Object? workDays = null,
    Object? workHours = null,
  }) {
    return _then(_$_EmployeeRegisterState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EmployeeRegisterStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      registerAdm: null == registerAdm
          ? _value.registerAdm
          : registerAdm // ignore: cast_nullable_to_non_nullable
              as bool,
      workDays: null == workDays
          ? _value._workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workHours: null == workHours
          ? _value._workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_EmployeeRegisterState implements _EmployeeRegisterState {
  _$_EmployeeRegisterState(
      {this.status = EmployeeRegisterStateStatus.initial,
      this.error,
      this.registerAdm = false,
      final List<String> workDays = const [],
      final List<int> workHours = const []})
      : _workDays = workDays,
        _workHours = workHours;

  @override
  @JsonKey()
  final EmployeeRegisterStateStatus status;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool registerAdm;
  final List<String> _workDays;
  @override
  @JsonKey()
  List<String> get workDays {
    if (_workDays is EqualUnmodifiableListView) return _workDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workDays);
  }

  final List<int> _workHours;
  @override
  @JsonKey()
  List<int> get workHours {
    if (_workHours is EqualUnmodifiableListView) return _workHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workHours);
  }

  @override
  String toString() {
    return 'EmployeeRegisterState(status: $status, error: $error, registerAdm: $registerAdm, workDays: $workDays, workHours: $workHours)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeeRegisterState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.registerAdm, registerAdm) ||
                other.registerAdm == registerAdm) &&
            const DeepCollectionEquality().equals(other._workDays, _workDays) &&
            const DeepCollectionEquality()
                .equals(other._workHours, _workHours));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      error,
      registerAdm,
      const DeepCollectionEquality().hash(_workDays),
      const DeepCollectionEquality().hash(_workHours));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeRegisterStateCopyWith<_$_EmployeeRegisterState> get copyWith =>
      __$$_EmployeeRegisterStateCopyWithImpl<_$_EmployeeRegisterState>(
          this, _$identity);
}

abstract class _EmployeeRegisterState implements EmployeeRegisterState {
  factory _EmployeeRegisterState(
      {final EmployeeRegisterStateStatus status,
      final String? error,
      final bool registerAdm,
      final List<String> workDays,
      final List<int> workHours}) = _$_EmployeeRegisterState;

  @override
  EmployeeRegisterStateStatus get status;
  @override
  String? get error;
  @override
  bool get registerAdm;
  @override
  List<String> get workDays;
  @override
  List<int> get workHours;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeRegisterStateCopyWith<_$_EmployeeRegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
