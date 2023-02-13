import 'package:aac_core/aac_core.dart';

const Map<int, Color> dummySwatchMap = {
  50: Colors.transparent,
  100: Colors.transparent,
  200: Colors.transparent,
  300: Colors.transparent,
  400: Colors.transparent,
  500: Colors.transparent,
  600: Colors.transparent,
  700: Colors.transparent,
  800: Colors.transparent,
  900: Colors.transparent,
};

extension ColorX on int {
  MaterialColor toMaterialColor() => MaterialColor(this, dummySwatchMap);

  Color toColor() => Color(this);
}

extension ColorX2 on Color {
  MaterialColor toMaterialColor() => value.toMaterialColor();
}
