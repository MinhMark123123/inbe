import 'package:aac_core/aac_core.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
            child: Text(
              str.electronic_app_overview_system,
              style: textStyle.medium.w400.fill(ColorName.carbonGrey),
            ),
          ),
          const Divider(
            height: 1,
            color: ColorName.dividerGray,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
            child: Text(
              str.electronic_app_term_of_use,
              style: textStyle.medium.w400.fill(ColorName.carbonGrey),
            ),
          ),
          const Divider(
            height: 1,
            color: ColorName.dividerGray,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
            child: Text(
              str.electronic_app_policy,
              style: textStyle.medium.w400.fill(ColorName.carbonGrey),
            ),
          ),
          const Divider(
            height: 1,
            color: ColorName.dividerGray,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.size20),
            child: Text(
              str.electronic_app_external_link,
              style: textStyle.medium.w400.fill(ColorName.carbonGrey),
            ),
          ),
        ],
      ),
    );
  }
}
