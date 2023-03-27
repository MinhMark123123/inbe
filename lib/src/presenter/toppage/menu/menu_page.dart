import 'package:aac_core/aac_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/navigation/app_routers.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/toppage/menu/menu_view_model.dart';
import 'package:inabe/src/presenter/widget/link_media_widget.dart';
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
  Widget buildWidget(BuildContext context,
      WidgetRef ref,
      MenuViewModel viewModel,) {
    useAutomaticKeepAlive(wantKeepAlive: true);
    viewModel.checkLoggedIn();
    ref.listen(viewModel.isSignOutProvider, (previous, next) {
      if (next) {
        context.go(
          "/${RouterConstants.login}",
        );
      }
    });

    return Scaffold(
      appBar: CustomAppBarWidget(
        toolbarHeight: 46,
        onBackPressed: () => context.go("/${RouterConstants.home}"),
      ),
      body: StreamDataConsumer<bool>(
        streamData: viewModel.isLoginLive,
        builder: (context, isLogin) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBodyWidget(title: str.menu),
              if (isLogin)
                _rowMenu(
                  str.setting,
                  Assets.images.icSetting.image(width: Dimens.size22),
                      () =>
                  {
                    context.go(
                      "/${RouterConstants.menu}/${RouterConstants.setting}",
                    )
                  },
                ),
              _rowMenu(
                str.help,
                Assets.images.icHelp.image(width: Dimens.size22),
                    () =>
                {
                  context.go(
                    "/${RouterConstants.menu}/${RouterConstants.faq}",
                  )
                },
              ),
              _rowPolicy(
                str.privacy_policy,
                Assets.images.icPolicy.image(width: Dimens.size26, height: 22),
                    () {
                  // launchWebPage(
                  //   context,
                  //   RouterConstants.menu,
                  //   DomainConst.libraryPolicyApp,
                  // );
                  UriUtils.launchActionOutside(
                      data: DomainConst.libraryPolicyApp);
                },
              ),
              _rowMenu(
                isLogin ? str.logout : str.login,
                Assets.images.icLogin.image(width: Dimens.size22),
                    () =>
                {
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
              const LinkMediaWidget(),
              const SizedBox(
                height: Dimens.materialMedium,
              )
            ],
          );
        },
      ),
    );
  }

  Widget _rowMenu(String title, Image icon, dynamic action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.size10, vertical: Dimens.materialSmall),
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 14,
                ),
                Text(
                  title,
                  style: textStyle.large.w700.fill(ColorName.boulder),
                )
              ],
            ),
          ).onPressed(action),
          Divider(
            height: SizeExtension(2).w,
            color: ColorName.dividerGray,
          ),
        ],
      ),
    );
  }

  Widget _rowPolicy(String title, Image icon, dynamic action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.size10, vertical: Dimens.materialSmall),
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: Dimens.size10,
                ),
                Text(
                  title,
                  style: textStyle.large.w700.fill(ColorName.boulder),
                )
              ],
            ),
          ).onPressed(action),
          Divider(
            height: SizeExtension(2).w,
            color: ColorName.dividerGray,
          ),
        ],
      ),
    );
  }

  void showDialogConfirm(BuildContext context, WidgetRef ref) {
    PopupUtils.showSimpleAlert(
      context,
      title: str.logout,
      message: str.confirm_logout,
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
                str.cancel,
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
                  str.yes,
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
