import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/model/faq_model.dart';
import 'package:inabe/src/data/model/other_app_model.dart';
import 'package:inabe/src/data/repository/toppage/top_repository.dart';
import 'package:inabe/src/presenter/faq/faq_ui_state.dart';
import 'package:inabe/src/presenter/related_apps/related_ui_state.dart';

final _faqUiStateProvider =
StateProvider.autoDispose<FAQUIState>((ref) {
  return FAQUIState();
});

final faqViewModelProvider = Provider.autoDispose<FAQViewModel>((ref) {
  return FAQViewModel(
    uiState: ref.watch(_faqUiStateProvider.notifier),
    topRepository: ref.read(topRepositoryProvider),
  );
});

class FAQViewModel extends ViewModel {
  final TopRepository topRepository;
  final StateController<FAQUIState> uiState;

  ProviderListenable<AsyncValue<List<FAQModel>>> get faqModels =>
      ui.select((value) => value.otherApps);

  AutoDisposeStateProvider<FAQUIState> get ui => _faqUiStateProvider;

  FAQViewModel({required this.uiState, required this.topRepository});

  @override
  void onInitState() {
    super.onInitState();
    getFAQs();
  }

  Future<void> getFAQs() async {
    topRepository.getFAQs().then((value) => {

      uiState.update((state) => state.copyWith(otherApps: AsyncValue.data(value.data)))
    }).catchError((error) {
      ApiError(error, errorData: (code, msg) {

      });
    });
  }
}
