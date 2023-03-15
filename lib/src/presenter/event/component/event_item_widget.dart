import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/model/event_model.dart';
import 'package:inabe/src/utils/date_time_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class EventItemWidget extends StatelessWidget {
  final EventModel eventModel;

  const EventItemWidget({Key? key, required this.eventModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            DateTimeUtils.convert(
              eventModel.date,
              DateTimeUtils.eventDateFormat,
              DateTimeUtils.formatJP,
            ),
            style: textStyle.medium.w500.fill(ColorName.boulder),
          ),
          const SizedBox(height: Dimens.size4),
          Text(
            eventModel.title ?? '',
            style: textStyle.medium.w700.fill(ColorName.carbonGrey),
          ),
        ],
      ),
    );
  }
}
