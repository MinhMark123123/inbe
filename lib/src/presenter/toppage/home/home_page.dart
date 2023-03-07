import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/presenter/toppage/home/component/home_carousel_widget.dart';
import 'package:inabe/src/presenter/toppage/home/component/home_conveniences_widget.dart';
import 'package:inabe/src/presenter/toppage/home/component/home_news_widget.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/home_view_model.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class HomePage extends ConsumerViewModelWidget<HomePageViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  AutoDisposeProvider<HomePageViewModel> viewModelProvider() =>
      homePageControllerProvider;

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, HomePageViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
          child: Assets.images.icLogoSmall.image(width: 100, height: 34),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
            child: Assets.images.icLive.image(width: 30).onPressed(() => {
              UriUtils.launchActionOutside(data: DomainConst.URL)
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
            child: Assets.images.icInstagram.image(width: 30).onPressed(() => {
              UriUtils.launchActionOutside(data: DomainConst.URL)
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
            child: Assets.images.icYoutube.image(width: 30).onPressed(() => {
              UriUtils.launchActionOutside(data: DomainConst.URL)
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
            child: Assets.images.icTwitter.image(width: 30).onPressed(() => {
              UriUtils.launchActionOutside(data: DomainConst.URL)
            }),
          ),
        ],
      ),
      body: buildBodyHome(ref),
    );
  }

  Widget buildBodyHome(WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeCarouselWidget(),
          HomeNewsWidget(),
          HomeConveniencesWidget(),
        ],
      ),
    );
  }
}
