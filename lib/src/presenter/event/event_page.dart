import 'package:flutter/material.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/base_component/custom_appbar_widget.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.event_information,
      ),
      body: Text(
          str.event_information
      ),
    );
  }
}
