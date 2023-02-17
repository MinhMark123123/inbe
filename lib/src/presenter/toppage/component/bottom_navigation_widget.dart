import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/controller/top_page_controller.dart';

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
      currentIndex: position,
      selectedItemColor: ColorName.greenSnake,
      selectedLabelStyle: textStyle.xSmall.w500.fill(ColorName.greenSnake),
      unselectedLabelStyle: textStyle.xSmall.w500.fill(ColorName.dividerGray),
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          label: "Home",
          activeIcon: Assets.images.icHomeActive.image(width: 24),
          icon: Assets.images.icHome.image(width: 24),
        ),
        BottomNavigationBarItem(
          label: "Email",
          activeIcon: Assets.images.icEmailActive.image(width: 24),
          icon: Assets.images.icEmail.image(width: 24),
        ),
        BottomNavigationBarItem(
          label: "Medicine",
          activeIcon: Assets.images.icMedicine.image(width: 24),
          icon: Assets.images.icMedicine.image(width: 24),
        ),
        BottomNavigationBarItem(
          label: "Menu",
          activeIcon: Assets.images.icMenu.image(width: 24),
          icon: Assets.images.icMenu.image(width: 24),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    ref.read(topControllerProvider.notifier).setPosition(index);
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go("/${RouterConstants.email}");
        break;
      case 2:
        context.go("/${RouterConstants.medicine}");
        break;
      case 3:
        context.go("/${RouterConstants.menu}");
        break;
      default:
    }
  }
}
