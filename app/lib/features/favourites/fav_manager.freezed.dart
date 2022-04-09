// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fav_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FavouritesStateTearOff {
  const _$FavouritesStateTearOff();

  FavouritesStateLoading loading() {
    return const FavouritesStateLoading();
  }

  FavouritesStateReady ready({required List<CardData> data}) {
    return FavouritesStateReady(
      data: data,
    );
  }
}

/// @nodoc
const $FavouritesState = _$FavouritesStateTearOff();

/// @nodoc
mixin _$FavouritesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CardData> data) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavouritesStateLoading value) loading,
    required TResult Function(FavouritesStateReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavouritesStateLoading value)? loading,
    TResult Function(FavouritesStateReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavouritesStateLoading value)? loading,
    TResult Function(FavouritesStateReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesStateCopyWith<$Res> {
  factory $FavouritesStateCopyWith(
          FavouritesState value, $Res Function(FavouritesState) then) =
      _$FavouritesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavouritesStateCopyWithImpl<$Res>
    implements $FavouritesStateCopyWith<$Res> {
  _$FavouritesStateCopyWithImpl(this._value, this._then);

  final FavouritesState _value;
  // ignore: unused_field
  final $Res Function(FavouritesState) _then;
}

/// @nodoc
abstract class $FavouritesStateLoadingCopyWith<$Res> {
  factory $FavouritesStateLoadingCopyWith(FavouritesStateLoading value,
          $Res Function(FavouritesStateLoading) then) =
      _$FavouritesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavouritesStateLoadingCopyWithImpl<$Res>
    extends _$FavouritesStateCopyWithImpl<$Res>
    implements $FavouritesStateLoadingCopyWith<$Res> {
  _$FavouritesStateLoadingCopyWithImpl(FavouritesStateLoading _value,
      $Res Function(FavouritesStateLoading) _then)
      : super(_value, (v) => _then(v as FavouritesStateLoading));

  @override
  FavouritesStateLoading get _value => super._value as FavouritesStateLoading;
}

/// @nodoc

class _$FavouritesStateLoading implements FavouritesStateLoading {
  const _$FavouritesStateLoading();

  @override
  String toString() {
    return 'FavouritesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavouritesStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CardData> data) ready,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data)? ready,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data)? ready,
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
    required TResult Function(FavouritesStateLoading value) loading,
    required TResult Function(FavouritesStateReady value) ready,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavouritesStateLoading value)? loading,
    TResult Function(FavouritesStateReady value)? ready,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavouritesStateLoading value)? loading,
    TResult Function(FavouritesStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavouritesStateLoading implements FavouritesState {
  const factory FavouritesStateLoading() = _$FavouritesStateLoading;
}

/// @nodoc
abstract class $FavouritesStateReadyCopyWith<$Res> {
  factory $FavouritesStateReadyCopyWith(FavouritesStateReady value,
          $Res Function(FavouritesStateReady) then) =
      _$FavouritesStateReadyCopyWithImpl<$Res>;
  $Res call({List<CardData> data});
}

/// @nodoc
class _$FavouritesStateReadyCopyWithImpl<$Res>
    extends _$FavouritesStateCopyWithImpl<$Res>
    implements $FavouritesStateReadyCopyWith<$Res> {
  _$FavouritesStateReadyCopyWithImpl(
      FavouritesStateReady _value, $Res Function(FavouritesStateReady) _then)
      : super(_value, (v) => _then(v as FavouritesStateReady));

  @override
  FavouritesStateReady get _value => super._value as FavouritesStateReady;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(FavouritesStateReady(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CardData>,
    ));
  }
}

/// @nodoc

class _$FavouritesStateReady implements FavouritesStateReady {
  const _$FavouritesStateReady({required this.data});

  @override
  final List<CardData> data;

  @override
  String toString() {
    return 'FavouritesState.ready(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavouritesStateReady &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $FavouritesStateReadyCopyWith<FavouritesStateReady> get copyWith =>
      _$FavouritesStateReadyCopyWithImpl<FavouritesStateReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CardData> data) ready,
  }) {
    return ready(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data)? ready,
  }) {
    return ready?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CardData> data)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavouritesStateLoading value) loading,
    required TResult Function(FavouritesStateReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavouritesStateLoading value)? loading,
    TResult Function(FavouritesStateReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavouritesStateLoading value)? loading,
    TResult Function(FavouritesStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class FavouritesStateReady implements FavouritesState {
  const factory FavouritesStateReady({required List<CardData> data}) =
      _$FavouritesStateReady;

  List<CardData> get data;
  @JsonKey(ignore: true)
  $FavouritesStateReadyCopyWith<FavouritesStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}
