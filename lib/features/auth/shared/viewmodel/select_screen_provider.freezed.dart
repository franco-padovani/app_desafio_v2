// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_screen_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScreenState {
  Widget get route => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget route) signUp,
    required TResult Function(Widget route) signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Widget route)? signUp,
    TResult? Function(Widget route)? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget route)? signUp,
    TResult Function(Widget route)? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpScreenState value) signUp,
    required TResult Function(SignInScreenState value) signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpScreenState value)? signUp,
    TResult? Function(SignInScreenState value)? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpScreenState value)? signUp,
    TResult Function(SignInScreenState value)? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScreenStateCopyWith<ScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenStateCopyWith<$Res> {
  factory $ScreenStateCopyWith(
          ScreenState value, $Res Function(ScreenState) then) =
      _$ScreenStateCopyWithImpl<$Res, ScreenState>;
  @useResult
  $Res call({Widget route});
}

/// @nodoc
class _$ScreenStateCopyWithImpl<$Res, $Val extends ScreenState>
    implements $ScreenStateCopyWith<$Res> {
  _$ScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Widget,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpScreenStateImplCopyWith<$Res>
    implements $ScreenStateCopyWith<$Res> {
  factory _$$SignUpScreenStateImplCopyWith(_$SignUpScreenStateImpl value,
          $Res Function(_$SignUpScreenStateImpl) then) =
      __$$SignUpScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget route});
}

/// @nodoc
class __$$SignUpScreenStateImplCopyWithImpl<$Res>
    extends _$ScreenStateCopyWithImpl<$Res, _$SignUpScreenStateImpl>
    implements _$$SignUpScreenStateImplCopyWith<$Res> {
  __$$SignUpScreenStateImplCopyWithImpl(_$SignUpScreenStateImpl _value,
      $Res Function(_$SignUpScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_$SignUpScreenStateImpl(
      null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$SignUpScreenStateImpl implements SignUpScreenState {
  const _$SignUpScreenStateImpl(this.route);

  @override
  final Widget route;

  @override
  String toString() {
    return 'ScreenState.signUp(route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpScreenStateImpl &&
            (identical(other.route, route) || other.route == route));
  }

  @override
  int get hashCode => Object.hash(runtimeType, route);

  /// Create a copy of ScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpScreenStateImplCopyWith<_$SignUpScreenStateImpl> get copyWith =>
      __$$SignUpScreenStateImplCopyWithImpl<_$SignUpScreenStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget route) signUp,
    required TResult Function(Widget route) signIn,
  }) {
    return signUp(route);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Widget route)? signUp,
    TResult? Function(Widget route)? signIn,
  }) {
    return signUp?.call(route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget route)? signUp,
    TResult Function(Widget route)? signIn,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpScreenState value) signUp,
    required TResult Function(SignInScreenState value) signIn,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpScreenState value)? signUp,
    TResult? Function(SignInScreenState value)? signIn,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpScreenState value)? signUp,
    TResult Function(SignInScreenState value)? signIn,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class SignUpScreenState implements ScreenState {
  const factory SignUpScreenState(final Widget route) = _$SignUpScreenStateImpl;

  @override
  Widget get route;

  /// Create a copy of ScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpScreenStateImplCopyWith<_$SignUpScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInScreenStateImplCopyWith<$Res>
    implements $ScreenStateCopyWith<$Res> {
  factory _$$SignInScreenStateImplCopyWith(_$SignInScreenStateImpl value,
          $Res Function(_$SignInScreenStateImpl) then) =
      __$$SignInScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget route});
}

/// @nodoc
class __$$SignInScreenStateImplCopyWithImpl<$Res>
    extends _$ScreenStateCopyWithImpl<$Res, _$SignInScreenStateImpl>
    implements _$$SignInScreenStateImplCopyWith<$Res> {
  __$$SignInScreenStateImplCopyWithImpl(_$SignInScreenStateImpl _value,
      $Res Function(_$SignInScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_$SignInScreenStateImpl(
      null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$SignInScreenStateImpl implements SignInScreenState {
  const _$SignInScreenStateImpl(this.route);

  @override
  final Widget route;

  @override
  String toString() {
    return 'ScreenState.signIn(route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInScreenStateImpl &&
            (identical(other.route, route) || other.route == route));
  }

  @override
  int get hashCode => Object.hash(runtimeType, route);

  /// Create a copy of ScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInScreenStateImplCopyWith<_$SignInScreenStateImpl> get copyWith =>
      __$$SignInScreenStateImplCopyWithImpl<_$SignInScreenStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget route) signUp,
    required TResult Function(Widget route) signIn,
  }) {
    return signIn(route);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Widget route)? signUp,
    TResult? Function(Widget route)? signIn,
  }) {
    return signIn?.call(route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget route)? signUp,
    TResult Function(Widget route)? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpScreenState value) signUp,
    required TResult Function(SignInScreenState value) signIn,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpScreenState value)? signUp,
    TResult? Function(SignInScreenState value)? signIn,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpScreenState value)? signUp,
    TResult Function(SignInScreenState value)? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class SignInScreenState implements ScreenState {
  const factory SignInScreenState(final Widget route) = _$SignInScreenStateImpl;

  @override
  Widget get route;

  /// Create a copy of ScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInScreenStateImplCopyWith<_$SignInScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
