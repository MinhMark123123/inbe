// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'faq_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FAQUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  AsyncValue<List<FAQModel>> get otherApps =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FAQUIStateCopyWith<FAQUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQUIStateCopyWith<$Res> {
  factory $FAQUIStateCopyWith(
          FAQUIState value, $Res Function(FAQUIState) then) =
      _$FAQUIStateCopyWithImpl<$Res, FAQUIState>;
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      AsyncValue<List<FAQModel>> otherApps});
}

/// @nodoc
class _$FAQUIStateCopyWithImpl<$Res, $Val extends FAQUIState>
    implements $FAQUIStateCopyWith<$Res> {
  _$FAQUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? otherApps = null,
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
      otherApps: null == otherApps
          ? _value.otherApps
          : otherApps // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<FAQModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FAQUIStateCopyWith<$Res>
    implements $FAQUIStateCopyWith<$Res> {
  factory _$$_FAQUIStateCopyWith(
          _$_FAQUIState value, $Res Function(_$_FAQUIState) then) =
      __$$_FAQUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      AsyncValue<List<FAQModel>> otherApps});
}

/// @nodoc
class __$$_FAQUIStateCopyWithImpl<$Res>
    extends _$FAQUIStateCopyWithImpl<$Res, _$_FAQUIState>
    implements _$$_FAQUIStateCopyWith<$Res> {
  __$$_FAQUIStateCopyWithImpl(
      _$_FAQUIState _value, $Res Function(_$_FAQUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? otherApps = null,
  }) {
    return _then(_$_FAQUIState(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      otherApps: null == otherApps
          ? _value.otherApps
          : otherApps // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<FAQModel>>,
    ));
  }
}

/// @nodoc

class _$_FAQUIState implements _FAQUIState {
  _$_FAQUIState(
      {this.isSuccess = false,
      this.errorMessage = '',
      this.otherApps = const AsyncValue.loading()});

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final AsyncValue<List<FAQModel>> otherApps;

  @override
  String toString() {
    return 'FAQUIState(isSuccess: $isSuccess, errorMessage: $errorMessage, otherApps: $otherApps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FAQUIState &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.otherApps, otherApps) ||
                other.otherApps == otherApps));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isSuccess, errorMessage, otherApps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FAQUIStateCopyWith<_$_FAQUIState> get copyWith =>
      __$$_FAQUIStateCopyWithImpl<_$_FAQUIState>(this, _$identity);
}

abstract class _FAQUIState implements FAQUIState {
  factory _FAQUIState(
      {final bool isSuccess,
      final String errorMessage,
      final AsyncValue<List<FAQModel>> otherApps}) = _$_FAQUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMessage;
  @override
  AsyncValue<List<FAQModel>> get otherApps;
  @override
  @JsonKey(ignore: true)
  _$$_FAQUIStateCopyWith<_$_FAQUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
