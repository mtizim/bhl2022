// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginViewStateTearOff {
  const _$LoginViewStateTearOff();

  LoginLoginViewState login(String? error, bool loading) {
    return LoginLoginViewState(
      error,
      loading,
    );
  }

  RegisterViewState register(String? error, bool loading) {
    return RegisterViewState(
      error,
      loading,
    );
  }
}

/// @nodoc
const $LoginViewState = _$LoginViewStateTearOff();

/// @nodoc
mixin _$LoginViewState {
  String? get error => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error, bool loading) login,
    required TResult Function(String? error, bool loading) register,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? error, bool loading)? login,
    TResult Function(String? error, bool loading)? register,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error, bool loading)? login,
    TResult Function(String? error, bool loading)? register,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoginViewState value) login,
    required TResult Function(RegisterViewState value) register,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginLoginViewState value)? login,
    TResult Function(RegisterViewState value)? register,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoginViewState value)? login,
    TResult Function(RegisterViewState value)? register,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginViewStateCopyWith<LoginViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginViewStateCopyWith<$Res> {
  factory $LoginViewStateCopyWith(
          LoginViewState value, $Res Function(LoginViewState) then) =
      _$LoginViewStateCopyWithImpl<$Res>;
  $Res call({String? error, bool loading});
}

/// @nodoc
class _$LoginViewStateCopyWithImpl<$Res>
    implements $LoginViewStateCopyWith<$Res> {
  _$LoginViewStateCopyWithImpl(this._value, this._then);

  final LoginViewState _value;
  // ignore: unused_field
  final $Res Function(LoginViewState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class $LoginLoginViewStateCopyWith<$Res>
    implements $LoginViewStateCopyWith<$Res> {
  factory $LoginLoginViewStateCopyWith(
          LoginLoginViewState value, $Res Function(LoginLoginViewState) then) =
      _$LoginLoginViewStateCopyWithImpl<$Res>;
  @override
  $Res call({String? error, bool loading});
}

/// @nodoc
class _$LoginLoginViewStateCopyWithImpl<$Res>
    extends _$LoginViewStateCopyWithImpl<$Res>
    implements $LoginLoginViewStateCopyWith<$Res> {
  _$LoginLoginViewStateCopyWithImpl(
      LoginLoginViewState _value, $Res Function(LoginLoginViewState) _then)
      : super(_value, (v) => _then(v as LoginLoginViewState));

  @override
  LoginLoginViewState get _value => super._value as LoginLoginViewState;

  @override
  $Res call({
    Object? error = freezed,
    Object? loading = freezed,
  }) {
    return _then(LoginLoginViewState(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginLoginViewState implements LoginLoginViewState {
  const _$LoginLoginViewState(this.error, this.loading);

  @override
  final String? error;
  @override
  final bool loading;

  @override
  String toString() {
    return 'LoginViewState.login(error: $error, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginLoginViewState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  $LoginLoginViewStateCopyWith<LoginLoginViewState> get copyWith =>
      _$LoginLoginViewStateCopyWithImpl<LoginLoginViewState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error, bool loading) login,
    required TResult Function(String? error, bool loading) register,
  }) {
    return login(error, loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? error, bool loading)? login,
    TResult Function(String? error, bool loading)? register,
  }) {
    return login?.call(error, loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error, bool loading)? login,
    TResult Function(String? error, bool loading)? register,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(error, loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoginViewState value) login,
    required TResult Function(RegisterViewState value) register,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginLoginViewState value)? login,
    TResult Function(RegisterViewState value)? register,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoginViewState value)? login,
    TResult Function(RegisterViewState value)? register,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class LoginLoginViewState implements LoginViewState {
  const factory LoginLoginViewState(String? error, bool loading) =
      _$LoginLoginViewState;

  @override
  String? get error;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  $LoginLoginViewStateCopyWith<LoginLoginViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterViewStateCopyWith<$Res>
    implements $LoginViewStateCopyWith<$Res> {
  factory $RegisterViewStateCopyWith(
          RegisterViewState value, $Res Function(RegisterViewState) then) =
      _$RegisterViewStateCopyWithImpl<$Res>;
  @override
  $Res call({String? error, bool loading});
}

/// @nodoc
class _$RegisterViewStateCopyWithImpl<$Res>
    extends _$LoginViewStateCopyWithImpl<$Res>
    implements $RegisterViewStateCopyWith<$Res> {
  _$RegisterViewStateCopyWithImpl(
      RegisterViewState _value, $Res Function(RegisterViewState) _then)
      : super(_value, (v) => _then(v as RegisterViewState));

  @override
  RegisterViewState get _value => super._value as RegisterViewState;

  @override
  $Res call({
    Object? error = freezed,
    Object? loading = freezed,
  }) {
    return _then(RegisterViewState(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterViewState implements RegisterViewState {
  const _$RegisterViewState(this.error, this.loading);

  @override
  final String? error;
  @override
  final bool loading;

  @override
  String toString() {
    return 'LoginViewState.register(error: $error, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterViewState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  $RegisterViewStateCopyWith<RegisterViewState> get copyWith =>
      _$RegisterViewStateCopyWithImpl<RegisterViewState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error, bool loading) login,
    required TResult Function(String? error, bool loading) register,
  }) {
    return register(error, loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? error, bool loading)? login,
    TResult Function(String? error, bool loading)? register,
  }) {
    return register?.call(error, loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error, bool loading)? login,
    TResult Function(String? error, bool loading)? register,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(error, loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoginViewState value) login,
    required TResult Function(RegisterViewState value) register,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginLoginViewState value)? login,
    TResult Function(RegisterViewState value)? register,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoginViewState value)? login,
    TResult Function(RegisterViewState value)? register,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class RegisterViewState implements LoginViewState {
  const factory RegisterViewState(String? error, bool loading) =
      _$RegisterViewState;

  @override
  String? get error;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  $RegisterViewStateCopyWith<RegisterViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
