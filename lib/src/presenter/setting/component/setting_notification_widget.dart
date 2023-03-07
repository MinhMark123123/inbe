import 'package:aac_core/aac_core.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/setting/setting_viewmodel.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/dimens.dart';
import 'package:riverpod/src/provider.dart';

class SettingNotificationWidget
    extends ConsumerViewModelWidget<SettingViewModel> {
  const SettingNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, SettingViewModel viewModel) {
    final listNotification =
        {str.turn_on_notification, str.turn_off_notification}.toList();

    final isTurnOn = ref.watch(viewModel.isTurnOn);
    print("ttt isTurnOn $isTurnOn");

    addListener(ref, viewModel, context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          str.push_notification,
          style: textStyle.medium.w700,
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        Text(
          str.push_notification_desc,
          style: textStyle.xSmall.w400,
        ),
        ...listNotification.asMap().entries.map((entry) {
          return Container(
            margin: const EdgeInsets.only(top: Dimens.size20),
            child: Row(
              children: [
                SizedBox(
                  width: Dimens.size20,
                  height: Dimens.size20,
                  child: Radio<bool>(
                    groupValue: isTurnOn,
                    activeColor: ColorName.boulder,
                    splashRadius: Dimens.size20,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    value: entry.key == 0,
                    onChanged: (val) {
                      viewModel.checkTurnOnNotification(val ?? false);
                    },
                  ),
                ),
                const SizedBox(width: Dimens.size10),
                Text(
                  entry.value,
                  style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                ),
              ],
            ),
          );
        }),
        const SizedBox(
          height: Dimens.size40,
        ),
        Center(
          child: SizedBox(
            width: Dimens.widthButton,
            child: ElevatedButton(
              onPressed: () => {viewModel.doUpdateUser()},
              style: ElevatedButton.styleFrom(backgroundColor: ColorName.greenSnake),
              child: Center(
                child: Text(
                  str.update,
                  style: textStyle.medium.w700.fill(Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void addListener(
      WidgetRef ref, SettingViewModel viewModel, BuildContext context) {
    ref.listen(viewModel.errorMsg, (pre, next) {
      if (next.isNotEmpty) {
        print("ttt SettingViewModel p=$pre;;; next=$next");
        viewModel.resetState();
        PopupUtils.showErrorAlert(context, message: next);
      }
    });
    ref.listen(viewModel.isSuccess, (previous, next) {
      context.go("/${RouterConstants.menu}");
    });
  }



  @override
  AutoDisposeProvider<SettingViewModel> viewModelProvider() {
    return settingPageControllerProvider;
  }
}
