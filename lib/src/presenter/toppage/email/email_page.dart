import 'package:aac_core/aac_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/toppage/email/component/email_first_item_widget.dart';
import 'package:inabe/src/presenter/toppage/email/component/email_item_widget.dart';
import 'package:inabe/src/presenter/toppage/email/email_view_model.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class EmailPage extends ConsumerViewModelWidget<EmailViewModel> {
  const EmailPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
    BuildContext context,
    WidgetRef ref,
    EmailViewModel viewModel,
  ) {
    useAutomaticKeepAlive(wantKeepAlive: true);

    final dataList = ref.watch(viewModel.listProvider);
    print("ttt EmailPage change ssss :: $dataList");

    return Scaffold(
      appBar: CustomAppBarWidget(
        onBackPressed: () => context.go("/${RouterConstants.home}"),
      ),
      body: Column(
        children: [
          TopBodyWidget(
            title: str.email_information,
            hideLineBottom: true,
          ),
          Expanded(
              child: dataList.isEmpty
                  ? _showLoading(context)
                  : _hideLoading(context, viewModel, dataList)),
        ],
      ),
    );
  }

  Widget _showLoading(BuildContext context) {
    PopupUtils.showLoadingDialog(context);
    return Container();
  }

  Widget _hideLoading(
    BuildContext context,
    EmailViewModel viewModel,
    List<EmailModel> dataList,
  ) {
    List<EmailModel> data = [];
    data.insert(0, EmailModel());
    data.addAll(dataList);
    PopupUtils.hideLoadingDialog(context);
    return RefreshIndicatorDataListWidget<EmailModel>(
      onRefresh: viewModel.refresh,
      onLoadMore: viewModel.loadMore,
      showScrollBar: true,
      dataList: data,
      itemBuilder: (index, data) {
        if (index == 0) {
          return EmailFirstItemWidget(emailModel: data);
        }
        return EmailItemWidget(emailModel: data);
      },
      // emptyWidget: EmptyList(message: str.article_empty),
      dividerHeight: 2,
      dividerColor: ColorName.dividerGray,
      padding: const EdgeInsets.only(
        bottom: Dimens.normalPadding,
        left: Dimens.normalPadding,
        right: Dimens.normalPadding,
      ),
    );
  }

  @override
  AutoDisposeProvider<EmailViewModel> viewModelProvider() {
    return emailViewModelProvider;
  }
}
