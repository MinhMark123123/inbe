// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'electronic_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ElectronicAppUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get selectCategory => throw _privateConstructorUsedError;
  String get selectMidCategory => throw _privateConstructorUsedError;
  AsyncValue<List<ElectronicAppModel>> get otherApps =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ElectronicAppUIStateCopyWith<ElectronicAppUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectronicAppUIStateCopyWith<$Res> {
  factory $ElectronicAppUIStateCopyWith(ElectronicAppUIState value,
          $Res Function(ElectronicAppUIState) then) =
      _$ElectronicAppUIStateCopyWithImpl<$Res, ElectronicAppUIState>;
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      String selectCategory,
      String selectMidCategory,
      AsyncValue<List<ElectronicAppModel>> otherApps});
}

/// @nodoc
class _$ElectronicAppUIStateCopyWithImpl<$Res,
        $Val extends ElectronicAppUIState>
    implements $ElectronicAppUIStateCopyWith<$Res> {
  _$ElectronicAppUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? selectCategory = null,
    Object? selectMidCategory = null,
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
      selectCategory: null == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as String,
      selectMidCategory: null == selectMidCategory
          ? _value.selectMidCategory
          : selectMidCategory // ignore: cast_nullable_to_non_nullable
              as String,
      otherApps: null == otherApps
          ? _value.otherApps
          : otherApps // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ElectronicAppModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ElectronicAppUIStateCopyWith<$Res>
    implements $ElectronicAppUIStateCopyWith<$Res> {
  factory _$$_ElectronicAppUIStateCopyWith(_$_ElectronicAppUIState value,
          $Res Function(_$_ElectronicAppUIState) then) =
      __$$_ElectronicAppUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      String selectCategory,
      String selectMidCategory,
      AsyncValue<List<ElectronicAppModel>> otherApps});
}

/// @nodoc
class __$$_ElectronicAppUIStateCopyWithImpl<$Res>
    extends _$ElectronicAppUIStateCopyWithImpl<$Res, _$_ElectronicAppUIState>
    implements _$$_ElectronicAppUIStateCopyWith<$Res> {
  __$$_ElectronicAppUIStateCopyWithImpl(_$_ElectronicAppUIState _value,
      $Res Function(_$_ElectronicAppUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? selectCategory = null,
    Object? selectMidCategory = null,
    Object? otherApps = null,
  }) {
    return _then(_$_ElectronicAppUIState(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectCategory: null == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as String,
      selectMidCategory: null == selectMidCategory
          ? _value.selectMidCategory
          : selectMidCategory // ignore: cast_nullable_to_non_nullable
              as String,
      otherApps: null == otherApps
          ? _value.otherApps
          : otherApps // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ElectronicAppModel>>,
    ));
  }
}

/// @nodoc

class _$_ElectronicAppUIState implements _ElectronicAppUIState {
  _$_ElectronicAppUIState(
      {this.isSuccess = false,
      this.errorMessage = '',
      this.selectCategory = '',
      this.selectMidCategory = '',
      this.otherApps = const AsyncValue.loading()});

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String selectCategory;
  @override
  @JsonKey()
  final String selectMidCategory;
  @override
  @JsonKey()
  final AsyncValue<List<ElectronicAppModel>> otherApps;

  @override
  String toString() {
    return 'ElectronicAppUIState(isSuccess: $isSuccess, errorMessage: $errorMessage, selectCategory: $selectCategory, selectMidCategory: $selectMidCategory, otherApps: $otherApps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElectronicAppUIState &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectCategory, selectCategory) ||
                other.selectCategory == selectCategory) &&
            (identical(other.selectMidCategory, selectMidCategory) ||
                other.selectMidCategory == selectMidCategory) &&
            (identical(other.otherApps, otherApps) ||
                other.otherApps == otherApps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, errorMessage,
      selectCategory, selectMidCategory, otherApps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElectronicAppUIStateCopyWith<_$_ElectronicAppUIState> get copyWith =>
      __$$_ElectronicAppUIStateCopyWithImpl<_$_ElectronicAppUIState>(
          this, _$identity);
}

abstract class _ElectronicAppUIState implements ElectronicAppUIState {
  factory _ElectronicAppUIState(
          {final bool isSuccess,
          final String errorMessage,
          final String selectCategory,
          final String selectMidCategory,
          final AsyncValue<List<ElectronicAppModel>> otherApps}) =
      _$_ElectronicAppUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMessage;
  @override
  String get selectCategory;
  @override
  String get selectMidCategory;
  @override
  AsyncValue<List<ElectronicAppModel>> get otherApps;
  @override
  @JsonKey(ignore: true)
  _$$_ElectronicAppUIStateCopyWith<_$_ElectronicAppUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
