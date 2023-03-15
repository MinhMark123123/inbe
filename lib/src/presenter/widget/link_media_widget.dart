import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/inabe_design.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinkMediaWidget extends StatelessWidget {
  const LinkMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBottomRow();
  }

  Widget _buildBottomRow() {
    return SizedBox(
      height: Dimens.size46,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeExtension(10).w),
            child: Assets.images.icLogoSmall.image(width: 100, height: 34),
          ),
          const Spacer(),
          ..._buildListAction(),
        ],
      ),
    );
  }

  List<Widget> _buildListAction() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
        child: Assets.images.icLive.image(width: 30).onPressed(
            () => {UriUtils.launchActionOutside(data: DomainConst.topLiveUrl)}),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
        child: Assets.images.icInstagram.image(width: 30).onPressed(() =>
            {UriUtils.launchActionOutside(data: DomainConst.topInstagramUrl)}),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeExtension(10).w),
        child: Assets.images.icYoutube.image(width: 30).onPressed(() =>
            {UriUtils.launchActionOutside(data: DomainConst.topYoutubeUrl)}),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeExtension(10).w),
        child: Assets.images.icTwitter.image(width: 30).onPressed(() =>
            {UriUtils.launchActionOutside(data: DomainConst.topTwitterUrl)}),
      ),
    ];
  }
}
