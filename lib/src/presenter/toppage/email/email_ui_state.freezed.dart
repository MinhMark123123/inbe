// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'email_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailUIState {
  bool get isLoadedPage => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<EmailModel> get dataList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailUIStateCopyWith<EmailUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailUIStateCopyWith<$Res> {
  factory $EmailUIStateCopyWith(
          EmailUIState value, $Res Function(EmailUIState) then) =
      _$EmailUIStateCopyWithImpl<$Res, EmailUIState>;
  @useResult
  $Res call(
      {bool isLoadedPage,
      bool isSuccess,
      String errorMessage,
      List<EmailModel> dataList});
}

/// @nodoc
class _$EmailUIStateCopyWithImpl<$Res, $Val extends EmailUIState>
    implements $EmailUIStateCopyWith<$Res> {
  _$EmailUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadedPage = null,
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? dataList = null,
  }) {
    return _then(_value.copyWith(
      isLoadedPage: null == isLoadedPage
          ? _value.isLoadedPage
          : isLoadedPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      dataList: null == dataList
          ? _value.dataList
          : dataList // ignore: cast_nullable_to_non_nullable
              as List<EmailModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailUIStateCopyWith<$Res>
    implements $EmailUIStateCopyWith<$Res> {
  factory _$$_EmailUIStateCopyWith(
          _$_EmailUIState value, $Res Function(_$_EmailUIState) then) =
      __$$_EmailUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadedPage,
      bool isSuccess,
      String errorMessage,
      List<EmailModel> dataList});
}

/// @nodoc
class __$$_EmailUIStateCopyWithImpl<$Res>
    extends _$EmailUIStateCopyWithImpl<$Res, _$_EmailUIState>
    implements _$$_EmailUIStateCopyWith<$Res> {
  __$$_EmailUIStateCopyWithImpl(
      _$_EmailUIState _value, $Res Function(_$_EmailUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadedPage = null,
    Object? isSuccess = null,
    Object? errorMessage = null,
    Object? dataList = null,
  }) {
    return _then(_$_EmailUIState(
      isLoadedPage: null == isLoadedPage
          ? _value.isLoadedPage
          : isLoadedPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      dataList: null == dataList
          ? _value._dataList
          : dataList // ignore: cast_nullable_to_non_nullable
              as List<EmailModel>,
    ));
  }
}

/// @nodoc

class _$_EmailUIState implements _EmailUIState {
  _$_EmailUIState(
      {this.isLoadedPage = true,
      this.isSuccess = false,
      this.errorMessage = '',
      final List<EmailModel> dataList = const []})
      : _dataList = dataList;

  @override
  @JsonKey()
  final bool isLoadedPage;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final String errorMessage;
  final List<EmailModel> _dataList;
  @override
  @JsonKey()
  List<EmailModel> get dataList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataList);
  }

  @override
  String toString() {
    return 'EmailUIState(isLoadedPage: $isLoadedPage, isSuccess: $isSuccess, errorMessage: $errorMessage, dataList: $dataList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailUIState &&
            (identical(other.isLoadedPage, isLoadedPage) ||
                other.isLoadedPage == isLoadedPage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._dataList, _dataList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoadedPage, isSuccess,
      errorMessage, const DeepCollectionEquality().hash(_dataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailUIStateCopyWith<_$_EmailUIState> get copyWith =>
      __$$_EmailUIStateCopyWithImpl<_$_EmailUIState>(this, _$identity);
}

abstract class _EmailUIState implements EmailUIState {
  factory _EmailUIState(
      {final bool isLoadedPage,
      final bool isSuccess,
      final String errorMessage,
      final List<EmailModel> dataList}) = _$_EmailUIState;

  @override
  bool get isLoadedPage;
  @override
  bool get isSuccess;
  @override
  String get errorMessage;
  @override
  List<EmailModel> get dataList;
  @override
  @JsonKey(ignore: true)
  _$$_EmailUIStateCopyWith<_$_EmailUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
