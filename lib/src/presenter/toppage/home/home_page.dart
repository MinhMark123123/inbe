import 'package:aac_core/aac_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/toppage/home/component/home_carousel_widget.dart';
import 'package:inabe/src/presenter/toppage/home/component/home_conveniences_widget.dart';
import 'package:inabe/src/presenter/toppage/home/component/home_news_widget.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/home_view_model.dart';
import 'package:inabe/src/presenter/widget/link_media_widget.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe_design/inabe_design.dart';

class HomePage extends ConsumerViewModelWidget<HomePageViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  AutoDisposeProvider<HomePageViewModel> viewModelProvider() =>
      homePageControllerProvider;

  @override
  Widget buildWidget(
    BuildContext context,
    WidgetRef ref,
    HomePageViewModel viewModel,
  ) {
    useAutomaticKeepAlive(wantKeepAlive: true);

    return Scaffold(
      body: SafeArea(child: buildBodyHome(ref)),
    );
  }

  Widget buildBodyHome(WidgetRef ref) {
    return Column(
      children: [
        const LinkMediaWidget(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeCarouselWidget(),
                HomeNewsWidget(),
                HomeConveniencesWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
