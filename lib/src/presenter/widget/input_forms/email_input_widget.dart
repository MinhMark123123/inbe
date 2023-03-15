import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/presenter/widget/input_forms/input_form_controller.dart';
import 'package:inabe/src/presenter/widget/input_forms/text_input_widget.dart';
import 'package:inabe_design/dimens.dart';

typedef OnValueChanged = void Function(String? value);

class EmailInputWidget extends StatelessWidget {
  bool enable;
  bool readOnly;
  bool showPrefix;
  String? hintText;
  String? labelText;
  Image? iconEmail;
  InputFormController? inputFormController;
  OnValueChanged? onValueChanged;
  VoidCallback? onTap;

  EmailInputWidget(
      {Key? key,
      this.enable = true,
      this.readOnly = false,
      this.showPrefix = true,
      this.hintText,
      this.labelText,
      this.inputFormController,
      this.onValueChanged,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      enable: enable,
      readOnly: readOnly,
      hintText: hintText ?? 'Email',
      labelText: labelText ?? 'Email',
      inputFormController: inputFormController,
      keyboardType: TextInputType.emailAddress,
      onValueChanged: (value) {
        if (onValueChanged != null) {
          onValueChanged!(value);
        }
      },
      onTap: onTap,
      prefixIcon: showPrefix
          ? Wrap(
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: iconEmail,
                ),
                const SizedBox(width: Dimens.size10),
              ],
            )
          : null,
    );
  }
}
