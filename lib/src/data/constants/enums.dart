import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';

enum ButtonStateType {
  EMAIL,
  PASSWORD,
  OTP,
  NICKNAME,
}

extension ButtonStateTypeX on ButtonStateType {
  String validate(TextEditingController controller) {
    switch (this) {
      case ButtonStateType.EMAIL:
        return controller.validateEmail();
      case ButtonStateType.PASSWORD:
        return controller.validatePassword();
      case ButtonStateType.OTP:
        return controller.validateOTP();
      case ButtonStateType.NICKNAME:
        return controller.validateNickname();
      default:
        return controller.validateEmail();
    }
  }
}
