import 'package:aac_core/aac_core.dart';

class AppConfigs {
  static appInit(BuildContext context) {
    /// System UI
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
