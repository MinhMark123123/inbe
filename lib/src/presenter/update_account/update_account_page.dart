import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/update_account/component/update_account_action_widget.dart';
import 'package:inabe/src/presenter/update_account/component/update_account_form_widget.dart';
import 'package:inabe/src/presenter/update_account/update_account_viewmodel.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class UpdateAccountPage
    extends ConsumerViewModelWidget<UpdateAccountViewModel> {
  final String otp;

  const UpdateAccountPage({
    Key? key,
    required this.otp,
  }) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, UpdateAccountViewModel viewModel) {
    print("ttt otp: $otp");
    viewModel.setDataOTP(otp);
    return Scaffold(
      appBar: CustomAppBarWidget(
        onBackPressed: () => context.pop(),
      ),
      body: buildPage(viewModel),
    );
  }

  Widget buildPage(UpdateAccountViewModel viewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.size10),
        child: Column(
          children: [
            TopBodyWidget(title: str.change_email_and_password_short),
            const UpdateAccountFormWidget(),
            const UpdateAccountActionWidget(),
            // RegisterActionWidget(),
          ],
        ),
      ),
    );
  }

  @override
  AutoDisposeProvider<UpdateAccountViewModel> viewModelProvider() {
    return updateAccountPageControllerProvider;
  }
}
