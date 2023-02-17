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
  // static appInit(BuildContext context) {
  //   /// System UI
  //   SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness: Brightness.dark,
  //     ),
  //   );
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
  // }

  static splashInit(BuildContext context) async {

    /// Init screen
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Configs.screenSize = mediaQueryData.size;
    Configs.screenWidth = mediaQueryData.size.width;
    Configs.screenHeight = mediaQueryData.size.height;
    Configs.screenPadding = mediaQueryData.padding;

    print("ttt ${Configs.screenSize}");

    /// Api Service
    // await GraphQLConfig.init();
    // await RestfulConfig.init();

    /// Hive
    // await Hive.initFlutter('.${appInfo.packageName}');

    /// Installation source
    // await PackageUtils.getInstallationSourceName();

    /// Installation source
    // await PackageUtils.getAdvertisingId();

    /// Tracking
    // TrackingHandler.trackSessionStart();
  }
}
