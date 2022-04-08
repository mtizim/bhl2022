// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authorization_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  UnknownLoginState unknown() {
    return const UnknownLoginState();
  }

  LoggedOutState logged_out(String? reason) {
    return LoggedOutState(
      reason,
    );
  }

  LoggedInState logged_in(String secret) {
    return LoggedInState(
      secret,
    );
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(String? reason) logged_out,
    required TResult Function(String secret) logged_in,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String? reason)? logged_out,
    TResult Function(String secret)? logged_in,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String? reason)? logged_out,
    TResult Function(String secret)? logged_in,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownLoginState value) unknown,
    required TResult Function(LoggedOutState value) logged_out,
    required TResult Function(LoggedInState value) logged_in,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnknownLoginState value)? unknown,
    TResult Function(LoggedOutState value)? logged_out,
    TResult Function(LoggedInState value)? logged_in,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownLoginState value)? unknown,
    TResult Function(LoggedOutState value)? logged_out,
    TResult Function(LoggedInState value)? logged_in,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class $UnknownLoginStateCopyWith<$Res> {
  factory $UnknownLoginStateCopyWith(
          UnknownLoginState value, $Res Function(UnknownLoginState) then) =
      _$UnknownLoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnknownLoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $UnknownLoginStateCopyWith<$Res> {
  _$UnknownLoginStateCopyWithImpl(
      UnknownLoginState _value, $Res Function(UnknownLoginState) _then)
      : super(_value, (v) => _then(v as UnknownLoginState));

  @override
  UnknownLoginState get _value => super._value as UnknownLoginState;
}

/// @nodoc

class _$UnknownLoginState implements UnknownLoginState {
  const _$UnknownLoginState();

  @override
  String toString() {
    return 'LoginState.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnknownLoginState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(String? reason) logged_out,
    required TResult Function(String secret) logged_in,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String? reason)? logged_out,
    TResult Function(String secret)? logged_in,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String? reason)? logged_out,
    TResult Function(String secret)? logged_in,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownLoginState value) unknown,
    required TResult Function(LoggedOutState value) logged_out,
    required TResult Function(LoggedInState value) logged_in,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnknownLoginState value)? unknown,
    TResult Function(LoggedOutState value)? logged_out,
    TResult Function(LoggedInState value)? logged_in,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownLoginState value)? unknown,
    TResult Function(LoggedOutState value)? logged_out,
    TResult Function(LoggedInState value)? logged_in,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownLoginState implements LoginState {
  const factory UnknownLoginState() = _$UnknownLoginState;
}

/// @nodoc
abstract class $LoggedOutStateCopyWith<$Res> {
  factory $LoggedOutStateCopyWith(
          LoggedOutState value, $Res Function(LoggedOutState) then) =
      _$LoggedOutStateCopyWithImpl<$Res>;
  $Res call({String? reason});
}

/// @nodoc
class _$LoggedOutStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoggedOutStateCopyWith<$Res> {
  _$LoggedOutStateCopyWithImpl(
      LoggedOutState _value, $Res Function(LoggedOutState) _then)
      : super(_value, (v) => _then(v as LoggedOutState));

  @override
  LoggedOutState get _value => super._value as LoggedOutState;

  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(LoggedOutState(
      reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoggedOutState implements LoggedOutState {
  const _$LoggedOutState(this.reason);

  @override
  final String? reason;

  @override
  String toString() {
    return 'LoginState.logged_out(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoggedOutState &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  $LoggedOutStateCopyWith<LoggedOutState> get copyWith =>
      _$LoggedOutStateCopyWithImpl<LoggedOutState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(String? reason) logged_out,
    required TResult Function(String secret) logged_in,
  }) {
    return logged_out(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String? reason)? logged_out,
    TResult Function(String secret)? logged_in,
  }) {
    return logged_out?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String? reason)? logged_out,
    TResult Function(String secret)? logged_in,
    required TResult orElse(),
  }) {
    if (logged_out != null) {
      return logged_out(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownLoginState value) unknown,
    required TResult Function(LoggedOutState value) logged_out,
    required TResult Function(LoggedInState value) logged_in,
  }) {
    return logged_out(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnknownLoginState value)? unknown,
    TResult Function(LoggedOutState value)? logged_out,
    TResult Function(LoggedInState value)? logged_in,
  }) {
    return logged_out?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownLoginState value)? unknown,
    TResult Function(LoggedOutState value)? logged_out,
    TResult Function(LoggedInState value)? logged_in,
    required TResult orElse(),
  }) {
    if (logged_out != null) {
      return logged_out(this);
    }
    return orElse();
  }
}

abstract class LoggedOutState implements LoginState {
  const factory LoggedOutState(String? reason) = _$LoggedOutState;

  String? get reason;
  @JsonKey(ignore: true)
  $LoggedOutStateCopyWith<LoggedOutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedInStateCopyWith<$Res> {
  factory $LoggedInStateCopyWith(
          LoggedInState value, $Res Function(LoggedInState) then) =
      _$LoggedInStateCopyWithImpl<$Res>;
  $Res call({String secret});
}

/// @nodoc
class _$LoggedInStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoggedInStateCopyWith<$Res> {
  _$LoggedInStateCopyWithImpl(
      LoggedInState _value, $Res Function(LoggedInState) _then)
      : super(_value, (v) => _then(v as LoggedInState));

  @override
  LoggedInState get _value => super._value as LoggedInState;

  @override
  $Res call({
    Object? secret = freezed,
  }) {
    return _then(LoggedInState(
      secret == freezed
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoggedInState implements LoggedInState {
  const _$LoggedInState(this.secret);

  @override
  final String secret;

  @override
  String toString() {
    return 'LoginState.logged_in(secret: $secret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoggedInState &&
            const DeepCollectionEquality().equals(other.secret, secret));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(secret));

  @JsonKey(ignore: true)
  @override
  $LoggedInStateCopyWith<LoggedInState> get copyWith =>
      _$LoggedInStateCopyWithImpl<LoggedInState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(String? reason) logged_out,
    required TResult Function(String secret) logged_in,
  }) {
    return logged_in(secret);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String? reason)? logged_out,
    TResult Function(String secret)? logged_in,
  }) {
    return logged_in?.call(secret);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(String? reason)? logged_out,
    TResult Function(String secret)? logged_in,
    required TResult orElse(),
  }) {
    if (logged_in != null) {
      return logged_in(secret);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownLoginState value) unknown,
    required TResult Function(LoggedOutState value) logged_out,
    required TResult Function(LoggedInState value) logged_in,
  }) {
    return logged_in(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnknownLoginState value)? unknown,
    TResult Function(LoggedOutState value)? logged_out,
    TResult Function(LoggedInState value)? logged_in,
  }) {
    return logged_in?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownLoginState value)? unknown,
    TResult Function(LoggedOutState value)? logged_out,
    TResult Function(LoggedInState value)? logged_in,
    required TResult orElse(),
  }) {
    if (logged_in != null) {
      return logged_in(this);
    }
    return orElse();
  }
}

abstract class LoggedInState implements LoginState {
  const factory LoggedInState(String secret) = _$LoggedInState;

  String get secret;
  @JsonKey(ignore: true)
  $LoggedInStateCopyWith<LoggedInState> get copyWith =>
      throw _privateConstructorUsedError;
}
