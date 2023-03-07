import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe_design/inabe_design.dart';

class NewsItemWidget extends StatelessWidget {
  final NotificationModel notificationModel;

  const NewsItemWidget({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            notificationModel.date ?? '',
            style: textStyle.medium.w500.fill(ColorName.boulder),
          ),
          const SizedBox(height: Dimens.size4),
          Text(
            notificationModel.title ?? '',
            style: textStyle.medium.w700.fill(ColorName.carbonGrey),
          ),
        ],
      ),
    );
  }
}
