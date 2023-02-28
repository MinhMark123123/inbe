import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/presenter/widget/top_body_widget.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        backgroundColor: ColorName.main,
        onBackPressed: () => {context.pop()},
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.size10),
        child: Column(
          children: [
            TopBodyWidget(title: str.privacy_policy),
            Text(
              str.privacy_policy,
              style: textStyle.medium.w400.fill(ColorName.carbonGrey),
            ),
          ],
        ),
      ),
    );
  }
}
