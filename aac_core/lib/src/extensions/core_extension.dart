import 'package:aac_core/src/utils/text_utils.dart';

extension StringX on String? {
  bool equalsIgnoreCase(String? s) {
    return this?.trim().toLowerCase() == s?.trim().toLowerCase();
  }

  bool equals(String? s) {
    return this?.trim() == s?.trim();
  }

  String formatWith(List<dynamic> values) {
    return TextUtils.format(this, values);
  }

  bool get isEmpty => this?.isEmpty ?? true;

  bool get isNotEmpty => this?.isNotEmpty ?? false;
}

extension ListX on List? {
  bool get isEmpty => this?.isEmpty ?? true;

  bool get isNotEmpty => this?.isNotEmpty ?? false;
}

extension DateTimeX on DateTime {
  bool get isToday => isSameDay(DateTime.now());

  bool isSameDay(DateTime dateTime) {
    return year == dateTime.year &&
        month == dateTime.month &&
        day == dateTime.day;
  }
}
