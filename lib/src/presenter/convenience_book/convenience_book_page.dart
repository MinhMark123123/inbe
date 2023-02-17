import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class ConvenienceBookPage extends StatefulWidget {
  const ConvenienceBookPage({Key? key}) : super(key: key);

  @override
  State<ConvenienceBookPage> createState() => _ConvenienceBookPageState();
}

class _ConvenienceBookPageState extends State<ConvenienceBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.convenience_book,
      ),
      body: Text(str.convenience_book),
    );
  }
}
