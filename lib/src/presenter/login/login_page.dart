import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/gen_l10n/app_localizations.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe_design/inabe_design.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        title: str.login,
        backgroundColor: ColorName.main,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.size10),
          child: Column(
            children: [
              buildInputForm(),
              buildAction(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          str.login,
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
          obscure: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.size6),
          onValueChanged: (value) => {},
        ),
      ],
    );
  }

  Widget buildButtonLogin() {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(backgroundColor: ColorName.greenSnake),
        child: Center(
          child: Text(
            str.login,
            style: textStyle.medium.w700.fill(Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildButtonRegister() {
    return SizedBox(
      width: 200,
      child: OutlinedButton(
        onPressed: () => {context.push("/${RouterConstants.register}")},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: ColorName.greenSnake),
        ),
        child: Center(
          child: Text(
            str.press_to_register,
            style: textStyle.medium.w400.fill(ColorName.carbonGrey),
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
        buildButtonLogin(),
        const SizedBox(
          height: Dimens.size40,
        ),
        TextButton(
          onPressed: () => {
            context.go("/login/forgotPw"),
          },
          child: Text(
            str.press_to_forgot_password,
            style: textStyle.medium.w400.fill(ColorName.carbonGrey),
          ),
        ),
        const SizedBox(
          height: Dimens.size40,
        ),
        buildButtonRegister(),
      ],
    );
  }
}
