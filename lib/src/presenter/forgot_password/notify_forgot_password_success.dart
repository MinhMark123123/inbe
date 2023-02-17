import 'package:aac_core/aac_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/gen_l10n/app_localizations.dart';
import 'package:inabe_design/inabe_design.dart';

class NotifyForgotPasswordSuccess extends StatefulWidget {
  const NotifyForgotPasswordSuccess({Key? key}) : super(key: key);

  @override
  State<NotifyForgotPasswordSuccess> createState() => _NotifyForgotPasswordSuccessState();
}

class _NotifyForgotPasswordSuccessState extends State<NotifyForgotPasswordSuccess> {
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
        title: str.forgot_password_success,
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
          str.forgot_password_success,
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
          str.forgot_password_success_desc,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.forgot_password_success_process,
          style: textStyle.medium.w400.fill(Colors.red),
        ),
      ],
    );
  }

  Widget buildButtonSend() {
    return SizedBox(
      width: 200,
      child: TextButton(
        onPressed: () => {
          buildShowCupertinoDialog()
        },
        // style: ElevatedButton.styleFrom(backgroundColor: ColorName.greenSnake),
        child: Center(
          child: Text(
            str.resend_forget_mail,
            style: textStyle.medium.w400.fill(ColorName.carbonGrey),
          ),
        ),
      ),
    );
  }

  Future<void> buildShowCupertinoDialog() {
    return showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  str.resend_forget_mail,
                  style: textStyle.large.w700.fill(ColorName.carbonGrey),
                ),
              ),
              content: Column(
                children: [
                  Text(
                    str.forget_check_mail,
                    style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                  ),
                  const SizedBox(
                    height: Dimens.size40,
                  ),
                  Text(
                    str.resend_forget_mail_process_content,
                    style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                  ),
                ],
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
        );
  }

  Widget buildAction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: Dimens.size40,
        ),
        buildButtonSend(),
        const SizedBox(
          height: Dimens.size40,
        ),
      ],
    );
  }
}
