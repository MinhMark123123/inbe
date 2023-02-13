import 'package:aac_core/aac_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/gen_l10n/app_localizations.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe_design/inabe_design.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        title: str.register_label,
        backgroundColor: ColorName.main,
        onBackPressed: () => {
          context.pop()
        },
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
          str.register_label,
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
          height: Dimens.materialLarge,
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
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {},
        ),
        const SizedBox(
          height: Dimens.size40,
        ),
        Text(
          str.email,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        InabeTextInput(
          hintText: str.email,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {},
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
        const SizedBox(
          height: Dimens.size40,
        ),
        Text(
          str.choose_category,
          style: textStyle.medium.w700,
        ),
        const SizedBox(
          height: Dimens.size10,
        ),
        Text(
          str.choose_category_desc,
          style: textStyle.xSmall.w400,
        ),
        const SizedBox(
          height: Dimens.size20,
        ),
        Container(
          height: 100,
          color: Colors.yellow,
        ),
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.choose_category_desc_more,
          style: textStyle.medium.w400,
        ),
        const SizedBox(
          height: Dimens.size40,
        ),
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
        const SizedBox(
          height: Dimens.size20,
        ),
        Container(
          height: 100,
          color: Colors.yellow,
        ),
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

  Widget buildButtonRegister() {
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
                    onPressed: () => {
                      context.pop()
                    },
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
            str.register,
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
        buildButtonRegister(),
        const SizedBox(
          height: Dimens.size40,
        ),
      ],
    );
  }
}
