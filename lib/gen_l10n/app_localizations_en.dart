import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get event_information => 'イベント情報';

  @override
  String get convenience_book => 'くらしの便利帳';

  @override
  String get magazine_link => '広報誌Link';

  @override
  String get electronic_app => '電子申請';

  @override
  String get electronic_library => '電子図書館';

  @override
  String get related_apps => '関連アプリ';

  @override
  String get change_password_desc => 'パスワードの再設定をします。\n新しいパスワードを入力し、「パスワード再設定」ボタンを押してください。';

  @override
  String get current_password_desc => 'パスワードは半角英数字8文字以上で設定してください';

  @override
  String get forgot_password => 'パスワードをお忘れの方';

  @override
  String get forgot_password_desc => 'ご登録いただいているメールアドレスをご入力いただき、「送信」ボタンを押してください。\nパスワード再設定ページへのURLをメールにて送付します。';

  @override
  String get forgot_password_success => 'パスワード再発行メール送信完了';

  @override
  String get forgot_password_success_desc => 'ご登録いただいているメールアドレスへ\nパスワード再設定ページへのURLを送信しました。';

  @override
  String get forgot_password_success_process => '登録の手続きはまだ完了していません。\n再設定メールに記載のURLから手続きを行ってください。\n※URLの有効期限は配信後30分です。';

  @override
  String get resend_forget_mail => 'メールが届かない場合';

  @override
  String get forget_check_mail => 'メールが届かない場合は、下記をご確認ください';

  @override
  String get resend_forget_mail_process_content => '1.迷惑メールや別のフォルダに振り分けられていないかをご確認ください\nHotmailやGmailの場合、ほかのフォルダ特にGmailでは、「すべてのメール」フォルダの確認をお願いします。\n\n2.利用機器（スマートフォン等）の設定をご確認ください\n3.ご利用の機器、プロバイダー等のご契約内容をご確認ください\n4.@xxxxxxx.jpドメインからのメールが受け取れる状態であるかをご確認ください\n5.受信ボックス容量が一杯になっていないかをご確認ください\n6.入力されたメールアドレスが誤っていないかをご確認ください\nよくある入力間違い\n・～ne.jp → ～co.jp\n・ドット「. 」→カンマ「, 」\n・前後や途中に余分なスペースが入っている等';

  @override
  String get send => '送信';

  @override
  String get register_label => '新規登録';

  @override
  String get register => '登録';

  @override
  String get field_required => 'Required field';

  @override
  String get invalid_email => 'Invalid email';

  @override
  String get invalid_password => 'Invalid password';

  @override
  String get not_match_password => 'Not match password';

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

  @override
  String get notification => 'お知らせ';

  @override
  String get latest_news => '新着のお知らせ';

  @override
  String get see_more => 'もっと見る';

  @override
  String get turn_on_notification => 'お知らせ通知をオンにする';

  @override
  String get turn_off_notification => 'お知らせ通知をオフにする';

  @override
  String get home_tab => 'ホーム';

  @override
  String get email_tab => 'いなべ市生活情報\n（まいめる）';

  @override
  String get medicine_tab => '医療救急情報';

  @override
  String get menu_tab => 'メニュー';

  @override
  String get menu => 'メニュー';

  @override
  String get setting => '設定';

  @override
  String get privacy_policy => 'プライバシーポリシー';

  @override
  String get logout => 'ログアウト';

  @override
  String get help => 'ヘルプ';
}
