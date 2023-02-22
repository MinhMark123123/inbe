// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'related_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RelatedUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  AsyncValue<List<OtherAppModel>> get otherApps =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RelatedUIStateCopyWith<RelatedUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedUIStateCopyWith<$Res> {
  factory $RelatedUIStateCopyWith(
          RelatedUIState value, $Res Function(RelatedUIState) then) =
      _$RelatedUIStateCopyWithImpl<$Res, RelatedUIState>;
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      AsyncValue<List<OtherAppModel>> otherApps});
}

/// @nodoc
class _$RelatedUIStateCopyWithImpl<$Res, $Val extends RelatedUIState>
    implements $RelatedUIStateCopyWith<$Res> {
  _$RelatedUIStateCopyWithImpl(this._value, this._then);

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
              as AsyncValue<List<OtherAppModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RelatedUIStateCopyWith<$Res>
    implements $RelatedUIStateCopyWith<$Res> {
  factory _$$_RelatedUIStateCopyWith(
          _$_RelatedUIState value, $Res Function(_$_RelatedUIState) then) =
      __$$_RelatedUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      AsyncValue<List<OtherAppModel>> otherApps});
}

/// @nodoc
class __$$_RelatedUIStateCopyWithImpl<$Res>
    extends _$RelatedUIStateCopyWithImpl<$Res, _$_RelatedUIState>
    implements _$$_RelatedUIStateCopyWith<$Res> {
  __$$_RelatedUIStateCopyWithImpl(
      _$_RelatedUIState _value, $Res Function(_$_RelatedUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? otherApps = null,
  }) {
    return _then(_$_RelatedUIState(
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
              as AsyncValue<List<OtherAppModel>>,
    ));
  }
}

/// @nodoc

class _$_RelatedUIState implements _RelatedUIState {
  _$_RelatedUIState(
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
  final AsyncValue<List<OtherAppModel>> otherApps;

  @override
  String toString() {
    return 'RelatedUIState(isSuccess: $isSuccess, errorMessage: $errorMessage, otherApps: $otherApps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RelatedUIState &&
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
  _$$_RelatedUIStateCopyWith<_$_RelatedUIState> get copyWith =>
      __$$_RelatedUIStateCopyWithImpl<_$_RelatedUIState>(this, _$identity);
}

abstract class _RelatedUIState implements RelatedUIState {
  factory _RelatedUIState(
      {final bool isSuccess,
      final String errorMessage,
      final AsyncValue<List<OtherAppModel>> otherApps}) = _$_RelatedUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMessage;
  @override
  AsyncValue<List<OtherAppModel>> get otherApps;
  @override
  @JsonKey(ignore: true)
  _$$_RelatedUIStateCopyWith<_$_RelatedUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
