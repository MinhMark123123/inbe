import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class ForgotPasswordSuccessPage extends StatefulWidget {
  const ForgotPasswordSuccessPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordSuccessPage> createState() =>
      _ForgotPasswordSuccessPageState();
}

class _ForgotPasswordSuccessPageState extends State<ForgotPasswordSuccessPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        backgroundColor: ColorName.main,
        onBackPressed: () => {context.pop()},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.size10),
          child: buildInputForm(context),
        ),
      ),
    );
  }

  Widget buildInputForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopBodyWidget(title: str.forgot_password_success_title),
        const SizedBox(
          height: Dimens.size20,
        ),
        Text(
          str.forgot_password_success_guide,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
        const SizedBox(
          height: Dimens.size40,
        ),
        Center(
          child: SizedBox(
            width: Dimens.widthButton,
            height: Dimens.size40,
            child: OutlinedButton(
              onPressed: () => {
                context.go("/${RouterConstants.login}")
              },
              style: OutlinedButton.styleFrom(
                minimumSize: Size.zero,
                side: const BorderSide(width: 2, color: ColorName.greenSnake),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                str.login_here,
                style: textStyle.medium.w400.fill(ColorName.greenSnake),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: Dimens.size30,
        ),
        Center(
          child: Text(
            str.reset_forgot_password_otp,
            style: textStyle.underline.medium.w400.fill(ColorName.carbonGrey),
          ).onPressedInkWell(
            () => context.go(
                "/${RouterConstants.login}/${RouterConstants.forgotPw}"),
          ),
        ),
        const SizedBox(
          height: Dimens.size30,
        ),
      ],
    );
  }
}
