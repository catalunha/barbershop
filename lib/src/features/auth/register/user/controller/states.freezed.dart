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
mixin _$UserRegisterState {
  UserRegisterStateStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRegisterStateCopyWith<UserRegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterStateCopyWith<$Res> {
  factory $UserRegisterStateCopyWith(
          UserRegisterState value, $Res Function(UserRegisterState) then) =
      _$UserRegisterStateCopyWithImpl<$Res, UserRegisterState>;
  @useResult
  $Res call({UserRegisterStateStatus status, String? error});
}

/// @nodoc
class _$UserRegisterStateCopyWithImpl<$Res, $Val extends UserRegisterState>
    implements $UserRegisterStateCopyWith<$Res> {
  _$UserRegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserRegisterStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRegisterStateCopyWith<$Res>
    implements $UserRegisterStateCopyWith<$Res> {
  factory _$$_UserRegisterStateCopyWith(_$_UserRegisterState value,
          $Res Function(_$_UserRegisterState) then) =
      __$$_UserRegisterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserRegisterStateStatus status, String? error});
}

/// @nodoc
class __$$_UserRegisterStateCopyWithImpl<$Res>
    extends _$UserRegisterStateCopyWithImpl<$Res, _$_UserRegisterState>
    implements _$$_UserRegisterStateCopyWith<$Res> {
  __$$_UserRegisterStateCopyWithImpl(
      _$_UserRegisterState _value, $Res Function(_$_UserRegisterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$_UserRegisterState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserRegisterStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserRegisterState implements _UserRegisterState {
  _$_UserRegisterState(
      {this.status = UserRegisterStateStatus.initial, this.error});

  @override
  @JsonKey()
  final UserRegisterStateStatus status;
  @override
  final String? error;

  @override
  String toString() {
    return 'UserRegisterState(status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRegisterState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRegisterStateCopyWith<_$_UserRegisterState> get copyWith =>
      __$$_UserRegisterStateCopyWithImpl<_$_UserRegisterState>(
          this, _$identity);
}

abstract class _UserRegisterState implements UserRegisterState {
  factory _UserRegisterState(
      {final UserRegisterStateStatus status,
      final String? error}) = _$_UserRegisterState;

  @override
  UserRegisterStateStatus get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_UserRegisterStateCopyWith<_$_UserRegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}