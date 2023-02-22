import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/model/other_app_model.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class RelatedItemWidget extends StatelessWidget {
  final OtherAppModel otherAppModel;

  const RelatedItemWidget({Key? key, required this.otherAppModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.size10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageViewWidget(
                otherAppModel.icon ?? '',
                width: Dimens.size60,
                height: Dimens.size60,
                fit: BoxFit.cover,
                placeHolder: Assets.images.icLive.image(fit: BoxFit.cover),
                errorHolder: Assets.images.icLive.image(fit: BoxFit.cover),
              ).round(Dimens.smallRadius),
              const SizedBox(width: Dimens.normalPadding),
              Text(
                otherAppModel.name ?? '',
                style: textStyle.large.w700.fill(ColorName.carbonGrey),
              ),
            ],
          ),
          const SizedBox(height: Dimens.size10),
          Text(
            otherAppModel.content ?? '',
            style: textStyle.medium.w400.fill(ColorName.carbonGrey),
          ),
          const SizedBox(height: Dimens.normalPadding),
          buildLinkMobile(otherAppModel),
        ],
      ),
    );
  }

  Widget buildLinkMobile(OtherAppModel otherAppModel) {
    return Row(
      children: [
        Assets.images.imgButtonGooglePlay.image(height: 44).onPressed(() {
          UriUtils.launchActionOutside(data: otherAppModel.androidApp);
        }),
        const SizedBox(width: Dimens.size10),
        Assets.images.imgButtonAppStore.image(height: 44).onPressed(() {
          UriUtils.launchActionOutside(data: otherAppModel.iosApp);
        }),
      ],
    );
  }
}
