import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class MagazineLinkPage extends StatefulWidget {
  const MagazineLinkPage({Key? key}) : super(key: key);

  @override
  State<MagazineLinkPage> createState() => _MagazineLinkPageState();
}

class _MagazineLinkPageState extends State<MagazineLinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.magazine_link,
      ),
      body: Text(str.magazine_link),
    );
  }
}
