// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterUIState {
  bool get isTurnOn => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  List<InterestModel> get interests => throw _privateConstructorUsedError;
  AsyncValue<Map<InterestModel, bool>> get checkBoxList =>
      throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get errorMail => throw _privateConstructorUsedError;
  String get errorPassword => throw _privateConstructorUsedError;
  String get errorConfirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterUIStateCopyWith<RegisterUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUIStateCopyWith<$Res> {
  factory $RegisterUIStateCopyWith(
          RegisterUIState value, $Res Function(RegisterUIState) then) =
      _$RegisterUIStateCopyWithImpl<$Res, RegisterUIState>;
  @useResult
  $Res call(
      {bool isTurnOn,
      bool isSuccess,
      List<InterestModel> interests,
      AsyncValue<Map<InterestModel, bool>> checkBoxList,
      String errorMessage,
      String errorMail,
      String errorPassword,
      String errorConfirmPassword});
}

/// @nodoc
class _$RegisterUIStateCopyWithImpl<$Res, $Val extends RegisterUIState>
    implements $RegisterUIStateCopyWith<$Res> {
  _$RegisterUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTurnOn = null,
    Object? isSuccess = null,
    Object? interests = null,
    Object? checkBoxList = null,
    Object? errorMessage = null,
    Object? errorMail = null,
    Object? errorPassword = null,
    Object? errorConfirmPassword = null,
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
      interests: null == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<InterestModel>,
      checkBoxList: null == checkBoxList
          ? _value.checkBoxList
          : checkBoxList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<InterestModel, bool>>,
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
abstract class _$$_RegisterUIStateCopyWith<$Res>
    implements $RegisterUIStateCopyWith<$Res> {
  factory _$$_RegisterUIStateCopyWith(
          _$_RegisterUIState value, $Res Function(_$_RegisterUIState) then) =
      __$$_RegisterUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isTurnOn,
      bool isSuccess,
      List<InterestModel> interests,
      AsyncValue<Map<InterestModel, bool>> checkBoxList,
      String errorMessage,
      String errorMail,
      String errorPassword,
      String errorConfirmPassword});
}

/// @nodoc
class __$$_RegisterUIStateCopyWithImpl<$Res>
    extends _$RegisterUIStateCopyWithImpl<$Res, _$_RegisterUIState>
    implements _$$_RegisterUIStateCopyWith<$Res> {
  __$$_RegisterUIStateCopyWithImpl(
      _$_RegisterUIState _value, $Res Function(_$_RegisterUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTurnOn = null,
    Object? isSuccess = null,
    Object? interests = null,
    Object? checkBoxList = null,
    Object? errorMessage = null,
    Object? errorMail = null,
    Object? errorPassword = null,
    Object? errorConfirmPassword = null,
  }) {
    return _then(_$_RegisterUIState(
      isTurnOn: null == isTurnOn
          ? _value.isTurnOn
          : isTurnOn // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      interests: null == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<InterestModel>,
      checkBoxList: null == checkBoxList
          ? _value.checkBoxList
          : checkBoxList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<InterestModel, bool>>,
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

class _$_RegisterUIState implements _RegisterUIState {
  _$_RegisterUIState(
      {this.isTurnOn = true,
      this.isSuccess = false,
      final List<InterestModel> interests = const [],
      this.checkBoxList = const AsyncValue.loading(),
      this.errorMessage = '',
      this.errorMail = '',
      this.errorPassword = '',
      this.errorConfirmPassword = ''})
      : _interests = interests;

  @override
  @JsonKey()
  final bool isTurnOn;
  @override
  @JsonKey()
  final bool isSuccess;
  final List<InterestModel> _interests;
  @override
  @JsonKey()
  List<InterestModel> get interests {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  @override
  @JsonKey()
  final AsyncValue<Map<InterestModel, bool>> checkBoxList;
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
    return 'RegisterUIState(isTurnOn: $isTurnOn, isSuccess: $isSuccess, interests: $interests, checkBoxList: $checkBoxList, errorMessage: $errorMessage, errorMail: $errorMail, errorPassword: $errorPassword, errorConfirmPassword: $errorConfirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterUIState &&
            (identical(other.isTurnOn, isTurnOn) ||
                other.isTurnOn == isTurnOn) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            (identical(other.checkBoxList, checkBoxList) ||
                other.checkBoxList == checkBoxList) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      isTurnOn,
      isSuccess,
      const DeepCollectionEquality().hash(_interests),
      checkBoxList,
      errorMessage,
      errorMail,
      errorPassword,
      errorConfirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterUIStateCopyWith<_$_RegisterUIState> get copyWith =>
      __$$_RegisterUIStateCopyWithImpl<_$_RegisterUIState>(this, _$identity);
}

abstract class _RegisterUIState implements RegisterUIState {
  factory _RegisterUIState(
      {final bool isTurnOn,
      final bool isSuccess,
      final List<InterestModel> interests,
      final AsyncValue<Map<InterestModel, bool>> checkBoxList,
      final String errorMessage,
      final String errorMail,
      final String errorPassword,
      final String errorConfirmPassword}) = _$_RegisterUIState;

  @override
  bool get isTurnOn;
  @override
  bool get isSuccess;
  @override
  List<InterestModel> get interests;
  @override
  AsyncValue<Map<InterestModel, bool>> get checkBoxList;
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
  _$$_RegisterUIStateCopyWith<_$_RegisterUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
