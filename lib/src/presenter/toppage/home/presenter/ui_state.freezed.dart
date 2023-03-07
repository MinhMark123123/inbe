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
mixin _$HomeUIState {
  List<TopSliderModel> get topSlides => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<NotificationModel> get notifications =>
      throw _privateConstructorUsedError;
  List<ConvenienceModel> get conveniences => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeUIStateCopyWith<HomeUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeUIStateCopyWith<$Res> {
  factory $HomeUIStateCopyWith(
          HomeUIState value, $Res Function(HomeUIState) then) =
      _$HomeUIStateCopyWithImpl<$Res, HomeUIState>;
  @useResult
  $Res call(
      {List<TopSliderModel> topSlides,
      List<String> images,
      List<NotificationModel> notifications,
      List<ConvenienceModel> conveniences,
      String errorMessage});
}

/// @nodoc
class _$HomeUIStateCopyWithImpl<$Res, $Val extends HomeUIState>
    implements $HomeUIStateCopyWith<$Res> {
  _$HomeUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topSlides = null,
    Object? images = null,
    Object? notifications = null,
    Object? conveniences = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      topSlides: null == topSlides
          ? _value.topSlides
          : topSlides // ignore: cast_nullable_to_non_nullable
              as List<TopSliderModel>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      conveniences: null == conveniences
          ? _value.conveniences
          : conveniences // ignore: cast_nullable_to_non_nullable
              as List<ConvenienceModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeUIStateCopyWith<$Res>
    implements $HomeUIStateCopyWith<$Res> {
  factory _$$_HomeUIStateCopyWith(
          _$_HomeUIState value, $Res Function(_$_HomeUIState) then) =
      __$$_HomeUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TopSliderModel> topSlides,
      List<String> images,
      List<NotificationModel> notifications,
      List<ConvenienceModel> conveniences,
      String errorMessage});
}

/// @nodoc
class __$$_HomeUIStateCopyWithImpl<$Res>
    extends _$HomeUIStateCopyWithImpl<$Res, _$_HomeUIState>
    implements _$$_HomeUIStateCopyWith<$Res> {
  __$$_HomeUIStateCopyWithImpl(
      _$_HomeUIState _value, $Res Function(_$_HomeUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topSlides = null,
    Object? images = null,
    Object? notifications = null,
    Object? conveniences = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_HomeUIState(
      topSlides: null == topSlides
          ? _value._topSlides
          : topSlides // ignore: cast_nullable_to_non_nullable
              as List<TopSliderModel>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      conveniences: null == conveniences
          ? _value._conveniences
          : conveniences // ignore: cast_nullable_to_non_nullable
              as List<ConvenienceModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HomeUIState implements _HomeUIState {
  _$_HomeUIState(
      {final List<TopSliderModel> topSlides = const [],
      final List<String> images = const [],
      final List<NotificationModel> notifications = const [],
      final List<ConvenienceModel> conveniences = const [],
      this.errorMessage = ''})
      : _topSlides = topSlides,
        _images = images,
        _notifications = notifications,
        _conveniences = conveniences;

  final List<TopSliderModel> _topSlides;
  @override
  @JsonKey()
  List<TopSliderModel> get topSlides {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topSlides);
  }

  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<NotificationModel> _notifications;
  @override
  @JsonKey()
  List<NotificationModel> get notifications {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  final List<ConvenienceModel> _conveniences;
  @override
  @JsonKey()
  List<ConvenienceModel> get conveniences {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conveniences);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'HomeUIState(topSlides: $topSlides, images: $images, notifications: $notifications, conveniences: $conveniences, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeUIState &&
            const DeepCollectionEquality()
                .equals(other._topSlides, _topSlides) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            const DeepCollectionEquality()
                .equals(other._conveniences, _conveniences) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topSlides),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_notifications),
      const DeepCollectionEquality().hash(_conveniences),
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeUIStateCopyWith<_$_HomeUIState> get copyWith =>
      __$$_HomeUIStateCopyWithImpl<_$_HomeUIState>(this, _$identity);
}

abstract class _HomeUIState implements HomeUIState {
  factory _HomeUIState(
      {final List<TopSliderModel> topSlides,
      final List<String> images,
      final List<NotificationModel> notifications,
      final List<ConvenienceModel> conveniences,
      final String errorMessage}) = _$_HomeUIState;

  @override
  List<TopSliderModel> get topSlides;
  @override
  List<String> get images;
  @override
  List<NotificationModel> get notifications;
  @override
  List<ConvenienceModel> get conveniences;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_HomeUIStateCopyWith<_$_HomeUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
