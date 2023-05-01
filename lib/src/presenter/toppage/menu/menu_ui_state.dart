import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inabe/src/data/dto/response/user_response.dart';
import 'package:inabe/src/data/model/interest_model.dart';
import 'package:inabe/src/data/model/user.dart';
import 'package:riverpod/riverpod.dart';

part 'menu_ui_state.freezed.dart';

@freezed
class MenuUIState with _$MenuUIState {
  factory MenuUIState({
    @Default(false) bool isSignOut,
    @Default(false) bool isSuccess,
    @Default('') String tokenFCM,
    @Default('') String errorMsg,
  }) = _MenuUIState;
}