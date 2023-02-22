import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/electronic_apps/component/electronic_app_dropdown_widget.dart';
import 'package:inabe/src/presenter/electronic_apps/component/electronic_app_info_widget.dart';
import 'package:inabe/src/presenter/electronic_apps/electronic_apps_view_model.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class ElectronicAppPage
    extends ConsumerViewModelWidget<ElectronicAppViewModel> {
  const ElectronicAppPage({Key? key}) : super(key: key);

  @override
  AutoDisposeProvider<ElectronicAppViewModel> viewModelProvider() {
    return electronicAppViewModelProvider;
  }

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, ElectronicAppViewModel viewModel) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.related_apps,
        onBackPressed: () => {context.pop()},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBodyWidget(title: str.electronic_app),
            const ElectronicAppInfoWidget(),
            const ElectronicAppDropdownWidget()
          ],
        ),
      ),
    );
  }
}
