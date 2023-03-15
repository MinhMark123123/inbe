import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/utils/date_time_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class EmailItemWidget extends StatelessWidget {
  final EmailModel emailModel;

  const EmailItemWidget({Key? key, required this.emailModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: Dimens.size10, bottom: Dimens.materialSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateTimeUtils.convert(
              emailModel.publishedAt,
              DateTimeUtils.emailDateFormat,
              DateTimeUtils.formatJP,
            ),
            style: textStyle.medium.w500.fill(ColorName.boulder),
          ),
          const SizedBox(height: 3),
          SizedBox(
            width: double.infinity,
            child: Text(
              emailModel.title ?? '',
              style: textStyle.medium.w700.fill(ColorName.carbonGrey),
            ),
          ),
        ],
      ),
    );
  }
}
