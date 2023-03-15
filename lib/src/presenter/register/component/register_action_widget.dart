import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/register/register_viewmodel.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class RegisterActionWidget extends ConsumerViewModelWidget<RegisterViewModel> {
  const RegisterActionWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, RegisterViewModel viewModel) {
    bool disable = ref.watch(viewModel.disableButtonProvider);
    print("ttt build RegisterActionWidget $disable");

    ref.listen(viewModel.isSuccess, (previous, next) {
      print("ttt isSuccess p=$previous:::n=$next");
      if (next == true) {
        _showDialogInformation();
      }
    });

    ref.listen(viewModel.errorMsg, (previous, next) {
      print("ttt isSuccess p=$previous:::n=$next");
      if (next.isNotEmpty) {
        PopupUtils.showErrorAlert(context, message: next);
        viewModel.resetErrorMsg();
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Dimens.size40,
        ),
        Center(child: buildButtonRegister(viewModel, disable)),
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

  Widget buildButtonRegister(RegisterViewModel viewModel, bool disable) {
    return SizedBox(
      width: Dimens.widthButton,
      child: ElevatedButton(
        onPressed: disable ? null : () => {viewModel.doRegister()},
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

  void _showDialogInformation() {
    showDialog(
      barrierDismissible: true,
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              str.register_success,
              style: textStyle.large.w700.fill(ColorName.carbonGrey),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                str.register_description_success,
                textAlign: TextAlign.center,
                style: textStyle.medium.w700.fill(ColorName.carbonGrey),
              ),
              const SizedBox(height: Dimens.size20),
              Text(
                str.change_email_and_password_guide,
                style:
                    textStyle.underline.medium.w400.fill(ColorName.carbonGrey),
              ).onPressedInkWell(() {
                context.pop();
                PopupUtils.buildShowPopupGuide(context);
              }),
            ],
          ),
          actions: [
            Center(
              child: SizedBox(
                width: 170,
                child: OutlinedButton(
                  onPressed: () {
                    context.pop();
                    context.go('/${RouterConstants.home}');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: ColorName.dividerGray, width: 2),
                  ),
                  child: Text(
                    str.close,
                    style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
