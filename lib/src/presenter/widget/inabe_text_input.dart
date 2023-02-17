import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/presenter/widget/outline_input_border_extension.dart';
import 'package:inabe_design/inabe_design.dart';

typedef OnValueChanged = void Function(String? value);

class InabeTextInput extends StatelessWidget {
  String? text;
  String? hintText;
  double? height;
  bool obscure = false;
  bool enable = true;
  int? maxLines;
  int? maxLength;
  TextEditingController? controller;
  EdgeInsetsGeometry? contentPadding;
  TextInputType? keyboardType;
  OutlineInputBorder? border;
  OutlineInputBorder? focusedBorder;
  OutlineInputBorder? errorBorder;
  OnValueChanged? onValueChanged;

  InabeTextInput(
      {Key? key,
      this.text,
      this.hintText,
      this.height,
      this.obscure = false,
      this.enable = true,
      this.maxLines,
      this.maxLength,
      this.keyboardType,
      this.controller,
      this.border,
      this.errorBorder,
      this.focusedBorder,
      this.onValueChanged,
      this.contentPadding})
      : super(key: key) {
    height ??= Dimens.size30;
    border ??= inputBorder.normal();
    focusedBorder ??= inputBorder.focus();
    errorBorder ??= inputBorder.error();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onChanged: (value) {
          if (onValueChanged != null) {
            onValueChanged!(value);
          }
        },
        controller: controller,
        style: textStyle.xMedium.w400,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: contentPadding ?? EdgeInsets.zero,
          focusedBorder: focusedBorder,
          border: border,
          errorBorder: errorBorder,
        ),
        obscureText: obscure,
        enableSuggestions: false,
        autocorrect: false,
        maxLines: 1,
      ),
    );
  }
}
