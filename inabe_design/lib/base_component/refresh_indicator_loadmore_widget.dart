import 'package:aac_core/aac_core.dart';

class RefreshIndicatorLoadMoreWidget extends StatelessWidget {
  const RefreshIndicatorLoadMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
        backgroundColor: ColorName.primaryGreen, minHeight: 5);
  }
}
