import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:aac_core/aac_core.dart';

class Configs {
  static bool get buildUAT =>
      AppEnvironment().environment == AppEnvironment.uat;

  /*static Size screenSize = Size.zero;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static EdgeInsets screenPadding = EdgeInsets.zero;*/

  // Global Navigator Key
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Global BuildContext
  static final BuildContext globalContext = navigatorKey.currentContext!;
  //
  // // Theme
  // static const ThemeMode defaultTheme = ThemeMode.light;

  // Font
  static const String defaultFont = FontFamily.inter;

  //
  // Localization
  // static const localizationsDelegates = AppLocalizations.localizationsDelegates;
  // static AppLocalizations currentAppLocalizations =
  //     AppLocalizations.of(globalContext);

  // Locale
  static const List<Locale> supportedLocales = [Locale('vi'), Locale('en')];
  static const Locale defaultLocale = Locale('vi');

  // Area Code - Vietnam
  static const String defaultRegionCodeString = 'VN';
  static const int defaultRegionCodeNumber = 84;
  static const String defaultPrefixRegionCode = '(+84)';

  // Default Main Bottom Tab
  static const int defaultMainTabIndex = 0;

  // Default Hotline in Login screen
  static const String defaultHotlineSupport = '0934045181';

  // Novaland Hotline in Notification
  static const String novalandHotlineSupport = '0909450425';

  // Aqua City Hotline
  static const String aquaHotlineSupport = '1900636666';

  // Api Timeout Duration
  static const int defaultApiTimeoutInSecond = 30;

  // Api Refresh Token Timeout Duration
  static const int defaultApiRefreshTokenTimeoutInSecond = 60;

  // Api Upload File Timeout Duration
  static const int defaultApiUploadFileTimeoutInSecond = 60;

  // Bottom Bar Badge icon
  static const bool showBadgeDot = true;

  // Auto resize screen
  static const bool autoResizeScreen = false;

  // Enable OTP Login
  static const bool enableOTPLogin = true;

  // Set style iOS for widgets
  static const bool widgetStyleIOS = true;

  // App Store NovaID Link
  static const appStoreNovaIDLink =
      'https://apps.apple.com/vn/app/nova-one/id1605584998';

  // App Store ASC Community Link
  static const appStoreASCCommunityLink =
      'https://appstoreconnect.apple.com/apps/1636279172';

  // App Store ASC Operation Link
  static const appStoreASCOperationLink =
      'https://appstoreconnect.apple.com/apps/1636317368';

  // NovaID Open Link
  static const novaIDOpenLink = 'https://applink.novaid.vn/open';

  // Use Map
  static const bool useGoogleMap = true;

  // Enable Tracking
  static const bool enableTracking = false;

  // static const String mapLink =
  //     'https://www.openstreetmap.org/?mlat=%s&mlon=%s';

  // comgooglemaps://?center=37.759748,-122.427135&q=Pizza
  // https://www.google.com/maps/search/?api=1&query=37.759748,-122.427135+(Pizza);
  static const String mapLink =
      'https://www.google.com/maps/search/?api=1&query=%s,%s+(%s)';

  // comgooglemaps://?center=37.759748,-122.427135&daddr=Pizza
  // https://www.google.com/maps/dir/?api=1&destination=37.759748,-122.427135
  static const String mapDirectionLink =
      'https://www.google.com/maps/dir/?api=1&destination=%s,%s';

  static const String facebookMessageToNovaID =
      'fb-messenger://user-thread/100163482572608';
  static const String facebookMessageToNovaIDLink =
      'https://m.me/100163482572608';

  // Point conversion rate - ex: 1000 vnd = 1 point
  static const pointConversionRate = 1000;

  // Privilege max bill
  static const privilegeMaxBill = 1000;

  // Default Map zoom
  static const double defaultMapZoom = 16;

  // Max image size picker
  static const double maxImageSizePicker = 960;

  static final MoneyFormatterSettings moneyFormatterSettings =
      MoneyFormatterSettings(
          symbol: ' VNĐ',
          thousandSeparator: ',',
          decimalSeparator: '.',
          symbolAndNumberSeparator: '',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short);

  static final MoneyFormatterSettings numberFormatterSettings =
      MoneyFormatterSettings(
          symbol: '',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: '',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short);
}
