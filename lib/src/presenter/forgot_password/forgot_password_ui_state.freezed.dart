// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'forgot_password_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordUIStateCopyWith<ForgotPasswordUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordUIStateCopyWith<$Res> {
  factory $ForgotPasswordUIStateCopyWith(ForgotPasswordUIState value,
          $Res Function(ForgotPasswordUIState) then) =
      _$ForgotPasswordUIStateCopyWithImpl<$Res, ForgotPasswordUIState>;
  @useResult
  $Res call({bool isSuccess, String errorMsg});
}

/// @nodoc
class _$ForgotPasswordUIStateCopyWithImpl<$Res,
        $Val extends ForgotPasswordUIState>
    implements $ForgotPasswordUIStateCopyWith<$Res> {
  _$ForgotPasswordUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMsg = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordUIStateCopyWith<$Res>
    implements $ForgotPasswordUIStateCopyWith<$Res> {
  factory _$$_ForgotPasswordUIStateCopyWith(_$_ForgotPasswordUIState value,
          $Res Function(_$_ForgotPasswordUIState) then) =
      __$$_ForgotPasswordUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSuccess, String errorMsg});
}

/// @nodoc
class __$$_ForgotPasswordUIStateCopyWithImpl<$Res>
    extends _$ForgotPasswordUIStateCopyWithImpl<$Res, _$_ForgotPasswordUIState>
    implements _$$_ForgotPasswordUIStateCopyWith<$Res> {
  __$$_ForgotPasswordUIStateCopyWithImpl(_$_ForgotPasswordUIState _value,
      $Res Function(_$_ForgotPasswordUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMsg = null,
  }) {
    return _then(_$_ForgotPasswordUIState(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordUIState implements _ForgotPasswordUIState {
  _$_ForgotPasswordUIState({this.isSuccess = false, this.errorMsg = ''});

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMsg;

  @override
  String toString() {
    return 'ForgotPasswordUIState(isSuccess: $isSuccess, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordUIState &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordUIStateCopyWith<_$_ForgotPasswordUIState> get copyWith =>
      __$$_ForgotPasswordUIStateCopyWithImpl<_$_ForgotPasswordUIState>(
          this, _$identity);
}

abstract class _ForgotPasswordUIState implements ForgotPasswordUIState {
  factory _ForgotPasswordUIState(
      {final bool isSuccess, final String errorMsg}) = _$_ForgotPasswordUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMsg;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordUIStateCopyWith<_$_ForgotPasswordUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
