import 'package:aac_core/aac_core.dart';
import 'package:phone_number/phone_number.dart';

class PhoneUtils {
  static Future<String?> formatPhoneNumber(String? phone) async {
    if (TextUtils.isEmpty(phone)) {
      return null;
    } else {
      RegionInfo region = const RegionInfo(
          name: Configs.defaultRegionCodeString,
          code: Configs.defaultRegionCodeString,
          prefix: Configs.defaultRegionCodeNumber);
      try {
        PhoneNumber phoneNumber =
            await PhoneNumberUtil().parse(phone!, regionCode: region.code);
        return phoneNumber.e164;
      } catch (error) {
        return null;
      }
    }
  }

  static Future<PhoneNumber?> parsePhone(String? phoneWithRegion) async {
    if (phoneWithRegion == null) {
      return null;
    }
    PhoneNumber phoneNumber = await PhoneNumberUtil().parse(phoneWithRegion);
    return phoneNumber;
  }

  static String hidePhone(String phone) {
    try {
      int start = phone.length ~/ 3;
      int end = phone.length * 2 ~/ 3;
      return phone.replaceRange(
          start + 1, end + 1, List.filled(end - start, '*').join());
    } catch (e) {
      return phone;
    }
  }
}
