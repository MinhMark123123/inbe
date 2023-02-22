import 'package:aac_core/aac_core.dart';


TextStyle textStyle = TextStyleX.df;

const defaultTextColor = ColorName.carbonGrey;

extension TextStyleX on TextStyle {
  static TextStyle get df => const TextStyle().medium;

  TextStyle fill(Color? color) => copyWith(color: color ?? defaultTextColor);

  TextStyle size(double fontSize) =>
      copyWith(fontSize: Configs.autoResizeScreen ? fontSize.sp : fontSize);

  TextStyle font(String fontFamily) => copyWith(fontFamily: fontFamily);

  TextStyle get x2Small =>
      copyWith(fontSize: Configs.autoResizeScreen ? 8.sp : 8);

  TextStyle get xSmall =>
      copyWith(fontSize: Configs.autoResizeScreen ? 10.sp : 10);

  TextStyle get small =>
      copyWith(fontSize: Configs.autoResizeScreen ? 12.sp : 12);

  TextStyle get xMedium =>
      copyWith(fontSize: Configs.autoResizeScreen ? 13.sp : 13);

  TextStyle get medium =>
      copyWith(fontSize: Configs.autoResizeScreen ? 14.sp : 14);

  TextStyle get xxMedium =>
      copyWith(fontSize: Configs.autoResizeScreen ? 15.sp : 15);

  TextStyle get large =>
      copyWith(fontSize: Configs.autoResizeScreen ? 16.sp : 16);

  TextStyle get mLarge =>
      copyWith(fontSize: Configs.autoResizeScreen ? 17.sp : 17);

  TextStyle get xLarge =>
      copyWith(fontSize: Configs.autoResizeScreen ? 18.sp : 18);

  TextStyle get x2Large =>
      copyWith(fontSize: Configs.autoResizeScreen ? 20.sp : 20);

  TextStyle get x3Large =>
      copyWith(fontSize: Configs.autoResizeScreen ? 22.sp : 22);

  TextStyle get x4Large =>
      copyWith(fontSize: Configs.autoResizeScreen ? 24.sp : 24);

  TextStyle get x5Large =>
      copyWith(fontSize: Configs.autoResizeScreen ? 28.sp : 28);

  TextStyle weight(FontWeight fontWeight) => copyWith(fontWeight: fontWeight);

  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);

  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
}
