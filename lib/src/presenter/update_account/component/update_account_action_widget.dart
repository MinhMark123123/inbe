import 'package:aac_core/aac_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/update_account/update_account_viewmodel.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class UpdateAccountActionWidget
    extends ConsumerViewModelWidget<UpdateAccountViewModel> {
  const UpdateAccountActionWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, UpdateAccountViewModel viewModel) {
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
  AutoDisposeProvider<UpdateAccountViewModel> viewModelProvider() {
    return updateAccountPageControllerProvider;
  }

  Widget buildButtonRegister(UpdateAccountViewModel viewModel) {
    return SizedBox(
      width: Dimens.widthButton,
      child: ElevatedButton(
        onPressed: () => {viewModel.doUpdateAccount()},
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

  void showDialogInformation() {
    showCupertinoDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              str.change_email_and_password_title_success,
              style: textStyle.large.w700.fill(ColorName.carbonGrey),
            ),
          ),
          content: Text(
            str.change_email_and_password_desc_success,
            style: textStyle.medium.w700.fill(ColorName.carbonGrey),
          ),
          actions: [
            Center(
              child: OutlinedButton(
                onPressed: () {
                  context.pop();
                  context.go('/${RouterConstants.menu}');
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: ColorName.dividerGray),
                ),
                child: Text(
                  str.close,
                  style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
