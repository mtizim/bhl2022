// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cardmanager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CardManagerStateTearOff {
  const _$CardManagerStateTearOff();

  CardManagerLoadingstate loading() {
    return const CardManagerLoadingstate();
  }

  CardManagerLoadedState loaded(
      {required List<CardData> data, required int offset}) {
    return CardManagerLoadedState(
      data: data,
      offset: offset,
    );
  }
}

/// @nodoc
const $CardManagerState = _$CardManagerStateTearOff();

/// @nodoc
mixin _$CardManagerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CardData> data, int offset) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data, int offset)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data, int offset)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardManagerLoadingstate value) loading,
    required TResult Function(CardManagerLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CardManagerLoadingstate value)? loading,
    TResult Function(CardManagerLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardManagerLoadingstate value)? loading,
    TResult Function(CardManagerLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardManagerStateCopyWith<$Res> {
  factory $CardManagerStateCopyWith(
          CardManagerState value, $Res Function(CardManagerState) then) =
      _$CardManagerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CardManagerStateCopyWithImpl<$Res>
    implements $CardManagerStateCopyWith<$Res> {
  _$CardManagerStateCopyWithImpl(this._value, this._then);

  final CardManagerState _value;
  // ignore: unused_field
  final $Res Function(CardManagerState) _then;
}

/// @nodoc
abstract class $CardManagerLoadingstateCopyWith<$Res> {
  factory $CardManagerLoadingstateCopyWith(CardManagerLoadingstate value,
          $Res Function(CardManagerLoadingstate) then) =
      _$CardManagerLoadingstateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CardManagerLoadingstateCopyWithImpl<$Res>
    extends _$CardManagerStateCopyWithImpl<$Res>
    implements $CardManagerLoadingstateCopyWith<$Res> {
  _$CardManagerLoadingstateCopyWithImpl(CardManagerLoadingstate _value,
      $Res Function(CardManagerLoadingstate) _then)
      : super(_value, (v) => _then(v as CardManagerLoadingstate));

  @override
  CardManagerLoadingstate get _value => super._value as CardManagerLoadingstate;
}

/// @nodoc

class _$CardManagerLoadingstate implements CardManagerLoadingstate {
  const _$CardManagerLoadingstate();

  @override
  String toString() {
    return 'CardManagerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CardManagerLoadingstate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CardData> data, int offset) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data, int offset)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data, int offset)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardManagerLoadingstate value) loading,
    required TResult Function(CardManagerLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CardManagerLoadingstate value)? loading,
    TResult Function(CardManagerLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardManagerLoadingstate value)? loading,
    TResult Function(CardManagerLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CardManagerLoadingstate implements CardManagerState {
  const factory CardManagerLoadingstate() = _$CardManagerLoadingstate;
}

/// @nodoc
abstract class $CardManagerLoadedStateCopyWith<$Res> {
  factory $CardManagerLoadedStateCopyWith(CardManagerLoadedState value,
          $Res Function(CardManagerLoadedState) then) =
      _$CardManagerLoadedStateCopyWithImpl<$Res>;
  $Res call({List<CardData> data, int offset});
}

/// @nodoc
class _$CardManagerLoadedStateCopyWithImpl<$Res>
    extends _$CardManagerStateCopyWithImpl<$Res>
    implements $CardManagerLoadedStateCopyWith<$Res> {
  _$CardManagerLoadedStateCopyWithImpl(CardManagerLoadedState _value,
      $Res Function(CardManagerLoadedState) _then)
      : super(_value, (v) => _then(v as CardManagerLoadedState));

  @override
  CardManagerLoadedState get _value => super._value as CardManagerLoadedState;

  @override
  $Res call({
    Object? data = freezed,
    Object? offset = freezed,
  }) {
    return _then(CardManagerLoadedState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CardData>,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CardManagerLoadedState implements CardManagerLoadedState {
  const _$CardManagerLoadedState({required this.data, required this.offset});

  @override
  final List<CardData> data;
  @override
  final int offset;

  @override
  String toString() {
    return 'CardManagerState.loaded(data: $data, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardManagerLoadedState &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.offset, offset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(offset));

  @JsonKey(ignore: true)
  @override
  $CardManagerLoadedStateCopyWith<CardManagerLoadedState> get copyWith =>
      _$CardManagerLoadedStateCopyWithImpl<CardManagerLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CardData> data, int offset) loaded,
  }) {
    return loaded(data, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data, int offset)? loaded,
  }) {
    return loaded?.call(data, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data, int offset)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardManagerLoadingstate value) loading,
    required TResult Function(CardManagerLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CardManagerLoadingstate value)? loading,
    TResult Function(CardManagerLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardManagerLoadingstate value)? loading,
    TResult Function(CardManagerLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CardManagerLoadedState implements CardManagerState {
  const factory CardManagerLoadedState(
      {required List<CardData> data,
      required int offset}) = _$CardManagerLoadedState;

  List<CardData> get data;
  int get offset;
  @JsonKey(ignore: true)
  $CardManagerLoadedStateCopyWith<CardManagerLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CardDataTearOff {
  const _$CardDataTearOff();

  _CardData call(
      {required int minCapacity,
      required int cost,
      required String address,
      required List<String> tags,
      required String name,
      required String description,
      required Uri imageLink}) {
    return _CardData(
      minCapacity: minCapacity,
      cost: cost,
      address: address,
      tags: tags,
      name: name,
      description: description,
      imageLink: imageLink,
    );
  }
}

/// @nodoc
const $CardData = _$CardDataTearOff();

/// @nodoc
mixin _$CardData {
  int get minCapacity => throw _privateConstructorUsedError;
  int get cost => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Uri get imageLink => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardDataCopyWith<CardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDataCopyWith<$Res> {
  factory $CardDataCopyWith(CardData value, $Res Function(CardData) then) =
      _$CardDataCopyWithImpl<$Res>;
  $Res call(
      {int minCapacity,
      int cost,
      String address,
      List<String> tags,
      String name,
      String description,
      Uri imageLink});
}

/// @nodoc
class _$CardDataCopyWithImpl<$Res> implements $CardDataCopyWith<$Res> {
  _$CardDataCopyWithImpl(this._value, this._then);

  final CardData _value;
  // ignore: unused_field
  final $Res Function(CardData) _then;

  @override
  $Res call({
    Object? minCapacity = freezed,
    Object? cost = freezed,
    Object? address = freezed,
    Object? tags = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageLink = freezed,
  }) {
    return _then(_value.copyWith(
      minCapacity: minCapacity == freezed
          ? _value.minCapacity
          : minCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc
abstract class _$CardDataCopyWith<$Res> implements $CardDataCopyWith<$Res> {
  factory _$CardDataCopyWith(_CardData value, $Res Function(_CardData) then) =
      __$CardDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int minCapacity,
      int cost,
      String address,
      List<String> tags,
      String name,
      String description,
      Uri imageLink});
}

/// @nodoc
class __$CardDataCopyWithImpl<$Res> extends _$CardDataCopyWithImpl<$Res>
    implements _$CardDataCopyWith<$Res> {
  __$CardDataCopyWithImpl(_CardData _value, $Res Function(_CardData) _then)
      : super(_value, (v) => _then(v as _CardData));

  @override
  _CardData get _value => super._value as _CardData;

  @override
  $Res call({
    Object? minCapacity = freezed,
    Object? cost = freezed,
    Object? address = freezed,
    Object? tags = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageLink = freezed,
  }) {
    return _then(_CardData(
      minCapacity: minCapacity == freezed
          ? _value.minCapacity
          : minCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_CardData implements _CardData {
  _$_CardData(
      {required this.minCapacity,
      required this.cost,
      required this.address,
      required this.tags,
      required this.name,
      required this.description,
      required this.imageLink});

  @override
  final int minCapacity;
  @override
  final int cost;
  @override
  final String address;
  @override
  final List<String> tags;
  @override
  final String name;
  @override
  final String description;
  @override
  final Uri imageLink;

  @override
  String toString() {
    return 'CardData(minCapacity: $minCapacity, cost: $cost, address: $address, tags: $tags, name: $name, description: $description, imageLink: $imageLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CardData &&
            const DeepCollectionEquality()
                .equals(other.minCapacity, minCapacity) &&
            const DeepCollectionEquality().equals(other.cost, cost) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.imageLink, imageLink));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(minCapacity),
      const DeepCollectionEquality().hash(cost),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(imageLink));

  @JsonKey(ignore: true)
  @override
  _$CardDataCopyWith<_CardData> get copyWith =>
      __$CardDataCopyWithImpl<_CardData>(this, _$identity);
}

abstract class _CardData implements CardData {
  factory _CardData(
      {required int minCapacity,
      required int cost,
      required String address,
      required List<String> tags,
      required String name,
      required String description,
      required Uri imageLink}) = _$_CardData;

  @override
  int get minCapacity;
  @override
  int get cost;
  @override
  String get address;
  @override
  List<String> get tags;
  @override
  String get name;
  @override
  String get description;
  @override
  Uri get imageLink;
  @override
  @JsonKey(ignore: true)
  _$CardDataCopyWith<_CardData> get copyWith =>
      throw _privateConstructorUsedError;
}
