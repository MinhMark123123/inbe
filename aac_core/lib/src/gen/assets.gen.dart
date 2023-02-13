/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Inter-Bold.ttf
  String get interBold => 'assets/fonts/Inter-Bold.ttf';

  /// File path: assets/fonts/Inter-Medium.ttf
  String get interMedium => 'assets/fonts/Inter-Medium.ttf';

  /// File path: assets/fonts/Inter-Regular.ttf
  String get interRegular => 'assets/fonts/Inter-Regular.ttf';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_arrow_back.png
  AssetGenImage get icArrowBack =>
      const AssetGenImage('assets/images/ic_arrow_back.png');

  /// File path: assets/images/ic_close.png
  AssetGenImage get icClose =>
      const AssetGenImage('assets/images/ic_close.png');

  /// File path: assets/images/ic_dropdown.svg
  SvgGenImage get icDropdown =>
      const SvgGenImage('assets/images/ic_dropdown.svg');

  /// File path: assets/images/ic_email.svg
  SvgGenImage get icEmail => const SvgGenImage('assets/images/ic_email.svg');

  /// File path: assets/images/ic_home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/images/ic_home.svg');

  /// File path: assets/images/ic_instagram.png
  AssetGenImage get icInstagram =>
      const AssetGenImage('assets/images/ic_instagram.png');

  /// File path: assets/images/ic_live.png
  AssetGenImage get icLive => const AssetGenImage('assets/images/ic_live.png');

  /// File path: assets/images/ic_logo_big.png
  AssetGenImage get icLogoBig =>
      const AssetGenImage('assets/images/ic_logo_big.png');

  /// File path: assets/images/ic_logo_small.png
  AssetGenImage get icLogoSmall =>
      const AssetGenImage('assets/images/ic_logo_small.png');

  /// File path: assets/images/ic_medicine_cabinet.svg
  SvgGenImage get icMedicineCabinet =>
      const SvgGenImage('assets/images/ic_medicine_cabinet.svg');

  /// File path: assets/images/ic_menu.svg
  SvgGenImage get icMenu => const SvgGenImage('assets/images/ic_menu.svg');

  /// File path: assets/images/ic_twitter.png
  AssetGenImage get icTwitter =>
      const AssetGenImage('assets/images/ic_twitter.png');

  /// File path: assets/images/ic_youtube.png
  AssetGenImage get icYoutube =>
      const AssetGenImage('assets/images/ic_youtube.png');
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
