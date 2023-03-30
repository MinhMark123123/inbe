import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/controller/top_page_controller.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';

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
      currentIndex: position,
      selectedItemColor: ColorName.greenSnake,
      selectedLabelStyle:
          textStyle.xSmall.w500.fill(ColorName.greenSnake).copyWith(
                overflow: TextOverflow.visible,
              ),
      unselectedLabelStyle:
          textStyle.xSmall.w500.fill(ColorName.dividerGray).copyWith(
                overflow: TextOverflow.visible,
              ),
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          label: str.home_tab,
          activeIcon: Assets.images.icHomeActive.image(width: 24),
          icon: Assets.images.icHome.image(width: 24),
        ),
        BottomNavigationBarItem(
          label: str.email_tab,
          activeIcon: Assets.images.icEmailActive.image(width: 24),
          icon: Assets.images.icEmail.image(width: 24),
        ),
        BottomNavigationBarItem(
          label: str.medicine_tab,
          activeIcon: Assets.images.icMedicine.image(width: 24),
          icon: Assets.images.icMedicine.image(width: 24),
        ),
        BottomNavigationBarItem(
          label: str.menu_tab,
          activeIcon: Assets.images.icMenu.image(width: 24),
          icon: Assets.images.icMenu.image(width: 24),
        ),
      ],
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
        context?.push('/${RouterConstants.home}/${RouterConstants.webpage}',
            extra: DomainConst.tabMedicineUrl ?? '');
        break;
      case 3:
        if (context != null) {
          var path = GoRouter.of(context!).location;
          if (path.contains(RouterConstants.menu)) {
            context?.go("/${RouterConstants.home}");
          } else {
            context?.go("/${RouterConstants.menu}");
          }
        }
        break;
      default:
    }
  }
}
