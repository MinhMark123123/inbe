import 'package:aac_core/aac_core.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/api/retrofit_config.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/toppage/menu/menu_view_model.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
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
    final isLogin = viewModel.checkLoggedIn();
    final isSuccess = ref.watch(viewModel.isSuccess);
    if (isSuccess) {
      updateDioProvider(ref);
    }

    print("ttt buildWidget menu_page $isLogin::: $isSuccess");

    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.menu,
        onBackPressed: () => {},
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.size10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.size20),
              child: Text(
                str.menu,
                style: textStyle.large.w700.fill(ColorName.boulder),
              ),
            ),
            const Divider(
              height: 2,
              color: ColorName.dividerGray,
            ),
            if (isLogin)
              rowMenu(
                str.setting,
                Assets.images.icSetting.image(width: 16),
                () => {
                  context.go(
                    "/${RouterConstants.menu}/${RouterConstants.setting}",
                  )
                },
              ),
            rowMenu(
              str.help,
              Assets.images.icHelp.image(width: 16),
              () => {
                context.go(
                  "/${RouterConstants.menu}/${RouterConstants.faq}",
                )
              },
            ),
            rowMenu(
              str.privacy_policy,
              Assets.images.icPolicy.image(width: 16),
              () => {
                context.go(
                  "/${RouterConstants.menu}/${RouterConstants.policy}",
                )
              },
            ),
            rowMenu(
              isLogin ? str.logout : str.login,
              Assets.images.icLogin.image(width: 16),
              () => {
                if (!isLogin)
                  {
                    context.go(
                      "/${RouterConstants.menu}/${RouterConstants.login}",
                    )
                  }
                else
                  {
                    showDialogConfirm(context, ref),
                  }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget rowMenu(String title, Image icon, dynamic action) {
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
            width: 200,
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
            width: 200,
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

// class MenuPage extends StatefulWidget {
//   const MenuPage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<MenuPage> createState() => _MenuPageState();
// }
//
// class _MenuPageState extends State<MenuPage> {
//   late String lastAction;
//   late bool isLogin;
//
//   @override
//   void initState() {
//     isLogin = isLoggedIn();
//     if (!isLogin) {
//       lastAction = str.login;
//     } else {
//       lastAction = str.logout;
//     }
//     super.initState();
//   }
//
//   bool isLoggedIn() {
//     String token = KeyDataSource().get(PrefKeys.keyToken);
//     print("ttt token = $token");
//     return token.isNotEmpty;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBarWidget(
//         title: str.menu,
//         onBackPressed: () => {},
//       ),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: Dimens.size10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: Dimens.size20),
//               child: Text(
//                 str.menu,
//                 style: textStyle.large.w700.fill(ColorName.boulder),
//               ),
//             ),
//             const Divider(
//               height: 2,
//               color: ColorName.dividerGray,
//             ),
//             if (isLogin)
//               rowMenu(
//                 str.setting,
//                 Assets.images.icSetting.image(width: 16),
//                 () => {
//                   context.go(
//                     "/${RouterConstants.menu}/${RouterConstants.setting}",
//                   )
//                 },
//               ),
//             rowMenu(
//               str.help,
//               Assets.images.icHelp.image(width: 16),
//               () => {
//                 context.go(
//                   "/${RouterConstants.menu}/${RouterConstants.faq}",
//                 )
//               },
//             ),
//             rowMenu(
//               str.privacy_policy,
//               Assets.images.icPolicy.image(width: 16),
//               () => {
//                 context.go(
//                   "/${RouterConstants.menu}/${RouterConstants.policy}",
//                 )
//               },
//             ),
//             rowMenu(
//               lastAction,
//               Assets.images.icLogin.image(width: 16),
//               () => {
//                 if (!isLogin)
//                   {
//                     context.go(
//                       "/${RouterConstants.menu}/${RouterConstants.login}",
//                     )
//                   }
//                 else
//                   {showDialogConfirm(context)}
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget rowMenu(String title, Image icon, dynamic action) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
//           child: Row(
//             children: [
//               icon,
//               const SizedBox(
//                 width: Dimens.size10,
//               ),
//               Text(
//                 title,
//                 style: textStyle.medium.w700.fill(ColorName.boulder),
//               )
//             ],
//           ),
//         ).onPressed(action),
//         const Divider(
//           height: 2,
//           color: ColorName.dividerGray,
//         ),
//       ],
//     );
//   }
//
//   void showDialogConfirm(BuildContext context) {
//     PopupUtils.showSimpleAlert(
//       context,
//       title: "Logout",
//       message: "Do you want to logout?",
//       customButtonActions: [
//         Center(
//           child: SizedBox(
//             width: 200,
//             height: Dimens.size40,
//             child: OutlinedButton(
//               onPressed: () => context.pop(),
//               style: OutlinedButton.styleFrom(
//                 side: const BorderSide(color: ColorName.dividerGray),
//               ),
//               child: Text(
//                 "Cancel",
//                 style: textStyle.large.w400.fill(ColorName.carbonGrey),
//               ),
//             ),
//           ),
//         ),
//         Center(
//           child: Container(
//             margin: const EdgeInsets.symmetric(vertical: Dimens.size20),
//             width: 200,
//             height: Dimens.size40,
//             child: ElevatedButton(
//               onPressed: () {
//                 print("ttt call logout");
//                 context.pop();
//               },
//               style: ElevatedButton.styleFrom(
//                   minimumSize: Size.zero, backgroundColor: ColorName.greenSnake),
//               child: Center(
//                 child: Text(
//                   "Yes",
//                   style: textStyle.large.w700.fill(Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
