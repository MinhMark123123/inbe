// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingUIState {
  bool get isTurnOn => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isSuccessRequestOTP => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  AsyncValue<Map<InterestModel, bool>> get mapInterestModel =>
      throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingUIStateCopyWith<SettingUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingUIStateCopyWith<$Res> {
  factory $SettingUIStateCopyWith(
          SettingUIState value, $Res Function(SettingUIState) then) =
      _$SettingUIStateCopyWithImpl<$Res, SettingUIState>;
  @useResult
  $Res call(
      {bool isTurnOn,
      bool isSuccess,
      bool isSuccessRequestOTP,
      String errorMsg,
      AsyncValue<Map<InterestModel, bool>> mapInterestModel,
      UserModel? userModel,
      String nickname});
}

/// @nodoc
class _$SettingUIStateCopyWithImpl<$Res, $Val extends SettingUIState>
    implements $SettingUIStateCopyWith<$Res> {
  _$SettingUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTurnOn = null,
    Object? isSuccess = null,
    Object? isSuccessRequestOTP = null,
    Object? errorMsg = null,
    Object? mapInterestModel = null,
    Object? userModel = freezed,
    Object? nickname = null,
  }) {
    return _then(_value.copyWith(
      isTurnOn: null == isTurnOn
          ? _value.isTurnOn
          : isTurnOn // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessRequestOTP: null == isSuccessRequestOTP
          ? _value.isSuccessRequestOTP
          : isSuccessRequestOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      mapInterestModel: null == mapInterestModel
          ? _value.mapInterestModel
          : mapInterestModel // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<InterestModel, bool>>,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingUIStateCopyWith<$Res>
    implements $SettingUIStateCopyWith<$Res> {
  factory _$$_SettingUIStateCopyWith(
          _$_SettingUIState value, $Res Function(_$_SettingUIState) then) =
      __$$_SettingUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isTurnOn,
      bool isSuccess,
      bool isSuccessRequestOTP,
      String errorMsg,
      AsyncValue<Map<InterestModel, bool>> mapInterestModel,
      UserModel? userModel,
      String nickname});
}

/// @nodoc
class __$$_SettingUIStateCopyWithImpl<$Res>
    extends _$SettingUIStateCopyWithImpl<$Res, _$_SettingUIState>
    implements _$$_SettingUIStateCopyWith<$Res> {
  __$$_SettingUIStateCopyWithImpl(
      _$_SettingUIState _value, $Res Function(_$_SettingUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTurnOn = null,
    Object? isSuccess = null,
    Object? isSuccessRequestOTP = null,
    Object? errorMsg = null,
    Object? mapInterestModel = null,
    Object? userModel = freezed,
    Object? nickname = null,
  }) {
    return _then(_$_SettingUIState(
      isTurnOn: null == isTurnOn
          ? _value.isTurnOn
          : isTurnOn // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessRequestOTP: null == isSuccessRequestOTP
          ? _value.isSuccessRequestOTP
          : isSuccessRequestOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      mapInterestModel: null == mapInterestModel
          ? _value.mapInterestModel
          : mapInterestModel // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<InterestModel, bool>>,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SettingUIState implements _SettingUIState {
  _$_SettingUIState(
      {this.isTurnOn = true,
      this.isSuccess = false,
      this.isSuccessRequestOTP = false,
      this.errorMsg = '',
      this.mapInterestModel = const AsyncValue.loading(),
      this.userModel = null,
      this.nickname = ''});

  @override
  @JsonKey()
  final bool isTurnOn;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool isSuccessRequestOTP;
  @override
  @JsonKey()
  final String errorMsg;
  @override
  @JsonKey()
  final AsyncValue<Map<InterestModel, bool>> mapInterestModel;
  @override
  @JsonKey()
  final UserModel? userModel;
  @override
  @JsonKey()
  final String nickname;

  @override
  String toString() {
    return 'SettingUIState(isTurnOn: $isTurnOn, isSuccess: $isSuccess, isSuccessRequestOTP: $isSuccessRequestOTP, errorMsg: $errorMsg, mapInterestModel: $mapInterestModel, userModel: $userModel, nickname: $nickname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingUIState &&
            (identical(other.isTurnOn, isTurnOn) ||
                other.isTurnOn == isTurnOn) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isSuccessRequestOTP, isSuccessRequestOTP) ||
                other.isSuccessRequestOTP == isSuccessRequestOTP) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.mapInterestModel, mapInterestModel) ||
                other.mapInterestModel == mapInterestModel) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isTurnOn, isSuccess,
      isSuccessRequestOTP, errorMsg, mapInterestModel, userModel, nickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingUIStateCopyWith<_$_SettingUIState> get copyWith =>
      __$$_SettingUIStateCopyWithImpl<_$_SettingUIState>(this, _$identity);
}

abstract class _SettingUIState implements SettingUIState {
  factory _SettingUIState(
      {final bool isTurnOn,
      final bool isSuccess,
      final bool isSuccessRequestOTP,
      final String errorMsg,
      final AsyncValue<Map<InterestModel, bool>> mapInterestModel,
      final UserModel? userModel,
      final String nickname}) = _$_SettingUIState;

  @override
  bool get isTurnOn;
  @override
  bool get isSuccess;
  @override
  bool get isSuccessRequestOTP;
  @override
  String get errorMsg;
  @override
  AsyncValue<Map<InterestModel, bool>> get mapInterestModel;
  @override
  UserModel? get userModel;
  @override
  String get nickname;
  @override
  @JsonKey(ignore: true)
  _$$_SettingUIStateCopyWith<_$_SettingUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
