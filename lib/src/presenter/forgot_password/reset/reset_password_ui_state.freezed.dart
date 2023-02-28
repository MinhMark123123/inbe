// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_password_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get errorPassword => throw _privateConstructorUsedError;
  String get errorConfirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordUIStateCopyWith<ResetPasswordUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordUIStateCopyWith<$Res> {
  factory $ResetPasswordUIStateCopyWith(ResetPasswordUIState value,
          $Res Function(ResetPasswordUIState) then) =
      _$ResetPasswordUIStateCopyWithImpl<$Res, ResetPasswordUIState>;
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      String errorPassword,
      String errorConfirmPassword});
}

/// @nodoc
class _$ResetPasswordUIStateCopyWithImpl<$Res,
        $Val extends ResetPasswordUIState>
    implements $ResetPasswordUIStateCopyWith<$Res> {
  _$ResetPasswordUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? errorPassword = null,
    Object? errorConfirmPassword = null,
  }) {
    return _then(_value.copyWith(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorPassword: null == errorPassword
          ? _value.errorPassword
          : errorPassword // ignore: cast_nullable_to_non_nullable
              as String,
      errorConfirmPassword: null == errorConfirmPassword
          ? _value.errorConfirmPassword
          : errorConfirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPasswordUIStateCopyWith<$Res>
    implements $ResetPasswordUIStateCopyWith<$Res> {
  factory _$$_ResetPasswordUIStateCopyWith(_$_ResetPasswordUIState value,
          $Res Function(_$_ResetPasswordUIState) then) =
      __$$_ResetPasswordUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      String errorPassword,
      String errorConfirmPassword});
}

/// @nodoc
class __$$_ResetPasswordUIStateCopyWithImpl<$Res>
    extends _$ResetPasswordUIStateCopyWithImpl<$Res, _$_ResetPasswordUIState>
    implements _$$_ResetPasswordUIStateCopyWith<$Res> {
  __$$_ResetPasswordUIStateCopyWithImpl(_$_ResetPasswordUIState _value,
      $Res Function(_$_ResetPasswordUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? errorPassword = null,
    Object? errorConfirmPassword = null,
  }) {
    return _then(_$_ResetPasswordUIState(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorPassword: null == errorPassword
          ? _value.errorPassword
          : errorPassword // ignore: cast_nullable_to_non_nullable
              as String,
      errorConfirmPassword: null == errorConfirmPassword
          ? _value.errorConfirmPassword
          : errorConfirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordUIState implements _ResetPasswordUIState {
  _$_ResetPasswordUIState(
      {this.isSuccess = false,
      this.errorMessage = '',
      this.errorPassword = '',
      this.errorConfirmPassword = ''});

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String errorPassword;
  @override
  @JsonKey()
  final String errorConfirmPassword;

  @override
  String toString() {
    return 'ResetPasswordUIState(isSuccess: $isSuccess, errorMessage: $errorMessage, errorPassword: $errorPassword, errorConfirmPassword: $errorConfirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordUIState &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorPassword, errorPassword) ||
                other.errorPassword == errorPassword) &&
            (identical(other.errorConfirmPassword, errorConfirmPassword) ||
                other.errorConfirmPassword == errorConfirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, errorMessage,
      errorPassword, errorConfirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordUIStateCopyWith<_$_ResetPasswordUIState> get copyWith =>
      __$$_ResetPasswordUIStateCopyWithImpl<_$_ResetPasswordUIState>(
          this, _$identity);
}

abstract class _ResetPasswordUIState implements ResetPasswordUIState {
  factory _ResetPasswordUIState(
      {final bool isSuccess,
      final String errorMessage,
      final String errorPassword,
      final String errorConfirmPassword}) = _$_ResetPasswordUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMessage;
  @override
  String get errorPassword;
  @override
  String get errorConfirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordUIStateCopyWith<_$_ResetPasswordUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
