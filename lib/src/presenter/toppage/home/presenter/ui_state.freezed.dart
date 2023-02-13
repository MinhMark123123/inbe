// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SecondScreenUIState {
  int get counter => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SecondScreenUIStateCopyWith<SecondScreenUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecondScreenUIStateCopyWith<$Res> {
  factory $SecondScreenUIStateCopyWith(
          SecondScreenUIState value, $Res Function(SecondScreenUIState) then) =
      _$SecondScreenUIStateCopyWithImpl<$Res, SecondScreenUIState>;
  @useResult
  $Res call({int counter, List<String> images});
}

/// @nodoc
class _$SecondScreenUIStateCopyWithImpl<$Res, $Val extends SecondScreenUIState>
    implements $SecondScreenUIStateCopyWith<$Res> {
  _$SecondScreenUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SecondScreenUIStateCopyWith<$Res>
    implements $SecondScreenUIStateCopyWith<$Res> {
  factory _$$_SecondScreenUIStateCopyWith(_$_SecondScreenUIState value,
          $Res Function(_$_SecondScreenUIState) then) =
      __$$_SecondScreenUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter, List<String> images});
}

/// @nodoc
class __$$_SecondScreenUIStateCopyWithImpl<$Res>
    extends _$SecondScreenUIStateCopyWithImpl<$Res, _$_SecondScreenUIState>
    implements _$$_SecondScreenUIStateCopyWith<$Res> {
  __$$_SecondScreenUIStateCopyWithImpl(_$_SecondScreenUIState _value,
      $Res Function(_$_SecondScreenUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? images = null,
  }) {
    return _then(_$_SecondScreenUIState(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SecondScreenUIState implements _SecondScreenUIState {
  _$_SecondScreenUIState(
      {this.counter = 0, final List<String> images = const []})
      : _images = images;

  @override
  @JsonKey()
  final int counter;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'SecondScreenUIState(counter: $counter, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SecondScreenUIState &&
            (identical(other.counter, counter) || other.counter == counter) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, counter, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SecondScreenUIStateCopyWith<_$_SecondScreenUIState> get copyWith =>
      __$$_SecondScreenUIStateCopyWithImpl<_$_SecondScreenUIState>(
          this, _$identity);
}

abstract class _SecondScreenUIState implements SecondScreenUIState {
  factory _SecondScreenUIState({final int counter, final List<String> images}) =
      _$_SecondScreenUIState;

  @override
  int get counter;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$_SecondScreenUIStateCopyWith<_$_SecondScreenUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
