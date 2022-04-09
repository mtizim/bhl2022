// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sidebarmanager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FiltersTearOff {
  const _$FiltersTearOff();

  _Filters call(
      {required int minMoney, required int maxMoney, required int persons}) {
    return _Filters(
      minMoney: minMoney,
      maxMoney: maxMoney,
      persons: persons,
    );
  }
}

/// @nodoc
const $Filters = _$FiltersTearOff();

/// @nodoc
mixin _$Filters {
// 1,2,3,4
  int get minMoney => throw _privateConstructorUsedError; // 1,2,3,4
  int get maxMoney => throw _privateConstructorUsedError; // 1,2,4,7
  int get persons => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FiltersCopyWith<Filters> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltersCopyWith<$Res> {
  factory $FiltersCopyWith(Filters value, $Res Function(Filters) then) =
      _$FiltersCopyWithImpl<$Res>;
  $Res call({int minMoney, int maxMoney, int persons});
}

/// @nodoc
class _$FiltersCopyWithImpl<$Res> implements $FiltersCopyWith<$Res> {
  _$FiltersCopyWithImpl(this._value, this._then);

  final Filters _value;
  // ignore: unused_field
  final $Res Function(Filters) _then;

  @override
  $Res call({
    Object? minMoney = freezed,
    Object? maxMoney = freezed,
    Object? persons = freezed,
  }) {
    return _then(_value.copyWith(
      minMoney: minMoney == freezed
          ? _value.minMoney
          : minMoney // ignore: cast_nullable_to_non_nullable
              as int,
      maxMoney: maxMoney == freezed
          ? _value.maxMoney
          : maxMoney // ignore: cast_nullable_to_non_nullable
              as int,
      persons: persons == freezed
          ? _value.persons
          : persons // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$FiltersCopyWith<$Res> implements $FiltersCopyWith<$Res> {
  factory _$FiltersCopyWith(_Filters value, $Res Function(_Filters) then) =
      __$FiltersCopyWithImpl<$Res>;
  @override
  $Res call({int minMoney, int maxMoney, int persons});
}

/// @nodoc
class __$FiltersCopyWithImpl<$Res> extends _$FiltersCopyWithImpl<$Res>
    implements _$FiltersCopyWith<$Res> {
  __$FiltersCopyWithImpl(_Filters _value, $Res Function(_Filters) _then)
      : super(_value, (v) => _then(v as _Filters));

  @override
  _Filters get _value => super._value as _Filters;

  @override
  $Res call({
    Object? minMoney = freezed,
    Object? maxMoney = freezed,
    Object? persons = freezed,
  }) {
    return _then(_Filters(
      minMoney: minMoney == freezed
          ? _value.minMoney
          : minMoney // ignore: cast_nullable_to_non_nullable
              as int,
      maxMoney: maxMoney == freezed
          ? _value.maxMoney
          : maxMoney // ignore: cast_nullable_to_non_nullable
              as int,
      persons: persons == freezed
          ? _value.persons
          : persons // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Filters implements _Filters {
  _$_Filters(
      {required this.minMoney, required this.maxMoney, required this.persons});

  @override // 1,2,3,4
  final int minMoney;
  @override // 1,2,3,4
  final int maxMoney;
  @override // 1,2,4,7
  final int persons;

  @override
  String toString() {
    return 'Filters(minMoney: $minMoney, maxMoney: $maxMoney, persons: $persons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Filters &&
            const DeepCollectionEquality().equals(other.minMoney, minMoney) &&
            const DeepCollectionEquality().equals(other.maxMoney, maxMoney) &&
            const DeepCollectionEquality().equals(other.persons, persons));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(minMoney),
      const DeepCollectionEquality().hash(maxMoney),
      const DeepCollectionEquality().hash(persons));

  @JsonKey(ignore: true)
  @override
  _$FiltersCopyWith<_Filters> get copyWith =>
      __$FiltersCopyWithImpl<_Filters>(this, _$identity);
}

abstract class _Filters implements Filters {
  factory _Filters(
      {required int minMoney,
      required int maxMoney,
      required int persons}) = _$_Filters;

  @override // 1,2,3,4
  int get minMoney;
  @override // 1,2,3,4
  int get maxMoney;
  @override // 1,2,4,7
  int get persons;
  @override
  @JsonKey(ignore: true)
  _$FiltersCopyWith<_Filters> get copyWith =>
      throw _privateConstructorUsedError;
}
