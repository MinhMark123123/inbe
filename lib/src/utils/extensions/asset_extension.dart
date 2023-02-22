import 'package:aac_core/aac_core.dart';
import 'package:inabe/gen_l10n/app_localizations.dart';
import 'package:inabe/src/navigation/app_routers.dart';

//
BuildContext? context =
    AppGoRouter().router.routerDelegate.navigatorKey.currentContext;


BuildContext? shellContext =
    AppGoRouter().router.routerDelegate.navigatorKey.currentContext;

AppLocalizations get str => AppLocalizations.of(Configs.globalContext);
//
// extension AssetGenImageX on AssetGenImage {
//   Widget decor({
//     Color? color,
//     Color? background,
//     double? width,
//     double? height,
//     EdgeInsetsGeometry? padding,
//     EdgeInsetsGeometry? margin,
//     AlignmentGeometry? alignment,
//     BoxFit fit = BoxFit.contain,
//     dynamic frameBuilder,
//     dynamic errorBuilder,
//     BoxDecoration? boxDecoration,
//   }) =>
//       image(
//         color: color,
//         width: width,
//         height: height,
//         fit: fit,
//         // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
//         //   return frameBuilder ?? const SizedBox.shrink();
//         // },
//         errorBuilder: (context, error, stackTrace) {
//           return errorBuilder ?? const SizedBox.shrink();
//         },
//       ).decor(
//           background: background,
//           padding: padding,
//           margin: margin,
//           alignment: alignment,
//           boxDecoration: boxDecoration);
// }
//
// extension SvgGenImageX on SvgGenImage {
//   Widget decor({
//     Color? color,
//     Color? background,
//     double? width,
//     double? height,
//     EdgeInsetsGeometry? padding,
//     EdgeInsetsGeometry? margin,
//     AlignmentGeometry? alignment,
//     BoxFit fit = BoxFit.contain,
//     dynamic placeholderBuilder,
//     BoxDecoration? boxDecoration,
//   }) =>
//       svg(
//         color: color,
//         width: width,
//         height: height,
//         fit: fit,
//         placeholderBuilder: (context) {
//           return placeholderBuilder ?? const SizedBox.shrink();
//         },
//       ).decor(
//         background: background,
//         padding: padding,
//         margin: margin,
//         alignment: alignment,
//         boxDecoration: boxDecoration,
//       );
// }
