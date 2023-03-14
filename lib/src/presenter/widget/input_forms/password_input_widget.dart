// import 'package:aac_core/aac_core.dart';
// import 'package:inabe_design/inabe_design.dart';
//
// class PasswordInputWidget extends StatelessWidget {
//   bool enable;
//   bool readOnly;
//   bool showPrefix;
//   bool showLabel;
//   String? hintText;
//   String? labelText;
//   InputFormController? inputFormController;
//   OnValueChanged? onValueChanged;
//   VoidCallback? onTap;
//   final ValueNotifier<bool> _obscureController = ValueNotifier(true);
//
//   PasswordInputWidget(
//       {Key? key,
//       this.enable = true,
//       this.readOnly = false,
//       this.showPrefix = true,
//       this.showLabel = true,
//       this.hintText,
//       this.labelText,
//       this.inputFormController,
//       this.onValueChanged,
//       this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     inputFormController?.required = true;
//     return ValueListenableProvider.value(
//       value: _obscureController,
//       child: Consumer<bool>(
//         builder: (context, obscure, child) {
//           return TextInputWidget(
//               enable: enable,
//               readOnly: readOnly,
//               showLabel: showLabel,
//               hintText: hintText ?? str.password,
//               labelText: labelText ?? str.password,
//               inputFormController: inputFormController,
//               keyboardType: TextInputType.visiblePassword,
//               obscure: obscure,
//               onTap: onTap,
//               prefixIcon: showPrefix
//                   ? Wrap(
//                       runAlignment: WrapAlignment.center,
//                       crossAxisAlignment: WrapCrossAlignment.center,
//                       direction: Axis.horizontal,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15),
//                           child: Assets.images.auth.icLock.svg(),
//                         ),
//                         const SizedBox(width: Dimens.size10),
//                       ],
//                     )
//                   : null,
//               suffixIcon: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: obscure
//                     ? Assets.images.auth.icEye.svg()
//                     : Assets.images.auth.icEyeOff.svg(),
//               ).onPressed(() {
//                 _obscureController.value = !_obscureController.value;
//                 inputFormController?.focusLast();
//               }));
//         },
//       ),
//     );
//   }
// }
