// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventUIState {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  AsyncValue<List<EventModel>> get events => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventUIStateCopyWith<EventUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventUIStateCopyWith<$Res> {
  factory $EventUIStateCopyWith(
          EventUIState value, $Res Function(EventUIState) then) =
      _$EventUIStateCopyWithImpl<$Res, EventUIState>;
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      AsyncValue<List<EventModel>> events});
}

/// @nodoc
class _$EventUIStateCopyWithImpl<$Res, $Val extends EventUIState>
    implements $EventUIStateCopyWith<$Res> {
  _$EventUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? events = null,
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
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<EventModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventUIStateCopyWith<$Res>
    implements $EventUIStateCopyWith<$Res> {
  factory _$$_EventUIStateCopyWith(
          _$_EventUIState value, $Res Function(_$_EventUIState) then) =
      __$$_EventUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSuccess,
      String errorMessage,
      AsyncValue<List<EventModel>> events});
}

/// @nodoc
class __$$_EventUIStateCopyWithImpl<$Res>
    extends _$EventUIStateCopyWithImpl<$Res, _$_EventUIState>
    implements _$$_EventUIStateCopyWith<$Res> {
  __$$_EventUIStateCopyWithImpl(
      _$_EventUIState _value, $Res Function(_$_EventUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? events = null,
  }) {
    return _then(_$_EventUIState(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<EventModel>>,
    ));
  }
}

/// @nodoc

class _$_EventUIState implements _EventUIState {
  _$_EventUIState(
      {this.isSuccess = false,
      this.errorMessage = '',
      this.events = const AsyncValue.loading()});

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final AsyncValue<List<EventModel>> events;

  @override
  String toString() {
    return 'EventUIState(isSuccess: $isSuccess, errorMessage: $errorMessage, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventUIState &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.events, events) || other.events == events));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, errorMessage, events);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventUIStateCopyWith<_$_EventUIState> get copyWith =>
      __$$_EventUIStateCopyWithImpl<_$_EventUIState>(this, _$identity);
}

abstract class _EventUIState implements EventUIState {
  factory _EventUIState(
      {final bool isSuccess,
      final String errorMessage,
      final AsyncValue<List<EventModel>> events}) = _$_EventUIState;

  @override
  bool get isSuccess;
  @override
  String get errorMessage;
  @override
  AsyncValue<List<EventModel>> get events;
  @override
  @JsonKey(ignore: true)
  _$$_EventUIStateCopyWith<_$_EventUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
