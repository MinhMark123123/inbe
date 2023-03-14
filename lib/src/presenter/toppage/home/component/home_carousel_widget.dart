import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/top_slider_model.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/home_view_model.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/slider_item.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe_design/inabe_design.dart';

class HomeCarouselWidget extends ConsumerViewModelWidget<HomePageViewModel> {
  HomeCarouselWidget({Key? key}) : super(key: key);

  final CarouselController _controller = CarouselController();
  final ValueNotifier<int> _currentValue = ValueNotifier(0);

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
              aspectRatio: 1.76,
              onPageChanged: (index, reason) {
                _currentValue.value = index;
                //no-op
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(Dimens.size10),
          child: ValueListenableBuilder<int>(
            valueListenable: _currentValue,
            builder: (context, index, child) {
              return PageIndicatorWidget(
                index,
                data.length,
                spacing: Dimens.size10,
                dotWidth: Dimens.size10,
                dotHeight: Dimens.size10,
                currentColor: ColorName.greenSnake,
                backgroundColor: ColorName.grayF5,
                onTap: (index) => {
                  _controller.animateToPage(index)
                },
              );
            },
          ),
        ),
      ],
    );
  }


  @override
  AutoDisposeProvider<HomePageViewModel> viewModelProvider() {
    return homePageControllerProvider;
  }
}
