import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/controller/top_page_controller.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/uri_utils.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavigationWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(topControllerProvider);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: position,
      selectedItemColor: ColorName.greenSnake,
      selectedLabelStyle: textStyle.xSmall.w500.fill(ColorName.greenSnake),
      unselectedLabelStyle: textStyle.xSmall.w500.fill(ColorName.dividerGray),
      onTap: _onItemTapped,
      items: [
        // buildItemNavigation(),
        // buildItemNavigation(),
        // buildItemNavigation(),
        // buildItemNavigation(),
        buildItemNavigation2(),
        buildItemNavigation1(),
        buildItemNavigation1(),
        buildItemNavigation1(),
        // BottomNavigationBarItem(
        //   label: str.email_tab,
        //   activeIcon: Assets.images.icEmailActive.image(width: 24),
        //   icon: Assets.images.icEmail.image(width: 24),
        // ),
        // BottomNavigationBarItem(
        //   label: str.medicine_tab,
        //   activeIcon: Assets.images.icMedicine.image(width: 24),
        //   icon: Assets.images.icMedicine.image(width: 24),
        // ),
        // BottomNavigationBarItem(
        //   label: str.menu_tab,
        //   activeIcon: Assets.images.icMenu.image(width: 24),
        //   icon: Assets.images.icMenu.image(width: 24),
        // ),
      ],
    );
  }

  BottomNavigationBarItem buildItemNavigation() {
    return BottomNavigationBarItem(
      label: str.home_tab,
      activeIcon: Assets.images.icHomeActive.image(width: 24),
      icon: Assets.images.icHome.image(width: 24),
    );
  }

  BottomNavigationBarItem buildItemNavigation1() {
    return BottomNavigationBarItem(
      // label: str.home_tab,
      label: "いなべ市生活情報\n（まいめる）",
      activeIcon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.icHomeActive.image(width: 24),
          Text(
            "いなべ市生活情報\n（まいめる）",
            textAlign: TextAlign.center,
            style: textStyle.w500.xSmall.fill(ColorName.greenSnake).copyWith(height: 1)
            ,
          )
        ],
      ),

      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.icHome.image(width: 24),
          Text(
            // str.home_tab,
            "いなべ市生活情報\n（まいめる）",
            textAlign: TextAlign.center,
            style: textStyle.w500.xSmall.fill(ColorName.greenSnake),
          )
        ],
      ),
    );
  }

  BottomNavigationBarItem buildItemNavigation2() {
    return BottomNavigationBarItem(
      // label: str.home_tab,
      label: "Home",
      activeIcon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.icHomeActive.image(width: 24),
          Text(
            "Home",
            textAlign: TextAlign.center,
            style: textStyle.w500.xSmall.fill(ColorName.greenSnake).copyWith(height: 1)
            ,
          )
        ],
      ),

      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.icHome.image(width: 24),
          Text(
            // str.home_tab,
            "Home",
            textAlign: TextAlign.center,
            style: textStyle.w500.xSmall.fill(ColorName.greenSnake),
          )
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    final position = (index == 2 || index == 3) ? 0 : index;
    ref.read(topControllerProvider.notifier).setPosition(position);
    switch (index) {
      case 0:
        context?.go('/${RouterConstants.home}');
        break;
      case 1:
        context?.go("/${RouterConstants.email}");
        break;
      case 2:
        UriUtils.launchActionOutside(data: DomainConst.tabMedicineUrl);
        break;
      case 3:
        context?.go("/${RouterConstants.menu}");
        break;
      default:
    }
  }
}
