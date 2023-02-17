import 'dart:io';

import 'package:aac_core/aac_core.dart';
import 'package:extended_image/extended_image.dart';
import 'package:shimmer/shimmer.dart';

typedef OnTapImage = Function(
    BuildContext context, UniqueKey tag, ExtendedImage image);

class ImageViewWidget extends StatelessWidget {
  String source;
  Color? color;
  Color? backgroundColor;
  Widget? placeHolder;
  Widget? errorHolder;
  BoxFit? fit;
  double? width;
  double? height;
  BoxShape? shape;
  BorderRadius? borderRadius;
  BoxBorder? border;
  Alignment alignment;
  OnTapImage? onTapImage;
  late ExtendedImage extendedImage;

  ImageViewWidget(
    this.source, {
    Key? key,
    this.color,
    this.backgroundColor,
    this.placeHolder,
    this.errorHolder,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.border,
    this.alignment = Alignment.center,
    this.onTapImage,
  }) : super(key: key) {
    width ??= 200;
    height ??= 150;
    // errorHolder ??= Assets.images.community.logoDefault
    //     .image(width: width, height: height, fit: BoxFit.cover);
    extendedImage = source.startsWith('asset')
        ? _extendedAssetImage
        : source.startsWith('http')
            ? _extendedNetworkImage
            : _extendedFileImage;
  }

  @override
  Widget build(BuildContext context) {
    Widget child = extendedImage;
    if (backgroundColor != null) {
      child = extendedImage.decor(
          boxDecoration: boxDecoration
              .fill(backgroundColor)
              .borderR(borderRadius: borderRadius));
    }
    if (onTapImage != null) {
      final UniqueKey tag = UniqueKey();
      return GestureDetector(
        onTap: () {
          onTapImage!(context, tag, extendedImage);
        },
        child: Hero(tag: tag, child: child),
      );
    }
    return child;
  }

  ExtendedImage get _extendedAssetImage => ExtendedImage.asset(
        source,
        color: color,
        fit: fit,
        width: width,
        height: height,
        enableLoadState: false,
        shape: shape,
        border: border,
        alignment: alignment,
        borderRadius: borderRadius,
        filterQuality: FilterQuality.high,
        mode: ExtendedImageMode.none,
        loadStateChanged: _loadStateChanged,
      );

  ExtendedImage get _extendedNetworkImage => ExtendedImage.network(
        source,
        color: color,
        fit: fit,
        width: width,
        height: height,
        enableLoadState: true,
        cache: true,
        printError: false,
        shape: shape,
        border: border,
        alignment: alignment,
        borderRadius: borderRadius,
        filterQuality: FilterQuality.high,
        mode: ExtendedImageMode.none,
        loadStateChanged: _loadStateChanged,
      );

  ExtendedImage get _extendedFileImage => ExtendedImage.file(
        File(source),
        color: color,
        fit: fit,
        width: width,
        height: height,
        enableLoadState: true,
        shape: shape,
        border: border,
        alignment: alignment,
        borderRadius: borderRadius,
        filterQuality: FilterQuality.high,
        mode: ExtendedImageMode.none,
        loadStateChanged: _loadStateChanged,
      );

  LoadStateChanged get _loadStateChanged => (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return placeHolder ?? _shimmerHolder;
          case LoadState.failed:
            return errorHolder ?? _shimmerHolder;
          default:
            return null;
        }
      };
}

Widget get _shimmerHolder => Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.white,
      ),
    );
