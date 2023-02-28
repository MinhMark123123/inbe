// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuUIStateCopyWith<MenuUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuUIStateCopyWith<$Res> {
  factory $MenuUIStateCopyWith(
          MenuUIState value, $Res Function(MenuUIState) then) =
      _$MenuUIStateCopyWithImpl<$Res, MenuUIState>;
  @useResult
  $Res call({bool isSuccess, String errorMsg});
}

/// @nodoc
class _$MenuUIStateCopyWithImpl<$Res, $Val extends MenuUIState>
    implements $MenuUIStateCopyWith<$Res> {
  _$MenuUIStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_MenuUIStateCopyWith<$Res>
    implements $MenuUIStateCopyWith<$Res> {
  factory _$$_MenuUIStateCopyWith(
          _$_MenuUIState value, $Res Function(_$_MenuUIState) then) =
      __$$_MenuUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSuccess, String errorMsg});
}

/// @nodoc
class __$$_MenuUIStateCopyWithImpl<$Res>
    extends _$MenuUIStateCopyWithImpl<$Res, _$_MenuUIState>
    implements _$$_MenuUIStateCopyWith<$Res> {
  __$$_MenuUIStateCopyWithImpl(
      _$_MenuUIState _value, $Res Function(_$_MenuUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMsg = null,
  }) {
    return _then(_$_MenuUIState(
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

class _$_MenuUIState implements _MenuUIState {
  _$_MenuUIState({this.isSuccess = false, this.errorMsg = ''});

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMsg;

  @override
  String toString() {
    return 'MenuUIState(isSuccess: $isSuccess, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuUIState &&
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
  _$$_MenuUIStateCopyWith<_$_MenuUIState> get copyWith =>
      __$$_MenuUIStateCopyWithImpl<_$_MenuUIState>(this, _$identity);
}

abstract class _MenuUIState implements MenuUIState {
  factory _MenuUIState({final bool isSuccess, final String errorMsg}) =
      _$_MenuUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMsg;
  @override
  @JsonKey(ignore: true)
  _$$_MenuUIStateCopyWith<_$_MenuUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
