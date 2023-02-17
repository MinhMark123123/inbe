import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class RelatedAppPage extends StatefulWidget {
  const RelatedAppPage({Key? key}) : super(key: key);

  @override
  State<RelatedAppPage> createState() => _RelatedAppPageState();
}

class _RelatedAppPageState extends State<RelatedAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.related_apps,
      ),
      body: Text(str.related_apps),
    );
  }
}
