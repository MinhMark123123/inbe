import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/navigation/app_routers.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';

class ElectronicAppInfoWidget extends StatelessWidget {
  const ElectronicAppInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
      margin: const EdgeInsets.only(top: Dimens.size6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildListLink(context),
      ),
    );
  }

  List<Widget> _buildListLink(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
        child: Text(
          str.electronic_app_please_check_info,
          style: textStyle.medium.w700.fill(ColorName.carbonGrey),
        ),
      ),
      const Divider(
        height: 1,
        color: ColorName.dividerGray,
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
        child: Text(
          str.electronic_app_overview_system,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
      ).onPressedInkWell(() => {
            launchWebPage(
                context,
                "${RouterConstants.home}/${RouterConstants.electronic_app}",
                DomainConst.libraryOverviewUrl)
          }),
      const Divider(
        height: 1,
        color: ColorName.dividerGray,
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
        child: Text(
          str.electronic_app_term_of_use,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
      ).onPressedInkWell(() => {
            launchWebPage(
                context,
                "${RouterConstants.home}/${RouterConstants.electronic_app}",
                DomainConst.libraryTermUrl)
          }),
      const Divider(
        height: 1,
        color: ColorName.dividerGray,
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
        child: Text(
          str.electronic_app_policy,
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
      ).onPressedInkWell(() => launchWebPage(
          context,
          "${RouterConstants.home}/${RouterConstants.electronic_app}",
          DomainConst.libraryPolicyUrl)),
      const Divider(
        height: 1,
        color: ColorName.dividerGray,
      ),
      _buildItemServiceLink(context),
    ];
  }

  Widget _buildItemServiceLink(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: Dimens.size20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            str.electronic_app_external_link,
            style: textStyle.medium.w400.fill(ColorName.carbonGrey),
          ),
          Assets.images.icLinkLibrary.image(width: Dimens.materialMedium)
        ],
      ),
    ).onPressedInkWell(() => launchWebPage(
          context,
          "${RouterConstants.home}/${RouterConstants.electronic_app}",
          DomainConst.libraryServiceUrl,
        ));
  }
}
