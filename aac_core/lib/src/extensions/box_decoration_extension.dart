import 'package:aac_core/aac_core.dart';
import 'package:flutter/material.dart';

BoxDecoration boxDecoration = BoxDecorationX.df;

const defaultColor = Colors.transparent;
const defaultStrokeColor = Colors.transparent;

extension BoxDecorationX on BoxDecoration {
  static BoxDecoration get df => BoxDecoration(
      border: Border.all(color: defaultColor, width: 0), color: defaultColor);

  BoxDecoration clear({Color color = Colors.white}) =>
      BoxDecoration(border: Border.all(color: color, width: 0), color: color);

  BoxDecoration fill(Color? color) => copyWith(color: color ?? defaultColor);

  BoxDecoration round(double? radius) =>
      copyWith(borderRadius: borderRadius.round(radius));

  BoxDecoration circle() => copyWith(borderRadius: borderRadius.round(60));

  BoxDecoration borderR({BorderRadius? borderRadius}) =>
      copyWith(borderRadius: borderRadius);

  BoxDecoration corner(
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

  BoxDecoration stroke({double? width, Color? color}) => copyWith(
      border:
          Border.all(width: width ?? 0, color: color ?? defaultStrokeColor));

  BoxDecoration shadow(
          {Color color = Colors.white24,
          double blurRadius = 7,
          double spreadRadius = 0,
          double offsetX = 0,
          double offsetY = 0}) =>
      copyWith(boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: Offset(offsetX, offsetY),
        ),
      ]);
}
