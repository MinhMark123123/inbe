// import 'package:flutter/cupertino.dart';
// import 'package:aac_core/aac_core.dart';
// import 'package:inabe_design/inabe_design.dart';
//
// class NormalButtonWidget extends StatelessWidget {
//   String text;
//   bool fullWidthButton;
//   TextStyle? buttonTextStyle;
//   bool enable;
//   bool enableShadow;
//   double radius;
//   double? width;
//   double height;
//   EdgeInsets? padding;
//   Color color;
//   Color shadowColor;
//   Color? loadingColor;
//   double shadowBlurRadius;
//   Offset shadowOffset;
//   Color strokeColor;
//   double strokeWidth;
//   Widget? icon;
//   ButtonController? buttonController;
//   VoidCallback? onPressed;
//
//   NormalButtonWidget({
//     Key? key,
//     required this.text,
//     this.fullWidthButton = false,
//     this.buttonTextStyle,
//     this.enable = true,
//     this.enableShadow = false,
//     this.radius = Dimens.smallRadius,
//     this.width,
//     this.height = Dimens.defaultButtonHeight,
//     this.padding,
//     this.color = ColorName.primaryColor,
//     this.shadowColor = Colors.black26,
//     this.loadingColor = Colors.white,
//     this.shadowBlurRadius = 5,
//     this.shadowOffset = const Offset(2, 2),
//     this.strokeColor = Colors.transparent,
//     this.strokeWidth = 0,
//     this.icon,
//     this.onPressed,
//     this.buttonController,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return buttonController != null
//         ? ChangeNotifierProvider<ButtonController>.value(
//             value: buttonController!,
//             builder: (context, child) {
//               buttonController = context.watch<ButtonController>();
//               enable = buttonController!.enable;
//               return _buildLayout;
//             },
//           )
//         : _buildLayout;
//   }
//
//   bool get _isLoading => buttonController?.loading ?? false;
//
//   Widget get _buildLayout => Stack(
//         alignment: Alignment.center,
//         children: [
//           GFButton(
//             onPressed: enable ? onPressed : null,
//             text: _isLoading ? '' : text,
//             fullWidthButton: fullWidthButton,
//             size: height,
//             padding: padding ?? EdgeInsets.zero,
//             elevation: enableShadow ? 5 : 0,
//             buttonBoxShadow: enableShadow,
//             boxShadow: enableShadow
//                 ? BoxShadow(
//                     color: shadowColor,
//                     blurRadius: shadowBlurRadius,
//                     offset: shadowOffset)
//                 : null,
//             shape: GFButtonShape.pills,
//             color: enable ? color : const Color(0xFFECECEC),
//             disabledColor: enable ? color : const Color(0xFFECECEC),
//             textColor: Colors.white,
//             disabledTextColor: const Color(0xFF3B3945),
//             textStyle: buttonTextStyle ??
//                 textStyle.large.w500
//                     .fill(enable ? Colors.white : const Color(0xFF3B3945)),
//             borderShape: borderShape
//                 .round(radius)
//                 .stroke(width: strokeWidth, color: strokeColor),
//             icon: icon,
//             highlightColor: Colors.white24,
//             highlightElevation: 0,
//             splashColor: Colors.white24,
//           ).decor(width: width),
//           CupertinoActivityIndicator(
//                   animating: true,
//                   color: enable ? loadingColor : const Color(0xFF7C7C7C)
//           )
//               .show(_isLoading),
//         ],
//       );
// }
//
// class ButtonController extends ChangeNotifier {
//   bool enable;
//   bool loading;
//
//   ButtonController(this.enable, this.loading);
//
//   update({bool? enable, bool? loading}) {
//     bool isChanged = false;
//     if (this.enable != enable && enable != null) {
//       this.enable = enable;
//       isChanged = true;
//     }
//     if (this.loading != loading && loading != null) {
//       this.loading = loading;
//       isChanged = true;
//     }
//     if (isChanged) {
//       notifyListeners();
//     }
//   }
// }
