import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:aac_core/aac_core.dart';
import 'package:sprintf/sprintf.dart';

class TextUtils {
  // Password Regex
  static const passwordRegexValidation =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  // Phone Number Regex
  static const phoneRegexValidation = r'^(?<=\d\d)\d(?=\d{2})/g';

  static bool isEmpty(String? text) {
    return text?.isEmpty ?? true;
  }

  static bool isNotEmpty(String? text) {
    return text?.isNotEmpty ?? false;
  }

  static bool isValidURL(String? url) {
    return Uri.parse(url ?? '').isAbsolute;
  }

  static String removeHtml(String? html) {
    return Bidi.stripHtmlIfNeeded(html ?? '').trim();
  }

  static String removeBreakLine(String? text) {
    return text?.replaceAll(RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), ' ') ?? '';
  }

  static String format(String? source, List<dynamic> values) {
    return sprintf(source ?? '', values).trim();
  }

  static bool verifyPasswordValid(String? password) {
    RegExp regex = RegExp(passwordRegexValidation);
    if (password != null && regex.hasMatch(password)) {
      return true;
    }
    return false;
  }

  static bool verifyPhoneNumber(String? phone) {
    RegExp regex = RegExp(phoneRegexValidation);
    if (phone != null && regex.hasMatch(phone)) {
      return true;
    }
    return false;
  }

  static String? mapToJson(Map<String, dynamic>? map) {
    try {
      return const JsonEncoder().convert(map);
    } catch (e) {
      return null;
    }
  }

  static Map<String, dynamic> jsonToMap(String? source) {
    try {
      return Map<String, dynamic>.from(jsonDecode(source ?? "{}"));
    } catch (e) {
      return {};
    }
  }

  static String htmlFormatContent(String? content) => r'''<html>
      <head><meta name="viewport" content="width=device-width, initial-scale=1.0">
      <style>
      body {
        font-family: roboto;
        font-size: 16;
      }
      </style>
      </head>
      <body>
      %s
      </body>
      </html>'''
      .formatWith([content]);
}
