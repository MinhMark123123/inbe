import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe_design/dimens.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notificationModel;
  final Function(NotificationModel propertyModel, int index)? onItemClick;

  const NotificationItem({
    Key? key,
    required this.notificationModel,
    this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notificationModel.date ?? "14-01",
            style: textStyle.xSmall.w500.fill(ColorName.boulder),
          ),
          const SizedBox(
            height: Dimens.size4,
          ),
          Text(
            notificationModel.title ?? "title",
            style: textStyle.medium.w700.fill(ColorName.carbonGrey),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ).onPressedInkWell(() {
        if (onItemClick != null) {
          onItemClick!(notificationModel, 0);
        }
      }),
    );
  }
}
