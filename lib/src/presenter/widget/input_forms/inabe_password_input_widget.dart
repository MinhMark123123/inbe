import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe/src/presenter/widget/input_forms/input_form_controller.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';
import 'package:inabe_design/dimens.dart';

typedef OnValueChanged = void Function(String? value);

class InabePasswordInputWidget extends StatelessWidget {
  bool enable;
  bool readOnly;
  bool showPrefix;
  String? hintText;
  String? labelText;
  Image? iconPassword;
  InputFormController? inputFormController;
  TextEditingController controller;
  OnValueChanged? onValueChanged;
  OutlineInputBorder? errorBorder;
  VoidCallback? onTap;
  bool isFirst = true;

  InabePasswordInputWidget(
      {Key? key,
      this.enable = true,
      this.readOnly = false,
      this.showPrefix = true,
      this.hintText,
      this.labelText,
      this.inputFormController,
      required this.controller,
      this.errorBorder,
      this.onValueChanged,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, __) {
        print("ttt --> Inabe password input value listener");
        return Column(
          children: [
            InabeTextInput(
              obscure: true,
              enable: enable,
              hintText: hintText,
              controller: controller,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: Dimens.size6),
              keyboardType: TextInputType.emailAddress,
              errorBorder: errorBorder,
              onValueChanged: (value) {
                isFirst = false;
                if (onValueChanged != null) {
                  onValueChanged!(value);
                }
              },
            ),
            _buildValidation,
          ],
        );
      },
    );
  }

  Wrap _buildPrefixWidget() {
    return Wrap(
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.horizontal,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: iconPassword,
        ),
        const SizedBox(width: Dimens.size10),
      ],
    );
  }

  Widget get _buildValidation => Visibility(
        // visible: TextUtils.isNotEmpty(inputFormController?.validation),
        visible: !isFirst && TextUtils.isNotEmpty(controller.validatePassword()),
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              controller.validateEmail(),
              style: textStyle.xSmall.w400.fill(Colors.red),
            ),
          ),
        ),
      );
}
