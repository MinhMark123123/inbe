// import 'package:aac_core/aac_core.dart';
// import 'package:inabe_design/inabe_design.dart';
//
// class PhoneInputWidget extends StatelessWidget {
//   bool enable;
//   bool readOnly;
//   bool showLabel;
//   bool showPrefix;
//   String? hintText;
//   String? labelText;
//   TextStyle? textStyleForm;
//   bool required;
//   InputFormController? inputFormController;
//   OnValueChanged? onValueChanged;
//   VoidCallback? onTap;
//
//   PhoneInputWidget(
//       {Key? key,
//       this.enable = true,
//       this.readOnly = false,
//       this.showLabel = false,
//       this.showPrefix = true,
//       this.hintText,
//       this.labelText,
//       this.textStyleForm,
//       this.inputFormController,
//       this.required = true,
//       this.onValueChanged,
//       this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     inputFormController?.required = required;
//
//     return TextInputWidget(
//       enable: enable,
//       readOnly: readOnly,
//       showLabel: showLabel,
//       hintText: hintText ?? '0987654321',
//       labelText: labelText ?? '0987654321',
//       textStyleForm: textStyleForm,
//       inputFormController: inputFormController,
//       keyboardType: TextInputType.phone,
//       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//       onValueChanged: (value) {
//         if (onValueChanged != null) {
//           onValueChanged!(value);
//         }
//       },
//       onTap: onTap,
//       prefixIcon: showPrefix
//           ? SizedBox(
//               child: Wrap(
//                 runAlignment: WrapAlignment.center,
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 direction: Axis.horizontal,
//                 children: [
//                   const SizedBox(width: Dimens.size10),
//                   // Assets.images.countryFlags.cVn
//                   //     .svg()
//                   //     .onPressed(_navigateToChooseCountry),
//                   Container(
//                       width: 0.5,
//                       height: 20,
//                       color: Colors.white,
//                       margin: const EdgeInsets.symmetric(horizontal: 10)),
//                   Text(
//                     Configs.defaultPrefixRegionCode,
//                     style: textStyle.large,
//                   ),
//                   const SizedBox(width: Dimens.size10),
//                 ],
//               ),
//             )
//           : null,
//     );
//   }
//
//   _navigateToChooseCountry() {
//     // toast('Choose country');
//   }
// }
