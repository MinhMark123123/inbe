import 'package:flutter/material.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/base_component/custom_appbar_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.menu,
      ),
    );
  }
}
