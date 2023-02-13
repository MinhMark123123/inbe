import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/gen_l10n/app_localizations.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe_design/inabe_design.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
        title: str.forgot_password,
        backgroundColor: ColorName.main,
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
          str.forgot_password,
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
          str.forgot_password_desc,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
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
      ],
    );
  }

  Widget buildButtonSend() {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () => {
          context.pop()
        },
        style: ElevatedButton.styleFrom(backgroundColor: ColorName.greenSnake),
        child: Center(
          child: Text(
            str.send,
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
        buildButtonSend(),
        const SizedBox(
          height: Dimens.size40,
        ),
      ],
    );
  }
}
