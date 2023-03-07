import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/login/login_view_model.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class LoginActionWidget extends ConsumerViewModelWidget<LoginViewModel> {
  const LoginActionWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, LoginViewModel viewModel) {
    addListener(ref, viewModel, context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: Dimens.size40,
        ),
        buildButtonLogin(viewModel),
        const SizedBox(
          height: Dimens.size30,
        ),
        Text(
          str.press_to_forgot_password,
          style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ColorName.carbonGrey),
        ).onPressedInkWell(
          () => context
              .go("/${RouterConstants.login}/${RouterConstants.forgotPw}"),
        ),
        const SizedBox(
          height: Dimens.size40,
        ),
        buildButtonRegister(),
      ],
    );
  }

  void addListener(
      WidgetRef ref, LoginViewModel viewModel, BuildContext context) {
    ref.listen(viewModel.errorMsg, (pre, next) {
      if (next.isNotEmpty) {
        print("ttt LoginActionWidget p=$pre;;; next=$next");
        viewModel.resetState();
        PopupUtils.showErrorAlert(context, message: next);
      }
    });
    ref.listen(viewModel.isLoginSuccess, (previous, next) {
      // updateDioProvider(ref);
      context.go("/${RouterConstants.home}");
    });
  }

  Widget buildButtonLogin(LoginViewModel viewModel) {
    return SizedBox(
      width: Dimens.widthButton,
      height: Dimens.size40,
      child: ElevatedButton(
        onPressed: () => {viewModel.doLoginAndUpdate()},
        style: ElevatedButton.styleFrom(
            minimumSize: Size.zero, backgroundColor: ColorName.greenSnake),
        child: Center(
          child: Text(
            str.login,
            style: textStyle.large.w700.fill(Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildButtonRegister() {
    return SizedBox(
      width: Dimens.widthButton,
      height: Dimens.size40,
      child: OutlinedButton(
        onPressed: () => {
          context?.go("/${RouterConstants.login}/${RouterConstants.register}")
        },
        style: OutlinedButton.styleFrom(
          minimumSize: Size.zero,
          side: const BorderSide(width: 2, color: ColorName.greenSnake),
          padding: EdgeInsets.zero,
        ),
        child: Center(
          child: Text(
            str.press_to_register,
            style: textStyle.medium.w400.fill(ColorName.greenSnake),
          ),
        ),
      ),
    );
  }

  @override
  AutoDisposeProvider<LoginViewModel> viewModelProvider() {
    return loginPageControllerProvider;
  }
}
