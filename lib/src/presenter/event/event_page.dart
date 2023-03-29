import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/event_model.dart';
import 'package:inabe/src/navigation/app_routers.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/event/component/event_item_widget.dart';
import 'package:inabe/src/presenter/event/event_view_model.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class EventPage extends ConsumerViewModelWidget<EventViewModel> {
  const EventPage({Key? key}) : super(key: key);

  @override
  AutoDisposeProvider<EventViewModel> viewModelProvider() {
    return eventViewModelProvider;
  }

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, EventViewModel viewModel) {
    final events = ref.watch(viewModel.eventsProvider);

    return Scaffold(
      appBar: CustomAppBarWidget(
        onBackPressed: () => context.pop(),
      ),
      body: Column(
        children: [
          TopBodyWidget(title: str.event_information),
          events.when(
            data: (data) {
              PopupUtils.hideLoadingDialog(context);
              return _buildListView(context, data);
            },
            error: (error, strace) {
              PopupUtils.hideLoadingDialog(context);
              return Container();
            },
            loading: () {
              PopupUtils.showLoadingDialog(context);
              return Container();
            },
          )
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<EventModel> events) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
        child: ListWidget<EventModel>(
          dataList: events,
          itemBuilder: (index, item) => EventItemWidget(eventModel: item),
          dividerHeight: 1,
          dividerColor: ColorName.dividerGray,
          onClickItem: (index, item) {
            launchWebPage(
              context,
              "${RouterConstants.home}/${RouterConstants.event}",
              item.url,
            );
          },
        ),
      ),
    );
  }
}
