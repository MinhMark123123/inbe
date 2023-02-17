import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe_design/inabe_design.dart';

class NotificationDetailPage extends StatefulWidget {
  final NotificationModel notificationModel;

  const NotificationDetailPage({
    Key? key,
    required this.notificationModel,
  }) : super(key: key);

  @override
  State<NotificationDetailPage> createState() => _NotificationDetailPageState();
}

class _NotificationDetailPageState extends State<NotificationDetailPage> {
  late NotificationModel notificationModel;

  @override
  void initState() {
    notificationModel = widget.notificationModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        title: "Detail",
        onBackPressed: () => {context.pop()},
      ),
      body: _buildInformation(),
    );
  }

  Widget _buildInformation() {
    return Column(
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
        )
      ],
    );
  }
}
