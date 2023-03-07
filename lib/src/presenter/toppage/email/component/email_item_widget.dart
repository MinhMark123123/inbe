import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe_design/inabe_design.dart';

class EmailItemWidget extends StatelessWidget {
  final EmailModel emailModel;

  const EmailItemWidget({Key? key, required this.emailModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                emailModel.publishedAt ?? '',
                style: textStyle.medium.w500.fill(ColorName.boulder),
              ),
              const SizedBox(width: Dimens.size10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.size4, vertical: 2),
                child: Text(
                  emailModel.categoryName ?? '',
                  style: textStyle.small.w500.fill(Colors.white),
                ),
              ).decor(background: Colors.red),
            ],
          ),
          const SizedBox(height: Dimens.size4),
          Text(
            emailModel.title ?? '',
            style: textStyle.medium.w700.fill(ColorName.carbonGrey),
          ),
        ],
      ),
    );
  }
}
