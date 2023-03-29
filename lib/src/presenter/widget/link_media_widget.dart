import 'package:aac_core/aac_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/navigation/app_routers.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe_design/inabe_design.dart';

class LinkMediaWidget extends StatelessWidget {
  const LinkMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBottomRow(context);
  }

  Widget _buildBottomRow(BuildContext context) {
    return SizedBox(
      height: Dimens.size46,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeExtension(10).w),
            child: Assets.images.icLogoSmall.image(width: 100, height: 34),
          ).onPressedInkWell(() =>
              launchWebPage(context, RouterConstants.home, DomainConst.URL)),
          const Spacer(),
          ..._buildListAction(context),
        ],
      ),
    );
  }

  List<Widget> _buildListAction(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
        child: Assets.images.icLive.image(width: 30).onPressed(() => {
              launchWebPage(
                  context, RouterConstants.home, DomainConst.topLiveUrl)
              // UriUtils.launchActionOutside(data: DomainConst.topLiveUrl),
            }),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
        child: Assets.images.icInstagram.image(width: 30).onPressed(() => {
              launchWebPage(
                  context, RouterConstants.home, DomainConst.topInstagramUrl)
            }),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeExtension(10).w),
        child: Assets.images.icYoutube.image(width: 30).onPressed(() => {
              launchWebPage(
                  context, RouterConstants.home, DomainConst.topYoutubeUrl)
            }),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeExtension(10).w),
        child: Assets.images.icTwitter.image(width: 30).onPressed(() => {
              launchWebPage(
                  context, RouterConstants.home, DomainConst.topTwitterUrl)
            }),
      ),
    ];
  }
}
