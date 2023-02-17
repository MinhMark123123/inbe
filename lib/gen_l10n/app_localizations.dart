import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'ログイン'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'メールアドレス'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'パスワード'**
  String get password;

  /// No description provided for @press_to_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'パスワードをお忘れの方はこちら'**
  String get press_to_forgot_password;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'パスワード再設定'**
  String get change_password;

  /// No description provided for @event_information.
  ///
  /// In en, this message translates to:
  /// **'イベント情報'**
  String get event_information;

  /// No description provided for @convenience_book.
  ///
  /// In en, this message translates to:
  /// **'くらしの便利帳'**
  String get convenience_book;

  /// No description provided for @magazine_link.
  ///
  /// In en, this message translates to:
  /// **'広報誌Link'**
  String get magazine_link;

  /// No description provided for @electronic_app.
  ///
  /// In en, this message translates to:
  /// **'電子申請'**
  String get electronic_app;

  /// No description provided for @electronic_library.
  ///
  /// In en, this message translates to:
  /// **'電子図書館'**
  String get electronic_library;

  /// No description provided for @related_apps.
  ///
  /// In en, this message translates to:
  /// **'関連アプリ'**
  String get related_apps;

  /// No description provided for @change_password_desc.
  ///
  /// In en, this message translates to:
  /// **'パスワードの再設定をします。\n新しいパスワードを入力し、「パスワード再設定」ボタンを押してください。'**
  String get change_password_desc;

  /// No description provided for @current_password_desc.
  ///
  /// In en, this message translates to:
  /// **'パスワードは半角英数字8文字以上で設定してください'**
  String get current_password_desc;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'パスワードをお忘れの方'**
  String get forgot_password;

  /// No description provided for @forgot_password_desc.
  ///
  /// In en, this message translates to:
  /// **'ご登録いただいているメールアドレスをご入力いただき、「送信」ボタンを押してください。\nパスワード再設定ページへのURLをメールにて送付します。'**
  String get forgot_password_desc;

  /// No description provided for @forgot_password_success.
  ///
  /// In en, this message translates to:
  /// **'パスワード再発行メール送信完了'**
  String get forgot_password_success;

  /// No description provided for @forgot_password_success_desc.
  ///
  /// In en, this message translates to:
  /// **'ご登録いただいているメールアドレスへ\nパスワード再設定ページへのURLを送信しました。'**
  String get forgot_password_success_desc;

  /// No description provided for @forgot_password_success_process.
  ///
  /// In en, this message translates to:
  /// **'登録の手続きはまだ完了していません。\n再設定メールに記載のURLから手続きを行ってください。\n※URLの有効期限は配信後30分です。'**
  String get forgot_password_success_process;

  /// No description provided for @resend_forget_mail.
  ///
  /// In en, this message translates to:
  /// **'メールが届かない場合'**
  String get resend_forget_mail;

  /// No description provided for @forget_check_mail.
  ///
  /// In en, this message translates to:
  /// **'メールが届かない場合は、下記をご確認ください'**
  String get forget_check_mail;

  /// No description provided for @resend_forget_mail_process_content.
  ///
  /// In en, this message translates to:
  /// **'1.迷惑メールや別のフォルダに振り分けられていないかをご確認ください\nHotmailやGmailの場合、ほかのフォルダ特にGmailでは、「すべてのメール」フォルダの確認をお願いします。\n\n2.利用機器（スマートフォン等）の設定をご確認ください\n3.ご利用の機器、プロバイダー等のご契約内容をご確認ください\n4.@xxxxxxx.jpドメインからのメールが受け取れる状態であるかをご確認ください\n5.受信ボックス容量が一杯になっていないかをご確認ください\n6.入力されたメールアドレスが誤っていないかをご確認ください\nよくある入力間違い\n・～ne.jp → ～co.jp\n・ドット「. 」→カンマ「, 」\n・前後や途中に余分なスペースが入っている等'**
  String get resend_forget_mail_process_content;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'送信'**
  String get send;

  /// No description provided for @register_label.
  ///
  /// In en, this message translates to:
  /// **'新規登録'**
  String get register_label;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'登録'**
  String get register;

  /// No description provided for @field_required.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get field_required;

  /// No description provided for @invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalid_email;

  /// No description provided for @invalid_password.
  ///
  /// In en, this message translates to:
  /// **'Invalid password'**
  String get invalid_password;

  /// No description provided for @not_match_password.
  ///
  /// In en, this message translates to:
  /// **'Not match password'**
  String get not_match_password;

  /// No description provided for @nickname.
  ///
  /// In en, this message translates to:
  /// **'ニックネーム'**
  String get nickname;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'パスワード（確認用）'**
  String get confirm_password;

  /// No description provided for @choose_category.
  ///
  /// In en, this message translates to:
  /// **'お知らせ希望するカテゴリー'**
  String get choose_category;

  /// No description provided for @choose_category_desc.
  ///
  /// In en, this message translates to:
  /// **'選択したカテゴリーの情報をお届けします'**
  String get choose_category_desc;

  /// No description provided for @choose_category_desc_more.
  ///
  /// In en, this message translates to:
  /// **'メールでのお知らせをご希望の場合は、事前にこちらよりメール設定のご確認をお願いいたします。'**
  String get choose_category_desc_more;

  /// No description provided for @push_notification.
  ///
  /// In en, this message translates to:
  /// **'お知らせ通知（プッシュ通知）'**
  String get push_notification;

  /// No description provided for @push_notification_desc.
  ///
  /// In en, this message translates to:
  /// **'お知らせ通知をオンにすると、アプリを開かなくてもお知らせ通知を受け取ることができます'**
  String get push_notification_desc;

  /// No description provided for @confirm_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'新規登録をすることにより、「プライバシーポリシー」に同意したとみなされます。'**
  String get confirm_privacy_policy;

  /// No description provided for @press_to_register.
  ///
  /// In en, this message translates to:
  /// **'新規登録はこちら'**
  String get press_to_register;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'お知らせ'**
  String get notification;

  /// No description provided for @latest_news.
  ///
  /// In en, this message translates to:
  /// **'新着のお知らせ'**
  String get latest_news;

  /// No description provided for @see_more.
  ///
  /// In en, this message translates to:
  /// **'もっと見る'**
  String get see_more;

  /// No description provided for @turn_on_notification.
  ///
  /// In en, this message translates to:
  /// **'お知らせ通知をオンにする'**
  String get turn_on_notification;

  /// No description provided for @turn_off_notification.
  ///
  /// In en, this message translates to:
  /// **'お知らせ通知をオフにする'**
  String get turn_off_notification;

  /// No description provided for @home_tab.
  ///
  /// In en, this message translates to:
  /// **'ホーム'**
  String get home_tab;

  /// No description provided for @email_tab.
  ///
  /// In en, this message translates to:
  /// **'いなべ市生活情報\n（まいめる）'**
  String get email_tab;

  /// No description provided for @medicine_tab.
  ///
  /// In en, this message translates to:
  /// **'医療救急情報'**
  String get medicine_tab;

  /// No description provided for @menu_tab.
  ///
  /// In en, this message translates to:
  /// **'メニュー'**
  String get menu_tab;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'メニュー'**
  String get menu;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'設定'**
  String get setting;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'プライバシーポリシー'**
  String get privacy_policy;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'ログアウト'**
  String get logout;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'ヘルプ'**
  String get help;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
