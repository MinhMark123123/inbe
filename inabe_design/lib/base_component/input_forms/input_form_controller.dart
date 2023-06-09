import 'package:aac_core/aac_core.dart';
import 'package:inabe_design/inabe_design.dart';

class InputFormController extends ChangeNotifier {
  String validation = '';
  bool required;
  final FocusNode focusNode = FocusNode();
  late TextEditingController textEditingController;

  InputFormController({String? text, this.required = false}) {
    textEditingController = TextEditingController();
    textEditingController.text = text ?? '';
  }

  requestFocus() {
    focusNode.requestFocus();
  }

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

  // bool validateEmail() {
  //   String email = text;
  //   return validate(
  //       conditions: [email.isEmpty, !isEmail(email)],
  //       validations: [str.field_required, str.invalid_email]);
  // }

  update({String? text, String? validation}) {
    textEditingController.text = text ?? textEditingController.text;
    this.validation = validation ?? this.validation;
    notifyListeners();
  }

  focusLast() {
    Future.delayed(const Duration(milliseconds: 50), () {
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    });
  }

  String get text => textEditingController.text.trim();
}
