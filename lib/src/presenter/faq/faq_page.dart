import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/faq_model.dart';
import 'package:inabe/src/presenter/faq/component/faq_item_widget.dart';
import 'package:inabe/src/presenter/faq/faq_view_model.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class FAQPage extends ConsumerViewModelWidget<FAQViewModel> {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, FAQViewModel viewModel) {
    final listData = ref.watch(viewModel.faqModels);

    return Scaffold(
      appBar: CustomAppBarWidget(
        backgroundColor: ColorName.main,
        onBackPressed: () => {context.pop()},
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.size10),
        child: Column(
          children: [
            TopBodyWidget(title: str.help),
            Expanded(
              child: listData.when(data: (data) {
                PopupUtils.hideLoadingDialog(context);
                // return TopBodyWidget(title: str.help);
                return ListWidget<FAQModel>(
                  dataList: data,
                  itemBuilder: (index, item) {
                    return FAQItemWidget(faqModel: item);
                  },
                );
              }, error: (error, strace) {
                PopupUtils.hideLoadingDialog(context);
                return Container();
              }, loading: () {
                PopupUtils.showLoadingDialog(context);
                return Container();
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AutoDisposeProvider<FAQViewModel> viewModelProvider() {
    return faqViewModelProvider;
  }
}
