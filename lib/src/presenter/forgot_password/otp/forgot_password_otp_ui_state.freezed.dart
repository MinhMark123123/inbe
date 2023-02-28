// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'forgot_password_otp_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordOTPUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  String get errorEmail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordOTPUIStateCopyWith<ForgotPasswordOTPUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordOTPUIStateCopyWith<$Res> {
  factory $ForgotPasswordOTPUIStateCopyWith(ForgotPasswordOTPUIState value,
          $Res Function(ForgotPasswordOTPUIState) then) =
      _$ForgotPasswordOTPUIStateCopyWithImpl<$Res, ForgotPasswordOTPUIState>;
  @useResult
  $Res call({bool isSuccess, String errorMsg, String errorEmail});
}

/// @nodoc
class _$ForgotPasswordOTPUIStateCopyWithImpl<$Res,
        $Val extends ForgotPasswordOTPUIState>
    implements $ForgotPasswordOTPUIStateCopyWith<$Res> {
  _$ForgotPasswordOTPUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMsg = null,
    Object? errorEmail = null,
  }) {
    return _then(_value.copyWith(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      errorEmail: null == errorEmail
          ? _value.errorEmail
          : errorEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordOTPUIStateCopyWith<$Res>
    implements $ForgotPasswordOTPUIStateCopyWith<$Res> {
  factory _$$_ForgotPasswordOTPUIStateCopyWith(
          _$_ForgotPasswordOTPUIState value,
          $Res Function(_$_ForgotPasswordOTPUIState) then) =
      __$$_ForgotPasswordOTPUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSuccess, String errorMsg, String errorEmail});
}

/// @nodoc
class __$$_ForgotPasswordOTPUIStateCopyWithImpl<$Res>
    extends _$ForgotPasswordOTPUIStateCopyWithImpl<$Res,
        _$_ForgotPasswordOTPUIState>
    implements _$$_ForgotPasswordOTPUIStateCopyWith<$Res> {
  __$$_ForgotPasswordOTPUIStateCopyWithImpl(_$_ForgotPasswordOTPUIState _value,
      $Res Function(_$_ForgotPasswordOTPUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMsg = null,
    Object? errorEmail = null,
  }) {
    return _then(_$_ForgotPasswordOTPUIState(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      errorEmail: null == errorEmail
          ? _value.errorEmail
          : errorEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordOTPUIState implements _ForgotPasswordOTPUIState {
  _$_ForgotPasswordOTPUIState(
      {this.isSuccess = false, this.errorMsg = '', this.errorEmail = ''});

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMsg;
  @override
  @JsonKey()
  final String errorEmail;

  @override
  String toString() {
    return 'ForgotPasswordOTPUIState(isSuccess: $isSuccess, errorMsg: $errorMsg, errorEmail: $errorEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordOTPUIState &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.errorEmail, errorEmail) ||
                other.errorEmail == errorEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, errorMsg, errorEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordOTPUIStateCopyWith<_$_ForgotPasswordOTPUIState>
      get copyWith => __$$_ForgotPasswordOTPUIStateCopyWithImpl<
          _$_ForgotPasswordOTPUIState>(this, _$identity);
}

abstract class _ForgotPasswordOTPUIState implements ForgotPasswordOTPUIState {
  factory _ForgotPasswordOTPUIState(
      {final bool isSuccess,
      final String errorMsg,
      final String errorEmail}) = _$_ForgotPasswordOTPUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMsg;
  @override
  String get errorEmail;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordOTPUIStateCopyWith<_$_ForgotPasswordOTPUIState>
      get copyWith => throw _privateConstructorUsedError;
}
