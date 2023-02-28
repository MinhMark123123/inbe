import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/dto/request/forgot_password_request.dart';
import 'package:inabe/src/presenter/forgot_password/reset/component/reset_password_action_widget.dart';
import 'package:inabe/src/presenter/forgot_password/reset/component/reset_password_form_widget.dart';
import 'package:inabe/src/presenter/forgot_password/reset/reset_password_viewmodel.dart';
import 'package:inabe/src/presenter/update_account/component/update_account_action_widget.dart';
import 'package:inabe/src/presenter/update_account/component/update_account_form_widget.dart';
import 'package:inabe/src/presenter/update_account/update_account_viewmodel.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class ResetPasswordPage
    extends ConsumerViewModelWidget<ResetPasswordViewModel> {
  final ForgotPasswordRequest request;

  const ResetPasswordPage({
    Key? key,
    required this.request,
  }) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, ResetPasswordViewModel viewModel) {
    print("ttt request: $request");
    viewModel.setDataRequest(request);
    return Scaffold(
      appBar: CustomAppBarWidget(
        onBackPressed: () => context.pop(),
      ),
      body: buildPage(viewModel),
    );
  }

  Widget buildPage(ResetPasswordViewModel viewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.size10),
        child: Column(
          children: [
            TopBodyWidget(title: str.change_password),
            const ResetPasswordFormWidget(),
            const ResetPasswordActionWidget(),
            // RegisterActionWidget(),
          ],
        ),
      ),
    );
  }

  @override
  AutoDisposeProvider<ResetPasswordViewModel> viewModelProvider() {
    return resetPasswordControllerProvider;
  }
}
