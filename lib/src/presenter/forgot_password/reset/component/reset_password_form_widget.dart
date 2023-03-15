import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/forgot_password/reset/reset_password_viewmodel.dart';
import 'package:inabe/src/presenter/widget/input_forms/inabe_confirm_password_input_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/dimens.dart';

class ResetPasswordFormWidget
    extends ConsumerViewModelWidget<ResetPasswordViewModel> {
  const ResetPasswordFormWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, ResetPasswordViewModel viewModel) {
    final errorConfirmPw = ref.watch(viewModel.errorConfirmPassword);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.forgot_password_enter_password,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size30,
        ),
        InabePasswordAndConfirmWidget(
          controller: viewModel.passwordController,
          onValidate: (isSubmit) => {
            viewModel.setSubmit(isSubmit),
          },
        ),
      ],
    );

    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     const SizedBox(
    //     height: Dimens.size20,
    //   ),
    //     Text(
    //       str.forgot_password_enter_password,
    //       style: textStyle.medium.w400.fill(ColorName.carbonGrey),
    //     ),
    //     const SizedBox(
    //       height: Dimens.size30,
    //     ),
    //     Text(
    //       str.password,
    //       style: textStyle.medium.w700.fill(ColorName.carbonGrey),
    //     ),
    //     const SizedBox(
    //       height: Dimens.size10,
    //     ),
    //     InabePasswordInputWidget(controller: viewModel.passwordController),
    //     const SizedBox(
    //       height: Dimens.size10,
    //     ),
    //     Text(
    //       str.current_password_desc,
    //       style: textStyle.xSmall.w400,
    //     ),
    //     const SizedBox(
    //       height: Dimens.size40,
    //     ),
    //     Text(
    //       str.confirm_password,
    //       style: textStyle.medium.w700.fill(ColorName.carbonGrey),
    //     ),
    //     const SizedBox(
    //       height: Dimens.size10,
    //     ),
    //     InabeTextInput(
    //       hintText: str.confirm_password,
    //       controller: viewModel.rePasswordController,
    //       contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
    //       onValueChanged: (value) => {viewModel.onChangeConfirmPassword()},
    //       obscure: true,
    //     ),
    //     const SizedBox(
    //       height: Dimens.size4,
    //     ),
    //     Visibility(
    //         visible: errorConfirmPw.isNotEmpty,
    //         child: Text(
    //           errorConfirmPw,
    //           style: textStyle.xSmall.w400.fill(Colors.red),
    //         )),
    //   ],
    // );
  }

  @override
  AutoDisposeProvider<ResetPasswordViewModel> viewModelProvider() =>
      resetPasswordControllerProvider;
}
