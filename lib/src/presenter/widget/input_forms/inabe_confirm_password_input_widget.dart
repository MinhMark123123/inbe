import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';
import 'package:inabe_design/dimens.dart';

typedef OnValueChanged = void Function(String? value);
typedef OnValidate = void Function(bool value);

class InabePasswordAndConfirmWidget extends StatelessWidget {
  bool enable;
  bool readOnly;
  bool showPrefix;
  String? hintText;
  String? labelText;
  Image? iconPassword;
  TextEditingController controller;
  OnValueChanged? onValueChanged;
  OnValidate? onValidate;
  OutlineInputBorder? errorBorder;
  VoidCallback? onTap;
  bool isFirst = true;
  TextEditingController confirmController = TextEditingController();

  InabePasswordAndConfirmWidget(
      {Key? key,
      this.enable = true,
      this.readOnly = false,
      this.showPrefix = true,
      this.hintText,
      this.labelText,
      required this.controller,
      this.errorBorder,
      this.onValueChanged,
      this.onValidate,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ttt --> build Inabe pw and confirm password input value listener");
    return ValueListenableBuilder(
        valueListenable: confirmController,
        builder: (context, confirmControllerPW, __) {
          return ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, controllerPW, __) {
                print(
                    "ttt --> Inabe pw and confirm password input value listener");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      str.password,
                      style: textStyle.medium.w700.fill(ColorName.carbonGrey),
                    ),
                    const SizedBox(
                      height: Dimens.size10,
                    ),
                    InabeTextInput(
                      hintText: str.password,
                      controller: controller,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: Dimens.size6),
                      onValueChanged: (value) {
                        isFirst = false;
                        onValidate?.call(checkValidate());
                      },
                      obscure: true,
                    ),
                    _buildValidationPW,
                    const SizedBox(
                      height: Dimens.size10,
                    ),
                    Text(
                      str.current_password_desc,
                      style: textStyle.xSmall.w400,
                    ),
                    const SizedBox(
                      height: Dimens.size30,
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
                      controller: confirmController,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: Dimens.size6),
                      onValueChanged: (value) {
                        isFirst = false;
                        onValidate?.call(checkValidate());
                      },
                      obscure: true,
                    ),
                    _buildValidation(confirmController
                        .validateConfirmPassword(controller.text)),
                  ],
                );
              });
        });

    //   return ValueListenableBuilder(
    //     valueListenable: controller,
    //     builder: (context, value, __) {
    //       print("ttt --> Inabe confirm password input value listener");
    //       return Column(
    //         children: [
    //           InabeTextInput(
    //             obscure: true,
    //             enable: enable,
    //             hintText: hintText,
    //             controller: controller,
    //             contentPadding:
    //                 const EdgeInsets.symmetric(horizontal: Dimens.size6),
    //             keyboardType: TextInputType.emailAddress,
    //             errorBorder: errorBorder,
    //             onValueChanged: (value) {
    //               isFirst = false;
    //               if (onValueChanged != null) {
    //                 onValueChanged!(value);
    //               }
    //             },
    //           ),
    //           _buildValidation,
    //         ],
    //       );
    //     },
    //   );
  }

  Widget _buildValidation(String text) => Visibility(
        visible: !isFirst && TextUtils.isNotEmpty(text),
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              text,
              style: textStyle.xSmall.w400.fill(Colors.red),
            ),
          ),
        ),
      );

  Widget get _buildValidationPW => Visibility(
        visible:
            !isFirst && TextUtils.isNotEmpty(controller.validatePassword()),
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              controller.validatePassword(),
              style: textStyle.xSmall.w400.fill(Colors.red),
            ),
          ),
        ),
      );

  bool checkValidate() {
    return TextUtils.isEmpty(controller.validatePassword()) &&
        TextUtils.isEmpty(
            confirmController.validateConfirmPassword(controller.text));
  }
}
