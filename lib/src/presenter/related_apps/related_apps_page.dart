import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/other_app_model.dart';
import 'package:inabe/src/presenter/related_apps/component/related_item_widget.dart';
import 'package:inabe/src/presenter/related_apps/related_view_model.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class RelatedAppPage extends ConsumerViewModelWidget<RelatedViewModel> {
  const RelatedAppPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, RelatedViewModel viewModel) {
    final otherAppModels = ref.watch(viewModel.otherAppProvider);

    return Scaffold(
      appBar: CustomAppBarWidget(
        onBackPressed: () => context.pop(),
      ),
      body: otherAppModels.when(data: (data) {
        PopupUtils.hideLoadingDialog(context);
        return Column(
          children: [
            TopBodyWidget(title: str.related_apps),
            Expanded(
              child: ListWidget<OtherAppModel>(
                dataList: data,
                itemBuilder: (index, item) => Container(
                  color: ColorName.main,
                  margin: const EdgeInsets.all(Dimens.size10),
                  child: RelatedItemWidget(
                    otherAppModel: item,
                  ),
                ),
              ),
            ),
          ],
        );
      }, error: (Object error, StackTrace stackTrace) {
        PopupUtils.hideLoadingDialog(context);
        return Container();
      }, loading: () {
        PopupUtils.showLoadingDialog(context);
        return Container();
      }),
    );
  }

  @override
  AutoDisposeProvider<RelatedViewModel> viewModelProvider() {
    return relatedViewModelProvider;
  }
}
