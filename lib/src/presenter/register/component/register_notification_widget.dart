import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/register/register_viewmodel.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/dimens.dart';

class RegisterNotificationWidget
    extends ConsumerViewModelWidget<RegisterViewModel> {
  const RegisterNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, WidgetRef ref, viewModel) {
    final listNotification =
        {str.turn_on_notification, str.turn_off_notification}.toList();

    final isTurnOn = ref.watch(viewModel.isTurnOn);
    print("ttt isTurnOn $isTurnOn");

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
              mainAxisSize: MainAxisSize.max,
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
            ).onPressedInkWell(() {
              viewModel.checkTurnOnNotification(!isTurnOn);
            }),
          );
        }),
        const SizedBox(
          height: Dimens.size40,
        ),
        Text(
          str.confirm_privacy_policy,
          style: textStyle.medium.w400,
        ),
      ],
    );
  }

  @override
  AutoDisposeProvider<RegisterViewModel> viewModelProvider() {
    return registerPageControllerProvider;
  }
}
