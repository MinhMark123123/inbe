import 'package:aac_core/aac_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe/src/navigation/app_routers.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/notification/news_item_widget.dart';
import 'package:inabe/src/presenter/notification/news_view_model.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class NewsPage extends ConsumerViewModelWidget<NewsViewModel> {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, NewsViewModel viewModel) {
    final events = ref.watch(viewModel.notifications);

    return Scaffold(
      appBar: CustomAppBarWidget(
        onBackPressed: () => context.pop(),
      ),
      body: Column(
        children: [
          TopBodyWidget(title: str.notification),
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

  Widget _buildListView(BuildContext context, List<NotificationModel> events) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
        child: ListWidget<NotificationModel>(
          dataList: events,
          itemBuilder: (index, item) => NewsItemWidget(notificationModel: item),
          dividerHeight: 1,
          dividerColor: ColorName.dividerGray,
          onClickItem: (index, item) {
            // UriUtils.launchActionOutside(data: item.link ?? '');
            launchWebPage(context, item.link);
            // context.go("/${RouterConstants.home}/${RouterConstants.webpage}",
            //     extra: item.link ?? '');
          },
        ),
      ),
    );
  }

  @override
  AutoDisposeProvider<NewsViewModel> viewModelProvider() {
    return newsPageControllerProvider;
  }
}
