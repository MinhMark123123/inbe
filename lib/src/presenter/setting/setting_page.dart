import 'package:go_router/go_router.dart';
import 'package:inabe/src/presenter/setting/component/setting_form_widget.dart';
import 'package:inabe/src/presenter/setting/component/setting_interest_widget.dart';
import 'package:inabe/src/presenter/setting/component/setting_notification_widget.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        onBackPressed: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.size10),
          child: Column(
            children: [
              TopBodyWidget(title: str.setting),
              const SettingFormWidget(),
              const SettingInterestWidget(),
              const SettingNotificationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
