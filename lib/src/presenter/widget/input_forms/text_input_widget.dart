import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/presenter/widget/input_forms/input_form_controller.dart';
import 'package:inabe_design/dimens.dart';

typedef OnValueChanged = void Function(String? value);

class TextInputWidget extends StatelessWidget {
  String? text;
  String? hintText;
  String? labelText;
  Color? fillColor;
  TextStyle? textStyleForm;
  double height;
  double minHeight;
  double maxHeight;
  bool obscure;
  bool enable;
  bool readOnly;
  bool showLabel;
  bool autofocus;
  int? maxLines;
  int? maxLength;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  OnValueChanged? onValueChanged;
  VoidCallback? onTap;
  dynamic onEditingComplete;
  OutlineInputBorder? border;
  OutlineInputBorder? focusedBorder;
  OutlineInputBorder? errorBorder;
  List<TextInputFormatter>? inputFormatters;
  InputFormController? inputFormController;
  TextAlignVertical? textAlignVertical;
  final int? minLines;

  TextInputWidget({
    Key? key,
    this.text,
    this.hintText,
    this.labelText,
    this.fillColor = Colors.transparent,
    this.height = Dimens.defaultInputHeight,
    this.minHeight = Dimens.defaultInputHeight,
    this.maxHeight = double.infinity,
    this.obscure = false,
    this.enable = true,
    this.readOnly = false,
    this.showLabel = true,
    this.autofocus = false,
    this.maxLines,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.onValueChanged,
    this.onTap,
    this.onEditingComplete,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.inputFormatters,
    this.inputFormController,
    this.textAlignVertical = TextAlignVertical.center,
    this.textStyleForm,
    this.maxLength,
    this.minLines,
  }) : super(key: key) {
    // border ??= inputBorder.normal();
    // focusedBorder ??= inputBorder.focus();
    // errorBorder ??= inputBorder.error();

    if (inputFormController?.textEditingController != null && text != null) {
      inputFormController?.textEditingController.text = text!;
    }

    maxLines = maxLines ?? (keyboardType == TextInputType.multiline ? null : 1);

    if (maxLines == 1) {
      inputFormController?.textEditingController.text =
          TextUtils.removeBreakLine(
              inputFormController?.textEditingController.text);
    }

    labelText = showLabel ? (labelText ?? hintText) : null;
    if (showLabel &&
        TextUtils.isNotEmpty(labelText) &&
        (inputFormController?.required ?? false)) {
      labelText = '$labelText *';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints:
              BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
          child: TextFormField(
            key: key,
            focusNode: inputFormController?.focusNode,
            style: textStyleForm,
            textAlignVertical: textAlignVertical,
            obscureText: obscure,
            enabled: enable,
            readOnly: readOnly,
            autofocus: autofocus,
            controller: inputFormController?.textEditingController,
            keyboardType: keyboardType,
            maxLines: maxLines,
            minLines: minLines ?? 1,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              fillColor: enable ? fillColor : ColorName.primaryBlue,
              filled: true,
              prefixIconConstraints: BoxConstraints(
                  minWidth: Dimens.inputFormPadding,
                  minHeight: minHeight,
                  maxHeight: maxHeight),
              suffixIconConstraints: BoxConstraints(
                  minWidth: Dimens.inputFormPadding,
                  minHeight: minHeight,
                  maxHeight: maxHeight),
              prefixIcon: SizedBox(
                height: minHeight,
                child: prefixIcon,
              ),
              suffixIcon: suffixIcon,
              isCollapsed: true,
              contentPadding: const EdgeInsets.only(
                  left: Dimens.inputFormPadding,
                  top: Dimens.inputFormPadding,
                  bottom: Dimens.inputFormPadding),
              hintText: hintText,
              hintStyle: textStyle.medium.fill(ColorName.greenB7),
              // label: showLabel
              //     ? RichTextSpanWidget(
              //         labelText ?? '',
              //         normalTextStyle: textStyle.medium.fill(ColorName.grey7C),
              //         richTextColor: ColorName.primaryRed,
              //         spanTexts: const [' *'],
              //       )
              //     : null,
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              border: border,
              focusedBorder: focusedBorder,
              errorBorder: errorBorder,
            ),
            onChanged: (value) {
              if (onValueChanged != null) {
                onValueChanged!(value);
              }
            },
            onTap: onTap,
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
              onEditingComplete;
            },
          ),
        ),
        // inputFormController != null
        //     ? ChangeNotifierProvider<InputFormController>.value(
        //         value: inputFormController!,
        //         builder: (context, child) {
        //           inputFormController = context.watch<InputFormController>();
        //           return _buildValidation;
        //         })
        //     : _buildValidation,
      ],
    );
  }

Widget get _buildValidation => Visibility(
      visible: TextUtils.isNotEmpty(inputFormController?.validation),
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            '${inputFormController?.validation}',
            style: textStyle.small.fill(Colors.red),
          ),
        ),
      ),
    );
}
