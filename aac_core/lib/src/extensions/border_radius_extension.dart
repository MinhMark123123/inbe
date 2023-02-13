import 'package:aac_core/aac_core.dart';

BorderRadius borderRadius = BorderRadiusX.df;

extension BorderRadiusX on BorderRadius {
  static BorderRadius get df => BorderRadius.zero;

  BorderRadius round(double? radius) =>
      BorderRadius.all(Radius.circular(radius ?? 0));

  BorderRadius corner(
          {double? topLeft,
          double? topRight,
          double? bottomRight,
          double? bottomLeft}) =>
      copyWith(
          topLeft: Radius.circular(topLeft ?? 0),
          topRight: Radius.circular(topRight ?? 0),
          bottomRight: Radius.circular(bottomRight ?? 0),
          bottomLeft: Radius.circular(bottomLeft ?? 0));
}
