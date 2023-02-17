import 'package:riverpod/riverpod.dart';

final topControllerProvider = StateNotifierProvider<TopPageController, int>((ref) {
  return TopPageController(0);
});

class TopPageController extends StateNotifier<int> {
  TopPageController(super.state);

  void setPosition(int value) {
    state = value;
  }

}