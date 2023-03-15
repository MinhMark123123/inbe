import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/update_account/otp/update_account_otp_viewmodel.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class UpdateAccountOTPPage
    extends ConsumerViewModelWidget<UpdateAccountOTPViewModel> {
  const UpdateAccountOTPPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, WidgetRef ref,
      UpdateAccountOTPViewModel viewModel) {
    addListenerValidOTP(context, ref, viewModel);

    return Scaffold(
      appBar: CustomAppBarWidget(
        backgroundColor: ColorName.main,
        onBackPressed: () => context.pop(),
      ),
      body: buildPage(context, ref),
    );
  }

  @override
  AutoDisposeProvider<UpdateAccountOTPViewModel> viewModelProvider() {
    return updateAccountOTPViewModelProvider;
  }

  Widget buildPage(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.size10),
        child: Column(
          children: [
            TopBodyWidget(title: str.change_email_and_password_otp_title),
            buildInputForm(context, ref),
            buildAction(ref),
          ],
        ),
      ),
    );
  }

  Widget buildInputForm(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.change_email_and_password_follow,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.change_email_and_password_time,
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
        InabeTextInput(
          controller: viewModel(ref).otpController,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {},
        ),
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
        onPressed: () => viewModel(ref).validOTP(),
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

  void addListenerValidOTP(BuildContext context, WidgetRef ref,
      UpdateAccountOTPViewModel viewModel) {
    ref.listen(viewModel.errorMsg, (previous, next) {
      if (next.isNotEmpty) {
        PopupUtils.showErrorAlert(context, message: next);
      }
    });

    ref.listen(viewModel.isSuccess, (previous, next) {
      if (next) {
        context.go("/${RouterConstants.menu}/${RouterConstants.updateAccount}",
            extra: viewModel.otpController.text);
      }
    });
  }
}
