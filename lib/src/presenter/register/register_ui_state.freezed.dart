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
  bool get disableButton => throw _privateConstructorUsedError;
  List<InterestModel> get interests => throw _privateConstructorUsedError;
  AsyncValue<Map<InterestModel, bool>> get checkBoxList =>
      throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

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
      bool disableButton,
      List<InterestModel> interests,
      AsyncValue<Map<InterestModel, bool>> checkBoxList,
      String errorMessage});
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
    Object? disableButton = null,
    Object? interests = null,
    Object? checkBoxList = null,
    Object? errorMessage = null,
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
      disableButton: null == disableButton
          ? _value.disableButton
          : disableButton // ignore: cast_nullable_to_non_nullable
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
      bool disableButton,
      List<InterestModel> interests,
      AsyncValue<Map<InterestModel, bool>> checkBoxList,
      String errorMessage});
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
    Object? disableButton = null,
    Object? interests = null,
    Object? checkBoxList = null,
    Object? errorMessage = null,
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
      disableButton: null == disableButton
          ? _value.disableButton
          : disableButton // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$_RegisterUIState implements _RegisterUIState {
  _$_RegisterUIState(
      {this.isTurnOn = true,
      this.isSuccess = false,
      this.disableButton = true,
      final List<InterestModel> interests = const [],
      this.checkBoxList = const AsyncValue.loading(),
      this.errorMessage = ''})
      : _interests = interests;

  @override
  @JsonKey()
  final bool isTurnOn;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool disableButton;
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
  String toString() {
    return 'RegisterUIState(isTurnOn: $isTurnOn, isSuccess: $isSuccess, disableButton: $disableButton, interests: $interests, checkBoxList: $checkBoxList, errorMessage: $errorMessage)';
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
            (identical(other.disableButton, disableButton) ||
                other.disableButton == disableButton) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            (identical(other.checkBoxList, checkBoxList) ||
                other.checkBoxList == checkBoxList) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isTurnOn,
      isSuccess,
      disableButton,
      const DeepCollectionEquality().hash(_interests),
      checkBoxList,
      errorMessage);

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
      final bool disableButton,
      final List<InterestModel> interests,
      final AsyncValue<Map<InterestModel, bool>> checkBoxList,
      final String errorMessage}) = _$_RegisterUIState;

  @override
  bool get isTurnOn;
  @override
  bool get isSuccess;
  @override
  bool get disableButton;
  @override
  List<InterestModel> get interests;
  @override
  AsyncValue<Map<InterestModel, bool>> get checkBoxList;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterUIStateCopyWith<_$_RegisterUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
