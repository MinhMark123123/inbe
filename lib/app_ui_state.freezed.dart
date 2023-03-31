// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppUIState {
  String get pathNotification => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppUIStateCopyWith<AppUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUIStateCopyWith<$Res> {
  factory $AppUIStateCopyWith(
          AppUIState value, $Res Function(AppUIState) then) =
      _$AppUIStateCopyWithImpl<$Res, AppUIState>;
  @useResult
  $Res call({String pathNotification});
}

/// @nodoc
class _$AppUIStateCopyWithImpl<$Res, $Val extends AppUIState>
    implements $AppUIStateCopyWith<$Res> {
  _$AppUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathNotification = null,
  }) {
    return _then(_value.copyWith(
      pathNotification: null == pathNotification
          ? _value.pathNotification
          : pathNotification // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUIStateCopyWith<$Res>
    implements $AppUIStateCopyWith<$Res> {
  factory _$$_AppUIStateCopyWith(
          _$_AppUIState value, $Res Function(_$_AppUIState) then) =
      __$$_AppUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pathNotification});
}

/// @nodoc
class __$$_AppUIStateCopyWithImpl<$Res>
    extends _$AppUIStateCopyWithImpl<$Res, _$_AppUIState>
    implements _$$_AppUIStateCopyWith<$Res> {
  __$$_AppUIStateCopyWithImpl(
      _$_AppUIState _value, $Res Function(_$_AppUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathNotification = null,
  }) {
    return _then(_$_AppUIState(
      pathNotification: null == pathNotification
          ? _value.pathNotification
          : pathNotification // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppUIState implements _AppUIState {
  _$_AppUIState({this.pathNotification = ''});

  @override
  @JsonKey()
  final String pathNotification;

  @override
  String toString() {
    return 'AppUIState(pathNotification: $pathNotification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUIState &&
            (identical(other.pathNotification, pathNotification) ||
                other.pathNotification == pathNotification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pathNotification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUIStateCopyWith<_$_AppUIState> get copyWith =>
      __$$_AppUIStateCopyWithImpl<_$_AppUIState>(this, _$identity);
}

abstract class _AppUIState implements AppUIState {
  factory _AppUIState({final String pathNotification}) = _$_AppUIState;

  @override
  String get pathNotification;
  @override
  @JsonKey(ignore: true)
  _$$_AppUIStateCopyWith<_$_AppUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
