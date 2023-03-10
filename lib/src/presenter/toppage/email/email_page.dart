import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/toppage/email/component/email_item_widget.dart';
import 'package:inabe/src/presenter/toppage/email/email_view_model.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class EmailPage extends ConsumerViewModelWidget<EmailViewModel> {
  const EmailPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, EmailViewModel viewModel,) {
    final emails = ref.watch(viewModel.emails);

    final dataList = ref.watch(viewModel.listProvider);
    print("ttt EmailPage change ssss :: $dataList");

    return Scaffold(
      appBar: CustomAppBarWidget(
        onBackPressed: () => context.go("/${RouterConstants.home}"),
      ),
      // body: emails.when(data: (data) {
      //   print("ttt EmailPage .when(data: (data) = ${data.length}");
      //   PopupUtils.hideLoadingDialog(context);
      //   return Column(
      //     children: [
      //       TopBodyWidget(title: str.email_information),
      //       Expanded(
      //         child: RefreshIndicatorDataListWidget<EmailModel>(
      //           onRefresh: viewModel.refresh,
      //           onLoadMore: viewModel.loadMore,
      //           showScrollBar: true,
      //           // dataList: viewModel.dataList,
      //           dataList: data,
      //           itemBuilder: (index, data) {
      //             return EmailItemWidget(emailModel: data);
      //           },
      //           // emptyWidget: EmptyList(message: str.article_empty),
      //           dividerHeight: 1,
      //           dividerColor: ColorName.dividerGray,
      //           padding: const EdgeInsets.only(
      //             bottom: Dimens.normalPadding,
      //             left: 16,
      //             right: 16,
      //           ),
      //         ),
      //         // child: ListWidget<EmailModel>(
      //         //   padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
      //         //   dataList: data,
      //         //   dividerHeight: 1,
      //         //   dividerColor: ColorName.dividerGray,
      //         //   itemBuilder: (index, item) => EmailItemWidget(
      //         //     emailModel: item,
      //         //   ),
      //         //   onClickItem: (index, item) {
      //         //     context.go(
      //         //       "/${RouterConstants.email}/${RouterConstants.emailDetail}",
      //         //       extra: item,
      //         //     );
      //         //   },
      //         // ),
      //       ),
      //     ],
      //   );
      // }, error: (Object error, StackTrace stackTrace) {
      //   PopupUtils.hideLoadingDialog(context);
      //   return Container();
      // }, loading: () {
      //   PopupUtils.showLoadingDialog(context);
      //   return Container();
      // }),
      body: Column(
        children: [
          TopBodyWidget(title: str.email_information),
          Expanded(
            child: RefreshIndicatorDataListWidget<EmailModel>(
              onRefresh: viewModel.refresh,
              onLoadMore: viewModel.loadMore,
              showScrollBar: true,
              // dataList: viewModel.dataList,
              dataList: dataList,
              itemBuilder: (index, data) {
                return EmailItemWidget(emailModel: data);
              },
              // emptyWidget: EmptyList(message: str.article_empty),
              dividerHeight: 1,
              dividerColor: ColorName.dividerGray,
              padding: const EdgeInsets.only(
                bottom: Dimens.normalPadding,
                left: 16,
                right: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  AutoDisposeProvider<EmailViewModel> viewModelProvider() {
    return emailViewModelProvider;
  }
}
