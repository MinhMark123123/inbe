import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/setting/setting_viewmodel.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/extensions/context_extesion.dart';
import 'package:inabe_design/dimens.dart';

class SettingFormWidget extends ConsumerViewModelWidget<SettingViewModel> {
  const SettingFormWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, SettingViewModel viewModel) {
    addListenerOTP(context, ref, viewModel);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Dimens.size30,
        ),
        SizedBox(
          width: context.screenWidth,
          height: Dimens.size60,
          child: ElevatedButton(
            onPressed: () => viewModel.requestAccountOTP(),
            style:
                ElevatedButton.styleFrom(backgroundColor: ColorName.greenSnake),
            child: Center(
              child: Text(
                str.change_email_and_password,
                style: textStyle.medium.w700.fill(Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: Dimens.size30,
        ),
        Text(
          str.nickname,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabeTextInput(
          hintText: str.nickname,
          controller: viewModel.nicknameController,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
        ),
      ],
    );
  }

  @override
  AutoDisposeProvider<SettingViewModel> viewModelProvider() =>
      settingPageControllerProvider;

  void addListenerOTP(BuildContext context, WidgetRef ref, SettingViewModel viewModel) {
    ref.listen(viewModel.isSuccessRequestOTP, (previous, next) {
      if(next == true) {
        context.go("/${RouterConstants.menu}/${RouterConstants.accountOtp}");
      }
    });
  }
}
