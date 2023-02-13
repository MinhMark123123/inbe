import 'package:aac_core/aac_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/gen_l10n/app_localizations.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe_design/inabe_design.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late AppLocalizations str;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    str = AppLocalizations.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.change_password,
        backgroundColor: ColorName.main,
        onBackPressed: () => {context.pop()},
      ),
      body: buildPage(),
    );
  }

  Widget buildPage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.size10),
        child: Column(
          children: [
            buildInputForm(),
            buildAction(),
          ],
        ),
      ),
    );
  }

  Widget buildInputForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          str.change_password,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.materialSmall,
        ),
        const Divider(
          height: 1,
          color: ColorName.dividerGray,
        ),
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.change_password_desc,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size40,
        ),
        Text(
          str.password,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabeTextInput(
          hintText: str.password,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {},
          obscure: true,
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        Text(
          str.current_password_desc,
          style: textStyle.xSmall.w400,
        ),
        const SizedBox(
          height: Dimens.size40,
        ),
        Text(
          str.confirm_password,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabeTextInput(
          hintText: str.confirm_password,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {},
          obscure: true,
        ),
      ],
    );
  }

  Widget buildButtonChangePassword() {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () => {
          showCupertinoDialog(
            context: context,
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
                    onPressed: () => {context.pop()},
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
          )
        },
        style: ElevatedButton.styleFrom(backgroundColor: ColorName.greenSnake),
        child: Center(
          child: Text(
            str.change_password,
            style: textStyle.medium.w700.fill(Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildAction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: Dimens.size40,
        ),
        buildButtonChangePassword(),
        const SizedBox(
          height: Dimens.size40,
        ),
      ],
    );
  }
}
