import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe_design/inabe_design.dart';

class EmailDetailPage extends StatelessWidget {
  final EmailModel emailModel;

  const EmailDetailPage({Key? key, required this.emailModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        onBackPressed: () => {context.pop()},
      ),
      body: _buildInformation(),
    );
  }

  Widget _buildInformation() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.size20, horizontal: Dimens.size10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              emailModel.title ?? "AAA",
              style: textStyle.medium.w700.fill(ColorName.boulder),
            ),
            const SizedBox(
              height: Dimens.mediumPadding,
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  emailModel.publishedAt ?? "Date",
                  style: textStyle.medium.w500.fill(ColorName.boulder),
                ),
              ],
            ),
            const SizedBox(
              height: Dimens.size10,
            ),
            const Divider(
              height: 1,
              color: ColorName.dividerGray,
            ),
            const SizedBox(
              height: Dimens.size20,
            ),
            Text(
              emailModel.content ?? "Content",
              style: textStyle.medium.w400.fill(ColorName.carbonGrey),
            )
          ],
        ),
      ),
    );
  }
}
