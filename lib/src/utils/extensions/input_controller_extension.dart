import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';

const passwordRegexValidation =
    // r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    r'^(?=.*?[A-Za-z])(?=.*?[0-9])[A-Za-z0-9]{8,}$';

extension TextEditingControllerX on TextEditingController {
  String get text => this.text.trim();

  // bool validate({List<bool>? conditions, List<String>? validations}) {
  //   if (conditions == null ||
  //       conditions.isEmpty ||
  //       validations == null ||
  //       validations.isEmpty) {
  //     if (required && text.isEmpty) {
  //       validation = str.field_required;
  //       notifyListeners();
  //       return false;
  //     } else {
  //       return true;
  //     }
  //   }
  //   bool passed = false;
  //   for (int index = 0; index < conditions.length; index++) {
  //     if (conditions[index]) {
  //       validation = validations[index];
  //       notifyListeners();
  //       break;
  //     } else if (index == conditions.length - 1) {
  //       validation = '';
  //       notifyListeners();
  //       passed = true;
  //     }
  //   }
  //   return passed;
  // }
  //
  // Future<String?> validatePhone() async {
  //   String phone = text;
  //   String? formattedPhone = await PhoneUtils.formatPhoneNumber(phone);
  //   bool valid = validate(
  //       conditions: [TextUtils.isEmpty(phone), formattedPhone == null],
  //       validations: [str.please_input_phone, str.invalid_phone]);
  //   if (valid) {
  //     return formattedPhone;
  //   }
  //   return null;
  // }
  //
  // bool validatePassword() {
  //   String password = text;
  //   return validate(conditions: [
  //     password.isEmpty,
  //     !TextUtils.verifyPasswordValid(password)
  //   ], validations: [
  //     str.password_required,
  //     str.invalid_password
  //   ]);
  // }
  String validateConfirmPassword(String password) {
    String confirm = text;
    if (confirm != password) return str.not_match_password;
    return '';
  }

  /// check if string [str] matches the [pattern].
  bool matches(String str, pattern) {
    RegExp re = RegExp(pattern);
    return re.hasMatch(str);
  }

  String validatePassword() {
    String password = text;
    print("ttt pw $password");
    if (password.isEmpty) return str.field_required;
    if (!matches(password, passwordRegexValidation)) return str.invalid_password;
    return '';
  }

  String validateEmail() {
    String email = text;
    if (email.isEmpty) return str.field_required;
    if (!isEmail(email)) return str.invalid_email;
    return '';

    // return validate(
    //     conditions: [email.isEmpty, !isEmail(email)],
    //     validations: [str.field_required, str.invalid_email]);
  }

  // update({String? text, String? validation}) {
  //   textEditingController.text = text ?? textEditingController.text;
  //   this.validation = validation ?? this.validation;
  //   notifyListeners();
  // }
}