import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/presenter/widget/inabe_text_input.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';
import 'package:inabe_design/dimens.dart';

typedef OnValueChanged = void Function(String? value);

class InabeNicknameInputWidget extends StatelessWidget {
  bool enable;
  bool readOnly;
  bool showPrefix;
  String? hintText;
  String? labelText;
  Image? iconEmail;
  TextEditingController controller;
  OnValueChanged? onValueChanged;
  OutlineInputBorder? errorBorder;
  VoidCallback? onTap;
  bool isFirst = true;

  InabeNicknameInputWidget(
      {Key? key,
      this.enable = true,
      this.readOnly = false,
      this.showPrefix = true,
      this.hintText,
      this.labelText,
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
        print("ttt --> Inabe nickname input value listener");
        return Column(
          children: [
            InabeTextInput(
              enable: enable,
              hintText: hintText,
              controller: controller,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: Dimens.size6),
              keyboardType: TextInputType.text,
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

  Widget get _buildValidation => Visibility(
        visible:
            !isFirst && TextUtils.isNotEmpty(controller.validateNickname()),
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              controller.validateNickname(),
              style: textStyle.xSmall.w400.fill(Colors.red),
            ),
          ),
        ),
      );
}
