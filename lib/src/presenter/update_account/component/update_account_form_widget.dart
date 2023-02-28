import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/update_account/update_account_viewmodel.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/dimens.dart';

class UpdateAccountFormWidget
    extends ConsumerViewModelWidget<UpdateAccountViewModel> {
  const UpdateAccountFormWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, UpdateAccountViewModel viewModel) {
    final errorMail = ref.watch(viewModel.errorEmail);
    final errorPw = ref.watch(viewModel.errorPassword);
    final errorConfirmPw = ref.watch(viewModel.errorConfirmPassword);
    print("ttt errorMail $errorMail");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Dimens.size20,
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
          onValueChanged: (value) => {viewModel.onChangeEmail()},
        ),
        Visibility(
            visible: errorMail.isNotEmpty,
            child: Text(
              errorMail,
              style: textStyle.xSmall.w400.fill(Colors.red),
            )),
        const SizedBox(
          height: Dimens.size40,
        ),
        Text(
          str.password,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabeTextInput(
          hintText: str.password,
          controller: viewModel.passwordController,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {viewModel.onChangePassword()},
          obscure: true,
        ),
        Visibility(
            visible: errorPw.isNotEmpty,
            child: Text(
              errorPw,
              style: textStyle.xSmall.w400.fill(Colors.red),
            )),
        const SizedBox(
          height: Dimens.size10,
        ),
        Text(
          str.current_password_desc,
          style: textStyle.xSmall.w400,
        ),
        const SizedBox(
          height: Dimens.size40,
        ),
        Text(
          str.confirm_password,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabeTextInput(
          hintText: str.confirm_password,
          controller: viewModel.rePasswordController,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {viewModel.onChangeConfirmPassword()},
          obscure: true,
        ),
        Visibility(
            visible: errorConfirmPw.isNotEmpty,
            child: Text(
              errorConfirmPw,
              style: textStyle.xSmall.w400.fill(Colors.red),
            )),
      ],
    );
  }

  @override
  AutoDisposeProvider<UpdateAccountViewModel> viewModelProvider() =>
      updateAccountPageControllerProvider;
}
