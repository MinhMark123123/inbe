import 'package:aac_core/aac_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/dto/request/forgot_password_request.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/forgot_password/otp/forgot_password_otp_viewmodel.dart';
import 'package:inabe/src/presenter/widget/input_forms/inabe_otp_input_widget.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';
import 'package:riverpod/src/provider.dart';

class ForgotPasswordOTPPage
    extends ConsumerViewModelWidget<ForgotPasswordOTPViewModel> {
  final String email;

  const ForgotPasswordOTPPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, WidgetRef ref,
      ForgotPasswordOTPViewModel viewModel) {
    viewModel.setDataEmail(email);
    addListenerValidOTP(context, ref, viewModel);

    return Scaffold(
      appBar: CustomAppBarWidget(
        backgroundColor: ColorName.main,
        onBackPressed: () => {context.pop()},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.size10),
          child: Column(
            children: [
              buildInputForm(context, viewModel),
              buildAction(ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputForm(
      BuildContext context, ForgotPasswordOTPViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopBodyWidget(title: str.forgot_password_otp_title),
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.forgot_password_otp_desc,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.forgot_password_otp_time,
          style: textStyle.medium.w400.fill(Colors.red),
        ),
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.change_email_and_password_guide,
          style: textStyle.underline.medium.w400.fill(ColorName.carbonGrey),
        ).onPressedInkWell(() => PopupUtils.buildShowPopupGuide(context)),
        const SizedBox(
          height: Dimens.size40,
        ),
        Text(
          str.change_email_and_password_otp,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabeOTPInputWidget(controller: viewModel.otpController),
        const SizedBox(
          height: Dimens.size40,
        ),
      ],
    );
  }

  Widget buildAction(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildButtonUpdate(ref),
        const SizedBox(
          height: Dimens.size40,
        ),
      ],
    );
  }

  Widget buildButtonUpdate(WidgetRef ref) {
    return SizedBox(
      width: Dimens.widthButton,
      child: ElevatedButton(
        onPressed: () => viewModel(ref).validatePasswordOTP(),
        style: ElevatedButton.styleFrom(backgroundColor: ColorName.greenSnake),
        child: Center(
          child: Text(
            str.update,
            style: textStyle.medium.w700.fill(Colors.white),
          ),
        ),
      ),
    );
  }

  void addListenerValidOTP(BuildContext context, WidgetRef ref,
      ForgotPasswordOTPViewModel viewModel) {
    ref.listen(viewModel.errorMsg, (previous, next) {
      if (next.isNotEmpty) {
        PopupUtils.showErrorAlert(context, message: next);
        viewModel.resetErrorMsg();
      }
    });

    ref.listen(viewModel.isSuccess, (previous, next) {
      if (next) {
        context.go(
          "/${RouterConstants.login}/${RouterConstants.resetPw}",
          extra: ForgotPasswordRequest(
              email: email, otp: viewModel.otpController.text.trim()),
        );
      }
    });
  }

  @override
  AutoDisposeProvider<ForgotPasswordOTPViewModel> viewModelProvider() {
    return forgotPasswordOTPPageControllerProvider;
  }
}
