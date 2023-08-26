// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barbershop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BarbershopModel _$BarbershopModelFromJson(Map<String, dynamic> json) {
  return _BarbershopModel.fromJson(json);
}

/// @nodoc
mixin _$BarbershopModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(required: true)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(required: true)
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_days', required: true)
  List<String> get openingDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_hours', required: true)
  List<int> get openingHours => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarbershopModelCopyWith<BarbershopModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarbershopModelCopyWith<$Res> {
  factory $BarbershopModelCopyWith(
          BarbershopModel value, $Res Function(BarbershopModel) then) =
      _$BarbershopModelCopyWithImpl<$Res, BarbershopModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(required: true) String name,
      @JsonKey(required: true) String email,
      @JsonKey(name: 'opening_days', required: true) List<String> openingDays,
      @JsonKey(name: 'opening_hours', required: true) List<int> openingHours});
}

/// @nodoc
class _$BarbershopModelCopyWithImpl<$Res, $Val extends BarbershopModel>
    implements $BarbershopModelCopyWith<$Res> {
  _$BarbershopModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? email = null,
    Object? openingDays = null,
    Object? openingHours = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_BarbershopModelCopyWith<$Res>
    implements $BarbershopModelCopyWith<$Res> {
  factory _$$_BarbershopModelCopyWith(
          _$_BarbershopModel value, $Res Function(_$_BarbershopModel) then) =
      __$$_BarbershopModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(required: true) String name,
      @JsonKey(required: true) String email,
      @JsonKey(name: 'opening_days', required: true) List<String> openingDays,
      @JsonKey(name: 'opening_hours', required: true) List<int> openingHours});
}

/// @nodoc
class __$$_BarbershopModelCopyWithImpl<$Res>
    extends _$BarbershopModelCopyWithImpl<$Res, _$_BarbershopModel>
    implements _$$_BarbershopModelCopyWith<$Res> {
  __$$_BarbershopModelCopyWithImpl(
      _$_BarbershopModel _value, $Res Function(_$_BarbershopModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? email = null,
    Object? openingDays = null,
    Object? openingHours = null,
  }) {
    return _then(_$_BarbershopModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
@JsonKey(includeIfNull: false)
class _$_BarbershopModel implements _BarbershopModel {
  _$_BarbershopModel(
      {this.id,
      @JsonKey(required: true) required this.name,
      @JsonKey(required: true) required this.email,
      @JsonKey(name: 'opening_days', required: true)
      required final List<String> openingDays,
      @JsonKey(name: 'opening_hours', required: true)
      required final List<int> openingHours})
      : _openingDays = openingDays,
        _openingHours = openingHours;

  factory _$_BarbershopModel.fromJson(Map<String, dynamic> json) =>
      _$$_BarbershopModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(required: true)
  final String name;
  @override
  @JsonKey(required: true)
  final String email;
  final List<String> _openingDays;
  @override
  @JsonKey(name: 'opening_days', required: true)
  List<String> get openingDays {
    if (_openingDays is EqualUnmodifiableListView) return _openingDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openingDays);
  }

  final List<int> _openingHours;
  @override
  @JsonKey(name: 'opening_hours', required: true)
  List<int> get openingHours {
    if (_openingHours is EqualUnmodifiableListView) return _openingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openingHours);
  }

  @override
  String toString() {
    return 'BarbershopModel(id: $id, name: $name, email: $email, openingDays: $openingDays, openingHours: $openingHours)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BarbershopModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._openingDays, _openingDays) &&
            const DeepCollectionEquality()
                .equals(other._openingHours, _openingHours));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      const DeepCollectionEquality().hash(_openingDays),
      const DeepCollectionEquality().hash(_openingHours));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BarbershopModelCopyWith<_$_BarbershopModel> get copyWith =>
      __$$_BarbershopModelCopyWithImpl<_$_BarbershopModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BarbershopModelToJson(
      this,
    );
  }
}

abstract class _BarbershopModel implements BarbershopModel {
  factory _BarbershopModel(
      {final int? id,
      @JsonKey(required: true) required final String name,
      @JsonKey(required: true) required final String email,
      @JsonKey(name: 'opening_days', required: true)
      required final List<String> openingDays,
      @JsonKey(name: 'opening_hours', required: true)
      required final List<int> openingHours}) = _$_BarbershopModel;

  factory _BarbershopModel.fromJson(Map<String, dynamic> json) =
      _$_BarbershopModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(required: true)
  String get name;
  @override
  @JsonKey(required: true)
  String get email;
  @override
  @JsonKey(name: 'opening_days', required: true)
  List<String> get openingDays;
  @override
  @JsonKey(name: 'opening_hours', required: true)
  List<int> get openingHours;
  @override
  @JsonKey(ignore: true)
  _$$_BarbershopModelCopyWith<_$_BarbershopModel> get copyWith =>
      throw _privateConstructorUsedError;
}
