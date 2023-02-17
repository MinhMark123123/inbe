import 'package:flutter/material.dart';
import 'package:inabe/gen_l10n/app_localizations.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/base_component/custom_appbar_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late AppLocalizations str;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    str = AppLocalizations.of(context);

    return Scaffold(
      appBar: CustomAppBarWidget(
        title: "str.",
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
