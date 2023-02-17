import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.email,
      ),
      body: Text(str.email),
    );
  }
}
