import 'package:aac_core/aac_core.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/forgot_password/forgot_password_viewmodel.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';
import 'package:riverpod/src/provider.dart';

class ForgotPasswordPage
    extends ConsumerViewModelWidget<ForgotPasswordViewModel> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, ForgotPasswordViewModel viewModel) {
    ref.listen(viewModel.isSuccess, (previous, next) {
      context.go(
          "/${RouterConstants.menu}/${RouterConstants.login}/${RouterConstants.forgotPwOTP}",
          extra: viewModel.emailController.text);
    });
    final errorEmail = ref.watch(viewModel.errorEmail);

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
              buildInputForm(viewModel, errorEmail),
              buildAction(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputForm(ForgotPasswordViewModel viewModel, String errorEmail) {
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
        InabeTextInput(
          hintText: str.email,
          controller: viewModel.emailController,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {
            viewModel.resetError()
          },
        ),
        const SizedBox(
          height: Dimens.size4,
        ),
        Visibility(
            visible: errorEmail.isNotEmpty,
            child: Text(
              errorEmail,
              style: textStyle.xSmall.w400.fill(Colors.red),
            )),
      ],
    );
  }

  Widget buildButtonSend(
      BuildContext context, ForgotPasswordViewModel viewModel) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () => {viewModel.doRecoverPassword()},
        style: ElevatedButton.styleFrom(backgroundColor: ColorName.greenSnake),
        child: Center(
          child: Text(
            str.send,
            style: textStyle.medium.w700.fill(Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildAction(BuildContext context, ForgotPasswordViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: Dimens.size40,
        ),
        buildButtonSend(context, viewModel),
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
