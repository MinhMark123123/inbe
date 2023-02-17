import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/base_component/custom_appbar_widget.dart';
import 'package:inabe_design/dimens.dart';

class MenuPage extends StatefulWidget {
  bool isLogin;

  MenuPage({
    Key? key,
    this.isLogin = false,
  }) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // late AppLocalizations str;
  late String lastAction;

  @override
  void initState() {
    if (!widget.isLogin) {
      lastAction = str.login;
    } else {
      lastAction = str.logout;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // str = AppLocalizations.of(context);

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
            if (widget.isLogin)
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
                context.go("/${RouterConstants.login}"),
              },
            ),
            rowMenu(
              str.privacy_policy,
              Assets.images.icPolicy.image(width: 16),
              () => {
                context.go("/${RouterConstants.login}"),
              },
            ),
            rowMenu(
              lastAction,
              Assets.images.icLogin.image(width: 16),
              () => {
                context.go(
                  "/${RouterConstants.login}",
                ),
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
}
