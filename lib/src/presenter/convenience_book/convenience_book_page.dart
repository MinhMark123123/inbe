import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/living_guide_model.dart';
import 'package:inabe/src/presenter/convenience_book/component/living_book_item_widget.dart';
import 'package:inabe/src/presenter/convenience_book/living_boook_view_model.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class ConvenienceBookPage extends ConsumerViewModelWidget<LivingBookViewModel> {
  const ConvenienceBookPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, LivingBookViewModel viewModel) {
    final livingModels = ref.watch(viewModel.livingGuidesProvider);

    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.convenience_book,
        onBackPressed: () => {context.pop()},
      ),
      body: Column(
        children: [
          TopBodyWidget(title: str.convenience_book),
          livingModels.when(data: (data) {
            PopupUtils.hideLoadingDialog(context);
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.size12, vertical: Dimens.size10),
              child: GridWidget<LivingGuideModel>(
                dataList: data,
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                crossAxisSpacing: Dimens.size10,
                mainAxisSpacing: Dimens.size10,
                itemBuilder: (index, item) {
                  return LivingBookItemWidget(livingGuideModel: item);
                },
              ),
            ));
          }, error: (error, strace) {
            PopupUtils.hideLoadingDialog(context);
            return Container();
          }, loading: () {
            PopupUtils.showLoadingDialog(context);
            return Container();
          })
        ],
      ),
    );
  }

  @override
  AutoDisposeProvider<LivingBookViewModel> viewModelProvider() {
    return livingBookViewModelProvider;
  }
}
