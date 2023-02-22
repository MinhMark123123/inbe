// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get errorMail => throw _privateConstructorUsedError;
  String get errorPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginUIStateCopyWith<LoginUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUIStateCopyWith<$Res> {
  factory $LoginUIStateCopyWith(
          LoginUIState value, $Res Function(LoginUIState) then) =
      _$LoginUIStateCopyWithImpl<$Res, LoginUIState>;
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      String errorMail,
      String errorPassword});
}

/// @nodoc
class _$LoginUIStateCopyWithImpl<$Res, $Val extends LoginUIState>
    implements $LoginUIStateCopyWith<$Res> {
  _$LoginUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? errorMail = null,
    Object? errorPassword = null,
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
      errorMail: null == errorMail
          ? _value.errorMail
          : errorMail // ignore: cast_nullable_to_non_nullable
              as String,
      errorPassword: null == errorPassword
          ? _value.errorPassword
          : errorPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginUIStateCopyWith<$Res>
    implements $LoginUIStateCopyWith<$Res> {
  factory _$$_LoginUIStateCopyWith(
          _$_LoginUIState value, $Res Function(_$_LoginUIState) then) =
      __$$_LoginUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      String errorMail,
      String errorPassword});
}

/// @nodoc
class __$$_LoginUIStateCopyWithImpl<$Res>
    extends _$LoginUIStateCopyWithImpl<$Res, _$_LoginUIState>
    implements _$$_LoginUIStateCopyWith<$Res> {
  __$$_LoginUIStateCopyWithImpl(
      _$_LoginUIState _value, $Res Function(_$_LoginUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? errorMail = null,
    Object? errorPassword = null,
  }) {
    return _then(_$_LoginUIState(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorMail: null == errorMail
          ? _value.errorMail
          : errorMail // ignore: cast_nullable_to_non_nullable
              as String,
      errorPassword: null == errorPassword
          ? _value.errorPassword
          : errorPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginUIState implements _LoginUIState {
  _$_LoginUIState(
      {this.isSuccess = false,
      this.errorMessage = '',
      this.errorMail = '',
      this.errorPassword = ''});

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String errorMail;
  @override
  @JsonKey()
  final String errorPassword;

  @override
  String toString() {
    return 'LoginUIState(isSuccess: $isSuccess, errorMessage: $errorMessage, errorMail: $errorMail, errorPassword: $errorPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginUIState &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorMail, errorMail) ||
                other.errorMail == errorMail) &&
            (identical(other.errorPassword, errorPassword) ||
                other.errorPassword == errorPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isSuccess, errorMessage, errorMail, errorPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginUIStateCopyWith<_$_LoginUIState> get copyWith =>
      __$$_LoginUIStateCopyWithImpl<_$_LoginUIState>(this, _$identity);
}

abstract class _LoginUIState implements LoginUIState {
  factory _LoginUIState(
      {final bool isSuccess,
      final String errorMessage,
      final String errorMail,
      final String errorPassword}) = _$_LoginUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMessage;
  @override
  String get errorMail;
  @override
  String get errorPassword;
  @override
  @JsonKey(ignore: true)
  _$$_LoginUIStateCopyWith<_$_LoginUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
