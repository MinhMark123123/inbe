import 'dart:io';

import 'package:aac_core/aac_core.dart';
import 'package:flutter/material.dart';

class AppConfigs {
  // static Future<void> firstInit() async {
  //   await configureDependencies();
  //
  //   /// Package info
  //   await PackageUtils.getPackageInfo();
  // }
  //
  static appInit(BuildContext context) {
    /// System UI
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  //
  //   /// Cache large image
  //   ImageUtils.cache(context, [
  //     Assets.images.bgSplash.image().image,
  //     Assets.images.community.bgHeader.image().image,
  //     Assets.images.community.bgHeaderRectangle.image().image,
  //   ]);
  //
  //   /// WebView
  //   if (Platform.isAndroid) {
  //     WebView.platform = AndroidWebView();
  //   }
  }
}
