// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_account_otp_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateAccountOTPUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateAccountOTPUIStateCopyWith<UpdateAccountOTPUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateAccountOTPUIStateCopyWith<$Res> {
  factory $UpdateAccountOTPUIStateCopyWith(UpdateAccountOTPUIState value,
          $Res Function(UpdateAccountOTPUIState) then) =
      _$UpdateAccountOTPUIStateCopyWithImpl<$Res, UpdateAccountOTPUIState>;
  @useResult
  $Res call({bool isSuccess, String errorMessage, String otp});
}

/// @nodoc
class _$UpdateAccountOTPUIStateCopyWithImpl<$Res,
        $Val extends UpdateAccountOTPUIState>
    implements $UpdateAccountOTPUIStateCopyWith<$Res> {
  _$UpdateAccountOTPUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? otp = null,
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
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateAccountOTPUIStateCopyWith<$Res>
    implements $UpdateAccountOTPUIStateCopyWith<$Res> {
  factory _$$_UpdateAccountOTPUIStateCopyWith(_$_UpdateAccountOTPUIState value,
          $Res Function(_$_UpdateAccountOTPUIState) then) =
      __$$_UpdateAccountOTPUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSuccess, String errorMessage, String otp});
}

/// @nodoc
class __$$_UpdateAccountOTPUIStateCopyWithImpl<$Res>
    extends _$UpdateAccountOTPUIStateCopyWithImpl<$Res,
        _$_UpdateAccountOTPUIState>
    implements _$$_UpdateAccountOTPUIStateCopyWith<$Res> {
  __$$_UpdateAccountOTPUIStateCopyWithImpl(_$_UpdateAccountOTPUIState _value,
      $Res Function(_$_UpdateAccountOTPUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? otp = null,
  }) {
    return _then(_$_UpdateAccountOTPUIState(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateAccountOTPUIState implements _UpdateAccountOTPUIState {
  _$_UpdateAccountOTPUIState(
      {this.isSuccess = false, this.errorMessage = '', this.otp = ''});

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String otp;

  @override
  String toString() {
    return 'UpdateAccountOTPUIState(isSuccess: $isSuccess, errorMessage: $errorMessage, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateAccountOTPUIState &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, errorMessage, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateAccountOTPUIStateCopyWith<_$_UpdateAccountOTPUIState>
      get copyWith =>
          __$$_UpdateAccountOTPUIStateCopyWithImpl<_$_UpdateAccountOTPUIState>(
              this, _$identity);
}

abstract class _UpdateAccountOTPUIState implements UpdateAccountOTPUIState {
  factory _UpdateAccountOTPUIState(
      {final bool isSuccess,
      final String errorMessage,
      final String otp}) = _$_UpdateAccountOTPUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMessage;
  @override
  String get otp;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateAccountOTPUIStateCopyWith<_$_UpdateAccountOTPUIState>
      get copyWith => throw _privateConstructorUsedError;
}
