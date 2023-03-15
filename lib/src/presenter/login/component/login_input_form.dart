import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/login/login_view_model.dart';
import 'package:inabe/src/presenter/widget/input_forms/inabe_email_input_widget.dart';
import 'package:inabe/src/presenter/widget/input_forms/inabe_password_input_widget.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class LoginInputFormWidget extends ConsumerViewModelWidget<LoginViewModel> {
  const LoginInputFormWidget({Key? key}) : super(key: key);

  @override
  AutoDisposeProvider<LoginViewModel> viewModelProvider() {
    return loginPageControllerProvider;
  }

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, LoginViewModel viewModel) {
    print("ttt build Login form");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopBodyWidget(title: str.login),
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
        InabeEmailInputWidget(
          controller: viewModel.emailController,
          onValueChanged: (value) => {
            // print("ttt $value")
          },
        ),
        const SizedBox(
          height: Dimens.size30,
        ),
        Text(
          str.password,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabePasswordInputWidget(
          controller: viewModel.passwordController,
          onValueChanged: (value) => {
            // print("ttt $value")
          },
        ),
      ],
    );
  }
}
