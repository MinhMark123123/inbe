/*
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecondScreenUIState {
  final counterProvider = StateProvider.autoDispose<int>((ref) {
    return 0;
  });
  StateController<int> get counter => counterProvider.state;
}
*/
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ui_state.freezed.dart';

@freezed
class SecondScreenUIState with _$SecondScreenUIState {
  factory SecondScreenUIState({
    @Default(0)
    int counter,
    @Default([])
    List<String> images,
  }) = _SecondScreenUIState;

}
