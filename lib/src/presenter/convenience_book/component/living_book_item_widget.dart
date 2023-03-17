import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/model/living_guide_model.dart';
import 'package:inabe/src/utils/extensions/context_extesion.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/base_component/image_view_widget.dart';
import 'package:inabe_design/dimens.dart';

class LivingBookItemWidget extends StatelessWidget {
  final LivingGuideModel livingGuideModel;

  const LivingBookItemWidget({
    Key? key,
    required this.livingGuideModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.greenB7,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.normalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ImageViewWidget(
              livingGuideModel.icon ?? '',
              height: context.screenWidth * 60 / 375,
              fit: BoxFit.fitHeight,
              errorHolder: Assets.images.icLive.image(width: 80),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: Dimens.mediumPadding, bottom: Dimens.size6),
              child: Text(
                livingGuideModel.name ?? '',
                style: textStyle.small.w600.fill(ColorName.carbonGrey),
              ),
            )
          ],
        ).decor(
          background: Colors.white,
          boxDecoration: boxDecoration.round(Dimens.size10),
        ),
      ),
    ).onPressedInkWell(() {
      UriUtils.launchActionOutside(data: livingGuideModel.url ?? '');
    });
  }
}
