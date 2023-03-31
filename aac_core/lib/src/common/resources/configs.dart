import 'package:aac_core/aac_core.dart';
import 'package:money_formatter/money_formatter.dart';

class Configs {
  // Global Navigator Key
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Global BuildContext
  static final BuildContext globalContext = navigatorKey.currentContext!;

  // Font
  static const String defaultFont = FontFamily.inter;

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

  // Use Map
  static const bool useGoogleMap = true;

  // Enable Tracking
  static const bool enableTracking = false;

  static const String mapLink =
      'https://www.google.com/maps/search/?api=1&query=%s,%s+(%s)';

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
