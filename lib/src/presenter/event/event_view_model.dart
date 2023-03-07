import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/event_model.dart';
import 'package:inabe/src/data/repository/user/event_repository.dart';
import 'package:inabe/src/presenter/event/event_ui_state.dart';

final _eventPageUiStateProvider =
    StateProvider.autoDispose<EventUIState>((ref) {
  return EventUIState();
});

final eventViewModelProvider = Provider.autoDispose<EventViewModel>((ref) {
  return EventViewModel(
    eventRepository: ref.read(eventRepositoryProvider),
    uiState: ref.watch(_eventPageUiStateProvider.notifier),
  );
});

class EventViewModel extends ViewModel {
  final EventRepository eventRepository;
  final StateController<EventUIState> uiState;

  EventViewModel({required this.uiState, required this.eventRepository});

  ProviderListenable<AsyncValue<List<EventModel>>> get eventsProvider =>
      ui.select((value) => value.events);

  AutoDisposeStateProvider<EventUIState> get ui => _eventPageUiStateProvider;

  @override
  void onInitState() {
    super.onInitState();
    getListEvent();
  }

  Future<void> getListEvent() async {
    eventRepository.getListEvent().then((value) => {
      uiState.update((state) =>
                        state.copyWith(events: AsyncValue.data(value)))
    });
  }
}
