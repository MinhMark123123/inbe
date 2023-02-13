import 'package:aac_core/aac_core.dart';

OutlineInputBorder inputBorder = OutlineInputBorderX.df;

const Color defaultBorderColor = ColorName.boulder;
const Color defaultFocusedBorderColor = ColorName.frenchBlue;
const Color defaultErrorBorderColor = ColorName.primaryRed;

extension OutlineInputBorderX on OutlineInputBorder {
  static OutlineInputBorder get df => const OutlineInputBorder().normal();

  OutlineInputBorder round(double? radius) =>
      copyWith(borderRadius: borderRadius.round(radius));

  OutlineInputBorder corner(
          {double? topLeft,
          double? topRight,
          double? bottomRight,
          double? bottomLeft}) =>
      copyWith(
          borderRadius: borderRadius.corner(
              topLeft: topLeft,
              topRight: topRight,
              bottomRight: bottomRight,
              bottomLeft: bottomLeft));

  OutlineInputBorder normal({Color? color, double? width}) => copyWith(
      borderSide: (color == Colors.transparent)
          ? BorderSide.none
          : BorderSide(width: width ?? 0, color: color ?? defaultBorderColor));

  OutlineInputBorder focus({Color? color, double? width}) => copyWith(
      borderSide: (color == Colors.transparent)
          ? BorderSide.none
          : BorderSide(
              width: width ?? 2, color: color ?? defaultFocusedBorderColor));

  OutlineInputBorder error({Color? color, double? width}) => copyWith(
      borderSide: (color == Colors.transparent)
          ? BorderSide.none
          : BorderSide(
              width: width ?? 0, color: color ?? defaultErrorBorderColor));
}
