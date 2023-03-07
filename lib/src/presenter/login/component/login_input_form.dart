import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/login/login_view_model.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
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
    final errorMail = ref.watch(viewModel.errorEmail);
    final errorPassword = ref.watch(viewModel.errorPassword);

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
        InabeTextInput(
          hintText: str.email,
          controller: viewModel.emailController,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {},
        ),
        const SizedBox(
          height: Dimens.size4,
        ),
        Visibility(
            visible: errorMail.isNotEmpty,
            child: Text(
              errorMail,
              style: textStyle.xSmall.w400.fill(Colors.red),
            )),
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
        InabeTextInput(
          obscure: true,
          controller: viewModel.passwordController,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {},
        ),
        const SizedBox(
          height: Dimens.size4,
        ),
        Visibility(
            visible: errorPassword.isNotEmpty,
            child: Text(
              errorPassword,
              style: textStyle.xSmall.w400.fill(Colors.red),
            )),
      ],
    );
  }
}
