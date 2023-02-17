import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/base_component/custom_appbar_widget.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({Key? key}) : super(key: key);

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: str.menu,
      ),
      body: Container(
        child: Text("AAA"),
      ),
    );
  }
}
