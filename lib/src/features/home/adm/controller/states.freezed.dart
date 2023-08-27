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
mixin _$HomeAdmState {
  HomeAdmStateStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<UserModel> get employees => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeAdmStateCopyWith<HomeAdmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeAdmStateCopyWith<$Res> {
  factory $HomeAdmStateCopyWith(
          HomeAdmState value, $Res Function(HomeAdmState) then) =
      _$HomeAdmStateCopyWithImpl<$Res, HomeAdmState>;
  @useResult
  $Res call(
      {HomeAdmStateStatus status, String? error, List<UserModel> employees});
}

/// @nodoc
class _$HomeAdmStateCopyWithImpl<$Res, $Val extends HomeAdmState>
    implements $HomeAdmStateCopyWith<$Res> {
  _$HomeAdmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? employees = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeAdmStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeAdmStateCopyWith<$Res>
    implements $HomeAdmStateCopyWith<$Res> {
  factory _$$_HomeAdmStateCopyWith(
          _$_HomeAdmState value, $Res Function(_$_HomeAdmState) then) =
      __$$_HomeAdmStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomeAdmStateStatus status, String? error, List<UserModel> employees});
}

/// @nodoc
class __$$_HomeAdmStateCopyWithImpl<$Res>
    extends _$HomeAdmStateCopyWithImpl<$Res, _$_HomeAdmState>
    implements _$$_HomeAdmStateCopyWith<$Res> {
  __$$_HomeAdmStateCopyWithImpl(
      _$_HomeAdmState _value, $Res Function(_$_HomeAdmState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? employees = null,
  }) {
    return _then(_$_HomeAdmState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeAdmStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      employees: null == employees
          ? _value._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc

class _$_HomeAdmState implements _HomeAdmState {
  _$_HomeAdmState(
      {this.status = HomeAdmStateStatus.initial,
      this.error,
      final List<UserModel> employees = const []})
      : _employees = employees;

  @override
  @JsonKey()
  final HomeAdmStateStatus status;
  @override
  final String? error;
  final List<UserModel> _employees;
  @override
  @JsonKey()
  List<UserModel> get employees {
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employees);
  }

  @override
  String toString() {
    return 'HomeAdmState(status: $status, error: $error, employees: $employees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeAdmState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error,
      const DeepCollectionEquality().hash(_employees));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeAdmStateCopyWith<_$_HomeAdmState> get copyWith =>
      __$$_HomeAdmStateCopyWithImpl<_$_HomeAdmState>(this, _$identity);
}

abstract class _HomeAdmState implements HomeAdmState {
  factory _HomeAdmState(
      {final HomeAdmStateStatus status,
      final String? error,
      final List<UserModel> employees}) = _$_HomeAdmState;

  @override
  HomeAdmStateStatus get status;
  @override
  String? get error;
  @override
  List<UserModel> get employees;
  @override
  @JsonKey(ignore: true)
  _$$_HomeAdmStateCopyWith<_$_HomeAdmState> get copyWith =>
      throw _privateConstructorUsedError;
}
