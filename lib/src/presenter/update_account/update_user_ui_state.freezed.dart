// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_user_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateUserUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get errorMail => throw _privateConstructorUsedError;
  String get errorPassword => throw _privateConstructorUsedError;
  String get errorConfirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateUserUIStateCopyWith<UpdateUserUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserUIStateCopyWith<$Res> {
  factory $UpdateUserUIStateCopyWith(
          UpdateUserUIState value, $Res Function(UpdateUserUIState) then) =
      _$UpdateUserUIStateCopyWithImpl<$Res, UpdateUserUIState>;
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      String errorMail,
      String errorPassword,
      String errorConfirmPassword});
}

/// @nodoc
class _$UpdateUserUIStateCopyWithImpl<$Res, $Val extends UpdateUserUIState>
    implements $UpdateUserUIStateCopyWith<$Res> {
  _$UpdateUserUIStateCopyWithImpl(this._value, this._then);

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
      errorMail: null == errorMail
          ? _value.errorMail
          : errorMail // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_UpdateUserUIStateCopyWith<$Res>
    implements $UpdateUserUIStateCopyWith<$Res> {
  factory _$$_UpdateUserUIStateCopyWith(_$_UpdateUserUIState value,
          $Res Function(_$_UpdateUserUIState) then) =
      __$$_UpdateUserUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      String errorMail,
      String errorPassword,
      String errorConfirmPassword});
}

/// @nodoc
class __$$_UpdateUserUIStateCopyWithImpl<$Res>
    extends _$UpdateUserUIStateCopyWithImpl<$Res, _$_UpdateUserUIState>
    implements _$$_UpdateUserUIStateCopyWith<$Res> {
  __$$_UpdateUserUIStateCopyWithImpl(
      _$_UpdateUserUIState _value, $Res Function(_$_UpdateUserUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? errorMail = null,
    Object? errorPassword = null,
    Object? errorConfirmPassword = null,
  }) {
    return _then(_$_UpdateUserUIState(
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
      errorConfirmPassword: null == errorConfirmPassword
          ? _value.errorConfirmPassword
          : errorConfirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateUserUIState implements _UpdateUserUIState {
  _$_UpdateUserUIState(
      {this.isSuccess = false,
      this.errorMessage = '',
      this.errorMail = '',
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
  final String errorMail;
  @override
  @JsonKey()
  final String errorPassword;
  @override
  @JsonKey()
  final String errorConfirmPassword;

  @override
  String toString() {
    return 'UpdateUserUIState(isSuccess: $isSuccess, errorMessage: $errorMessage, errorMail: $errorMail, errorPassword: $errorPassword, errorConfirmPassword: $errorConfirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserUIState &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorMail, errorMail) ||
                other.errorMail == errorMail) &&
            (identical(other.errorPassword, errorPassword) ||
                other.errorPassword == errorPassword) &&
            (identical(other.errorConfirmPassword, errorConfirmPassword) ||
                other.errorConfirmPassword == errorConfirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, errorMessage,
      errorMail, errorPassword, errorConfirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateUserUIStateCopyWith<_$_UpdateUserUIState> get copyWith =>
      __$$_UpdateUserUIStateCopyWithImpl<_$_UpdateUserUIState>(
          this, _$identity);
}

abstract class _UpdateUserUIState implements UpdateUserUIState {
  factory _UpdateUserUIState(
      {final bool isSuccess,
      final String errorMessage,
      final String errorMail,
      final String errorPassword,
      final String errorConfirmPassword}) = _$_UpdateUserUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMessage;
  @override
  String get errorMail;
  @override
  String get errorPassword;
  @override
  String get errorConfirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateUserUIStateCopyWith<_$_UpdateUserUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
