import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/constants/enums.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/forgot_password/forgot_password_viewmodel.dart';
import 'package:inabe/src/presenter/widget/button_state_widget.dart';
import 'package:inabe/src/presenter/widget/input_forms/inabe_email_input_widget.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class ForgotPasswordPage
    extends ConsumerViewModelWidget<ForgotPasswordViewModel> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, ForgotPasswordViewModel viewModel) {
    ref.listen(viewModel.isSuccess, (previous, next) {
      context.go("/${RouterConstants.login}/${RouterConstants.forgotPwOTP}",
          extra: viewModel.emailController.text);
    });
    ref.listen(viewModel.errorMsg, (previous, next) {
      if (next.isNotEmpty) {
        PopupUtils.showErrorAlert(context, message: next);
        viewModel.resetErrorMsg();
      }
    });
    print("ttt build Forgot password");

    return Scaffold(
      appBar: CustomAppBarWidget(
        backgroundColor: ColorName.main,
        onBackPressed: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.size10),
          child: Column(
            children: [
              buildInputForm(viewModel),
              buildAction(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputForm(ForgotPasswordViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopBodyWidget(title: str.forgot_password),
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.forgot_password_desc,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size40,
        ),
        Text(
          str.email,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabeEmailInputWidget(controller: viewModel.emailController),
      ],
    );
  }

  Widget buildAction(BuildContext context, ForgotPasswordViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: Dimens.size40,
        ),
        ButtonStateWidget(
          str.send,
          width: Dimens.widthButton,
          onPress: () => {viewModel.doRecoverPassword()},
          controller: viewModel.emailController,
          type: ButtonStateType.EMAIL,
        ),
        const SizedBox(
          height: Dimens.size40,
        ),
      ],
    );
  }

  @override
  AutoDisposeProvider<ForgotPasswordViewModel> viewModelProvider() {
    return forgotPasswordPageControllerProvider;
  }
}
