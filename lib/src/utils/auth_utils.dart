import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';

class AuthUtils {
  static updateToken(
      KeyDataSource keyDataSource, String token, String refreshToken,
      {VoidCallback? onComplete}) async {
    print('AuthUtils -------------- updateToken: $token');
    await keyDataSource.setToken(token);
    await keyDataSource.setRefreshToken(refreshToken);
    onComplete?.call();
  }

  static Future<dynamic> clearUserData(KeyDataSource keyDataSource) async {
    print('AuthUtils -------------- clearUserData');
    await keyDataSource.clearUserInfo();
    // await DBDataSource.clear();
    // await GraphQLConfig.reset();
    // await RestfulConfig.reset();
  }

  static Future<dynamic> logout(KeyDataSource keyDataSource,
      {bool hasExpired = false, VoidCallback? doSomething}) async {
    print('AuthUtils -------------- logout: hasExpired $hasExpired');
    doSomething?.call();
    // PopupUtils.hideLoadingDialog(Configs.globalContext);
    await clearUserData(keyDataSource);
    // if (AppEnvironment().isBuildModule) {
    //   await closeApp();
    // } else {
    //   await keyDataSource.setBool(PrefKeys.keySessionHasExpired, hasExpired);
    //   if (Configs.globalContext.currentRouteName != routeSplash) {
    //     await navigator.clearReplaceTo(routeSplash);
    //   }
    // }
  }

  static Future<bool> isLoggedIn(KeyDataSource keyDataSource) async {
    String token = await keyDataSource.getToken();
    print('token ------------- $token');
    return token.isNotEmpty;
  }
//
// static startAppFromDynamicLink(String referralCode) async {
//   bool isLoggedIn = await AuthUtils.isLoggedIn();
//
//   /// Navigate to Register
//   if (!isLoggedIn) {
//     navigator.navigateTo(routeAuthRegister, arguments: referralCode);
//   }
// }
//
// static Future<dynamic> closeApp() async {
//   print('AuthUtils -------------- closeApp');
//   if (AppEnvironment().isBuildModule) {
//     await keyDataSource.clear();
//     await DBDataSource.clear();
//     navigator.closeApp();
//   }
// }
}
