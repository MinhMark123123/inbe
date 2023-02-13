import 'package:aac_core/aac_core.dart';
import 'package:flutter/material.dart';
import 'package:inabe_design/inabe_design.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _buildHomeBody(),

    );
  }

  PreferredSize _appBar() => PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: CustomAppBarWidget(
      title: "Top page",
      titleColor: ColorName.carbonGrey,
      elevation: 2,
      backgroundColor: Colors.white,
    ),
  );

  Widget _buildHomeBody() {
    return Container(
      color: Colors.white,
      child: const Text("Top page"),
    );
  }
}
