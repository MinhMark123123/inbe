import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/register/register_viewmodel.dart';
import 'package:inabe/src/presenter/widget/input_forms/inabe_confirm_password_input_widget.dart';
import 'package:inabe/src/presenter/widget/input_forms/inabe_email_input_widget.dart';
import 'package:inabe/src/presenter/widget/input_forms/inabe_nickname_input_widget.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/dimens.dart';

class RegisterFormWidget extends ConsumerViewModelWidget<RegisterViewModel> {
  const RegisterFormWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, RegisterViewModel viewModel) {
    print("ttt build RegisterFormWidget");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopBodyWidget(title: str.register_label),
        const SizedBox(
          height: Dimens.materialLarge,
        ),
        Text(
          str.nickname,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabeNicknameInputWidget(
          controller: viewModel.nicknameController,
          onValueChanged: (value) => {viewModel.onChangeNickname()},
        ),
        const SizedBox(
          height: Dimens.size30,
        ),
        Text(
          str.email,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabeEmailInputWidget(
          controller: viewModel.emailController,
          onValueChanged: (value) => {viewModel.onChangeEmail()},
        ),
        const SizedBox(
          height: Dimens.size30,
        ),
        InabePasswordAndConfirmWidget(
          controller: viewModel.passwordController,
          onValidate: (isValid) => viewModel.setValidPassword(isValid),
        ),
      ],
    );
  }

  @override
  AutoDisposeProvider<RegisterViewModel> viewModelProvider() =>
      registerPageControllerProvider;
}
