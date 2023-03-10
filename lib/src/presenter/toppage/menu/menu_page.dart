import 'package:aac_core/aac_core.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/toppage/menu/menu_view_model.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/base_component/custom_appbar_widget.dart';
import 'package:inabe_design/dimens.dart';
import 'package:riverpod/src/provider.dart';

class MenuPage extends ConsumerViewModelWidget<MenuViewModel> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  AutoDisposeProvider<MenuViewModel> viewModelProvider() {
    return menuPageControllerProvider;
  }

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, MenuViewModel viewModel) {
    viewModel.checkLoggedIn();
    final isSuccess = ref.watch(viewModel.isSuccess);

    print("ttt buildWidget menu_page::: $isSuccess");

    return Scaffold(
      appBar: CustomAppBarWidget(
        onBackPressed: () => context.go("/${RouterConstants.home}"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.size10),
        child: StreamDataConsumer<bool>(
          streamData: viewModel.isLoginLive,
          builder: (context, isLogin) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBodyWidget(title: str.menu),
                if (isLogin)
                  _rowMenu(
                    str.setting,
                    Assets.images.icSetting.image(width: 16),
                    () => {
                      context.go(
                        "/${RouterConstants.menu}/${RouterConstants.setting}",
                      )
                    },
                  ),
                _rowMenu(
                  str.help,
                  Assets.images.icHelp.image(width: 16),
                  () => {
                    context.go(
                      "/${RouterConstants.menu}/${RouterConstants.faq}",
                    )
                  },
                ),
                _rowMenu(
                  str.privacy_policy,
                  Assets.images.icPolicy.image(width: 16),
                  () => {
                    context.go(
                      "/${RouterConstants.menu}/${RouterConstants.policy}",
                    )
                  },
                ),
                _rowMenu(
                  isLogin ? str.logout : str.login,
                  Assets.images.icLogin.image(width: 16),
                  () => {
                    if (!isLogin)
                      {
                        context.go(
                          "/${RouterConstants.login}",
                        )
                      }
                    else
                      {
                        showDialogConfirm(context, ref),
                      }
                  },
                ),
                const Spacer(),
                _buildBottomRow(),
                const SizedBox(
                  height: Dimens.materialMedium,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomRow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
          child: Assets.images.icLogoSmall.image(width: 100, height: 34),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
          child: Assets.images.icLive.image(width: Dimens.size30).onPressed(
              () => {UriUtils.launchActionOutside(data: DomainConst.URL)}),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
          child: Assets.images.icInstagram
              .image(width: Dimens.size30)
              .onPressed(
                  () => {UriUtils.launchActionOutside(data: DomainConst.URL)}),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
          child: Assets.images.icYoutube.image(width: Dimens.size30).onPressed(
              () => {UriUtils.launchActionOutside(data: DomainConst.URL)}),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
          child: Assets.images.icTwitter.image(width: Dimens.size30).onPressed(
              () => {UriUtils.launchActionOutside(data: DomainConst.URL)}),
        ),
      ],
    );
  }

  Widget _rowMenu(String title, Image icon, dynamic action) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: Dimens.size10,
              ),
              Text(
                title,
                style: textStyle.medium.w700.fill(ColorName.boulder),
              )
            ],
          ),
        ).onPressed(action),
        const Divider(
          height: 2,
          color: ColorName.dividerGray,
        ),
      ],
    );
  }

  void showDialogConfirm(BuildContext context, WidgetRef ref) {
    PopupUtils.showSimpleAlert(
      context,
      title: "Logout",
      message: "Do you want to logout?",
      customButtonActions: [
        Center(
          child: SizedBox(
            width: Dimens.widthButton,
            height: Dimens.size40,
            child: OutlinedButton(
              onPressed: () => context.pop(),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: ColorName.dividerGray),
              ),
              child: Text(
                "Cancel",
                style: textStyle.large.w400.fill(ColorName.carbonGrey),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: Dimens.size20),
            width: Dimens.widthButton,
            height: Dimens.size40,
            child: ElevatedButton(
              onPressed: () {
                viewModel(ref).doLogout();
                context.pop();
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  backgroundColor: ColorName.greenSnake),
              child: Center(
                child: Text(
                  "Yes",
                  style: textStyle.large.w700.fill(Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
