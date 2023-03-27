import 'package:aac_core/aac_core.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static const String utcFormat = "yyyy-MM-dd HH:mm:ss.SSSZ";

  static const String gmtFormat = "EEE MMM dd yyyy HH:mm:ss";

  static const String simpleDateFormat = "dd/MM/yyyy";

  static const String ddMMMMYYYYFormat = "dd MMMM, yyyy";

  static const String eeeDDMMMFormat = "EEEE, dd MMMM";

  static const String apiDateFormat = "yyyy-MM-dd";

  static const String format_1 = "HH:mm, dd-MM-yyyy";

  static const String format_2 = "HH:mm, dd/MM/yyyy";

  static const String emailDateFormat = "yyyy/MM/dd HH:mm";

  static const String eventDateFormat = "yyyy/MM/dd";

  static const String formatJP = "yyyy年M月d日";


  static int get currentMilliseconds => DateTime.now().millisecondsSinceEpoch;

  static DateTime? parse(String? dateTime, {String? format = utcFormat}) {
    try {
      if (dateTime != null) {
        DateTime dt = DateFormat(format).parseUTC(dateTime);
        if (format == utcFormat) {
          return dt.toLocal();
        }
        return dt;
      }
    } catch (e) {}
    return null;
  }

  static int convertToMilliseconds(String? dateTime) {
    try {
      if (dateTime != null) {
        DateTime? dt = DateTime.tryParse(dateTime ?? '')?.toLocal();
        return dt?.millisecondsSinceEpoch ?? 0;
      }
    } catch (e) {
      print("ttt ---> convertToLong Exception: $e");
    }
    return 0;
  }

  static DateTime? parseUTC(String? dateTime) =>
      parse(dateTime, format: utcFormat);

  static DateTime? parseGMT(String? dateTime) =>
      parse(dateTime, format: gmtFormat);

  static Duration difference(DateTime? other, {DateTime? root}) => other == null
      ? Duration.zero
      : (other.difference(root ?? DateTime.now())).abs();

  static int differenceTimeInMillis(DateTime? other) =>
      difference(other).inMilliseconds;

  static int differenceTimeInSeconds(DateTime? other) =>
      difference(other).inSeconds;

  static String format(DateTime? dateTime, String format,
      {String? localeTag, bool isReturnDashChar = false}) {
    if (localeTag != null) {
      return dateTime == null
          ? ''
          : DateFormat(format, localeTag).format(dateTime);
    }
    return dateTime == null
        ? isReturnDashChar
            ? '-'
            : ''
        : DateFormat(format).format(dateTime);
  }

  static String formatByLocale(DateTime? dateTime, String format) => dateTime ==
          null
      ? ''
      : DateFormat(format, Configs.defaultLocale.languageCode).format(dateTime);

  static String convert(String? dateTime, String fromFormat, String toFormat,
      {String? localeTag}) {
    DateTime? dt = DateTime.tryParse(dateTime ?? '')?.toLocal() ??
        parse(dateTime, format: fromFormat);
    return format(dt, toFormat, localeTag: localeTag);
  }
}
