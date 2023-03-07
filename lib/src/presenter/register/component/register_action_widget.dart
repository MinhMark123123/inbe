import 'package:aac_core/aac_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/register/register_viewmodel.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class RegisterActionWidget extends ConsumerViewModelWidget<RegisterViewModel> {
  const RegisterActionWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, RegisterViewModel viewModel) {
    final errorMail = ref.watch(viewModel.errorEmail);
    final errorPassWord = ref.watch(viewModel.errorPassword);
    final errorConfirm = ref.watch(viewModel.errorConfirmPassword);
    // print("ttt errorMail $errorMail");

    ref.listen(viewModel.isSuccess, (previous, next) {
      print("ttt isSuccess p=$previous:::n=$next");
      if (next == true) {
        showDialogInformation();
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Dimens.size20,
        ),
        Visibility(
          visible: errorMail.isNotEmpty,
          child: Text(
            "$errorMail\n$errorPassWord\n$errorConfirm",
            style: textStyle.xSmall.w400.fill(Colors.red),
          ),
        ),
        const SizedBox(
          height: Dimens.size20,
        ),
        Center(child: buildButtonRegister(viewModel)),
        const SizedBox(
          height: Dimens.size40,
        ),
      ],
    );
  }

  @override
  AutoDisposeProvider<RegisterViewModel> viewModelProvider() {
    return registerPageControllerProvider;
  }

  Widget buildButtonRegister(RegisterViewModel viewModel) {
    return SizedBox(
      width: Dimens.widthButton,
      child: ElevatedButton(
        onPressed: () => {viewModel.doRegister()},
        style: ElevatedButton.styleFrom(backgroundColor: ColorName.greenSnake),
        child: Center(
          child: Text(
            str.register,
            style: textStyle.medium.w700.fill(Colors.white),
          ),
        ),
      ),
    );
  }

  void showDialogInformation() {
    showCupertinoDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              str.register,
              style: textStyle.large.w700.fill(ColorName.carbonGrey),
            ),
          ),
          content: Text(
            str.choose_category_desc_more,
            style: textStyle.medium.w700.fill(ColorName.carbonGrey),
          ),
          actions: [
            OutlinedButton(
              onPressed: () => {context.go('/${RouterConstants.login}')},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: ColorName.dividerGray),
              ),
              child: Text(
                "Close/閉じる",
                style: textStyle.medium.w400.fill(ColorName.carbonGrey),
              ),
            ),
          ],
        );
      },
    );
  }
}
