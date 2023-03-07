class RouterConstants{
  RouterConstants._();

  static const root = "/";
  static const splash = "/";
  static const top = "top";
  static const home = "home";
  static const email = "email";
  static const medicine = "medicine";
  static const policy = "policy";
  static const login = "login";
  static const register = "register";
  static const forgotPw = "forgotPw";
  static const forgotPwSuccess = "forgotPwSuccess";
  static const forgotPwOTP = "forgotPwOTP";
  static const resetPw = "resetPw";
  static const menu = "menu";
  static const setting = "setting";
  static const faq = "faq";
  static const second = "second";
  static const emailDetail = "emailDetail";
  static const notificationDetail = "notificationDetail";
  static const notificationList = "notificationList";

  static const event = "event";
  static const eventDetail = "eventDetail";
  static const book = "book";
  static const magazine = "magazine";
  static const electronic_app = "electronic_app";
  static const electronic_lib = "electronic_lib";
  static const related_apps = "related_apps";

  static const accountOtp = "accountOtp";
  static const updateAccount = "updateAccount";
  static const webpage = "webpage";
  static String  webpageChild(String prePath) => "/${prePath}/$webpage";
}
