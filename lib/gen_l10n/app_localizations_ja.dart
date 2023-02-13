import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get login => 'ログイン';

  @override
  String get email => 'メールアドレス';

  @override
  String get password => 'パスワード';

  @override
  String get press_to_forgot_password => 'パスワードをお忘れの方はこちら';

  @override
  String get change_password => 'パスワード再設定';

  @override
  String get change_password_desc => 'パスワードの再設定をします。\n新しいパスワードを入力し、「パスワード再設定」ボタンを押してください。';

  @override
  String get current_password_desc => 'パスワードは半角英数字8文字以上で設定してください';

  @override
  String get forgot_password => 'パスワードをお忘れの方';

  @override
  String get forgot_password_desc => 'ご登録いただいているメールアドレスをご入力いただき、「送信」ボタンを押してください。\nパスワード再設定ページへのURLをメールにて送付します。';

  @override
  String get send => '送信';

  @override
  String get register_label => '新規登録';

  @override
  String get register => '登録';

  @override
  String get nickname => 'ニックネーム';

  @override
  String get confirm_password => 'パスワード（確認用）';

  @override
  String get choose_category => 'お知らせ希望するカテゴリー';

  @override
  String get choose_category_desc => '選択したカテゴリーの情報をお届けします';

  @override
  String get choose_category_desc_more => 'メールでのお知らせをご希望の場合は、事前にこちらよりメール設定のご確認をお願いいたします。';

  @override
  String get push_notification => 'お知らせ通知（プッシュ通知）';

  @override
  String get push_notification_desc => 'お知らせ通知をオンにすると、アプリを開かなくてもお知らせ通知を受け取ることができます';

  @override
  String get confirm_privacy_policy => '新規登録をすることにより、「プライバシーポリシー」に同意したとみなされます。';

  @override
  String get press_to_register => '新規登録はこちら';
}
