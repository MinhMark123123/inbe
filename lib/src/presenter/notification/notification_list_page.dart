import 'package:flutter/material.dart';
import 'package:inabe_design/base_component/custom_appbar_widget.dart';

class NotificationListPage extends StatefulWidget {
  const NotificationListPage({Key? key}) : super(key: key);

  @override
  State<NotificationListPage> createState() => _NotificationListPageState();
}

class _NotificationListPageState extends State<NotificationListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomAppBarWidget(
            title: "List notification",
          )
        ],
      ),
    );
  }
}
