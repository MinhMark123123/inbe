// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'living_book_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LivingBookUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  AsyncValue<List<LivingGuideModel>> get livingGuides =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LivingBookUIStateCopyWith<LivingBookUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivingBookUIStateCopyWith<$Res> {
  factory $LivingBookUIStateCopyWith(
          LivingBookUIState value, $Res Function(LivingBookUIState) then) =
      _$LivingBookUIStateCopyWithImpl<$Res, LivingBookUIState>;
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      AsyncValue<List<LivingGuideModel>> livingGuides});
}

/// @nodoc
class _$LivingBookUIStateCopyWithImpl<$Res, $Val extends LivingBookUIState>
    implements $LivingBookUIStateCopyWith<$Res> {
  _$LivingBookUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? livingGuides = null,
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
      livingGuides: null == livingGuides
          ? _value.livingGuides
          : livingGuides // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<LivingGuideModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LivingBookUIStateCopyWith<$Res>
    implements $LivingBookUIStateCopyWith<$Res> {
  factory _$$_LivingBookUIStateCopyWith(_$_LivingBookUIState value,
          $Res Function(_$_LivingBookUIState) then) =
      __$$_LivingBookUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      AsyncValue<List<LivingGuideModel>> livingGuides});
}

/// @nodoc
class __$$_LivingBookUIStateCopyWithImpl<$Res>
    extends _$LivingBookUIStateCopyWithImpl<$Res, _$_LivingBookUIState>
    implements _$$_LivingBookUIStateCopyWith<$Res> {
  __$$_LivingBookUIStateCopyWithImpl(
      _$_LivingBookUIState _value, $Res Function(_$_LivingBookUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? livingGuides = null,
  }) {
    return _then(_$_LivingBookUIState(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      livingGuides: null == livingGuides
          ? _value.livingGuides
          : livingGuides // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<LivingGuideModel>>,
    ));
  }
}

/// @nodoc

class _$_LivingBookUIState implements _LivingBookUIState {
  _$_LivingBookUIState(
      {this.isSuccess = false,
      this.errorMessage = '',
      this.livingGuides = const AsyncValue.loading()});

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final AsyncValue<List<LivingGuideModel>> livingGuides;

  @override
  String toString() {
    return 'LivingBookUIState(isSuccess: $isSuccess, errorMessage: $errorMessage, livingGuides: $livingGuides)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LivingBookUIState &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.livingGuides, livingGuides) ||
                other.livingGuides == livingGuides));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isSuccess, errorMessage, livingGuides);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LivingBookUIStateCopyWith<_$_LivingBookUIState> get copyWith =>
      __$$_LivingBookUIStateCopyWithImpl<_$_LivingBookUIState>(
          this, _$identity);
}

abstract class _LivingBookUIState implements LivingBookUIState {
  factory _LivingBookUIState(
          {final bool isSuccess,
          final String errorMessage,
          final AsyncValue<List<LivingGuideModel>> livingGuides}) =
      _$_LivingBookUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMessage;
  @override
  AsyncValue<List<LivingGuideModel>> get livingGuides;
  @override
  @JsonKey(ignore: true)
  _$$_LivingBookUIStateCopyWith<_$_LivingBookUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
