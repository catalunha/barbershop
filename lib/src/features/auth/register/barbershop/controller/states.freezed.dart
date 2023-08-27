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
mixin _$BarbershopRegisterState {
  BarbershopRegisterStateStatus get status =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<String> get openingDays => throw _privateConstructorUsedError;
  List<int> get openingHours => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BarbershopRegisterStateCopyWith<BarbershopRegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarbershopRegisterStateCopyWith<$Res> {
  factory $BarbershopRegisterStateCopyWith(BarbershopRegisterState value,
          $Res Function(BarbershopRegisterState) then) =
      _$BarbershopRegisterStateCopyWithImpl<$Res, BarbershopRegisterState>;
  @useResult
  $Res call(
      {BarbershopRegisterStateStatus status,
      String? error,
      List<String> openingDays,
      List<int> openingHours});
}

/// @nodoc
class _$BarbershopRegisterStateCopyWithImpl<$Res,
        $Val extends BarbershopRegisterState>
    implements $BarbershopRegisterStateCopyWith<$Res> {
  _$BarbershopRegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? openingDays = null,
    Object? openingHours = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BarbershopRegisterStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      openingDays: null == openingDays
          ? _value.openingDays
          : openingDays // ignore: cast_nullable_to_non_nullable
              as List<String>,
      openingHours: null == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BarbershopRegisterStateCopyWith<$Res>
    implements $BarbershopRegisterStateCopyWith<$Res> {
  factory _$$_BarbershopRegisterStateCopyWith(_$_BarbershopRegisterState value,
          $Res Function(_$_BarbershopRegisterState) then) =
      __$$_BarbershopRegisterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BarbershopRegisterStateStatus status,
      String? error,
      List<String> openingDays,
      List<int> openingHours});
}

/// @nodoc
class __$$_BarbershopRegisterStateCopyWithImpl<$Res>
    extends _$BarbershopRegisterStateCopyWithImpl<$Res,
        _$_BarbershopRegisterState>
    implements _$$_BarbershopRegisterStateCopyWith<$Res> {
  __$$_BarbershopRegisterStateCopyWithImpl(_$_BarbershopRegisterState _value,
      $Res Function(_$_BarbershopRegisterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? openingDays = null,
    Object? openingHours = null,
  }) {
    return _then(_$_BarbershopRegisterState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BarbershopRegisterStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      openingDays: null == openingDays
          ? _value._openingDays
          : openingDays // ignore: cast_nullable_to_non_nullable
              as List<String>,
      openingHours: null == openingHours
          ? _value._openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_BarbershopRegisterState implements _BarbershopRegisterState {
  _$_BarbershopRegisterState(
      {this.status = BarbershopRegisterStateStatus.initial,
      this.error,
      final List<String> openingDays = const [],
      final List<int> openingHours = const []})
      : _openingDays = openingDays,
        _openingHours = openingHours;

  @override
  @JsonKey()
  final BarbershopRegisterStateStatus status;
  @override
  final String? error;
  final List<String> _openingDays;
  @override
  @JsonKey()
  List<String> get openingDays {
    if (_openingDays is EqualUnmodifiableListView) return _openingDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openingDays);
  }

  final List<int> _openingHours;
  @override
  @JsonKey()
  List<int> get openingHours {
    if (_openingHours is EqualUnmodifiableListView) return _openingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openingHours);
  }

  @override
  String toString() {
    return 'BarbershopRegisterState(status: $status, error: $error, openingDays: $openingDays, openingHours: $openingHours)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BarbershopRegisterState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._openingDays, _openingDays) &&
            const DeepCollectionEquality()
                .equals(other._openingHours, _openingHours));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      error,
      const DeepCollectionEquality().hash(_openingDays),
      const DeepCollectionEquality().hash(_openingHours));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BarbershopRegisterStateCopyWith<_$_BarbershopRegisterState>
      get copyWith =>
          __$$_BarbershopRegisterStateCopyWithImpl<_$_BarbershopRegisterState>(
              this, _$identity);
}

abstract class _BarbershopRegisterState implements BarbershopRegisterState {
  factory _BarbershopRegisterState(
      {final BarbershopRegisterStateStatus status,
      final String? error,
      final List<String> openingDays,
      final List<int> openingHours}) = _$_BarbershopRegisterState;

  @override
  BarbershopRegisterStateStatus get status;
  @override
  String? get error;
  @override
  List<String> get openingDays;
  @override
  List<int> get openingHours;
  @override
  @JsonKey(ignore: true)
  _$$_BarbershopRegisterStateCopyWith<_$_BarbershopRegisterState>
      get copyWith => throw _privateConstructorUsedError;
}
