import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/home_view_model.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/slider_item.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe_design/inabe_design.dart';

class HomeCarouselWidget extends ConsumerViewModelWidget<HomePageViewModel> {
  HomeCarouselWidget({Key? key}) : super(key: key);

  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, HomePageViewModel viewModel) {
    final data = ref.watch(viewModel.topSlides);

    return Column(
      children: [
        CarouselSlider(
          items: data.map((e) {
            return SliderHomeItem(sliderModel: e);
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1,
              aspectRatio: 1.75,
              onPageChanged: (index, reason) {
                _current = index;
                //no-op
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: Dimens.size10,
                  height: Dimens.size10,
                  margin: const EdgeInsets.symmetric(
                      vertical: Dimens.mediumPadding, horizontal: 3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? ColorName.greenB7
                        : const Color(0xFFF5F5F5),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  AutoDisposeProvider<HomePageViewModel> viewModelProvider() {
    return homePageControllerProvider;
  }
}
