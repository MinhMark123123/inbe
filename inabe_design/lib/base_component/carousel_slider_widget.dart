import 'package:aac_core/aac_core.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:inabe_design/inabe_design.dart';

typedef CarouselOnPageChanged = Function(
    int index, CarouselPageChangedReason reason);

class CarouselSliderWidget<T> extends StatelessWidget {
  List<T> dataList;
  final ItemBuilder<T> itemBuilder;
  Widget? emptyWidget;
  double? width;
  double? height;
  double? aspectRatio;
  double spacing;
  bool autoPlay;
  bool enableInfiniteScroll;
  double numberItemShowed;
  bool enlargeCenterPage;
  bool padEnds;
  Duration autoPlayInterval;
  CarouselController? carouselController;
  CarouselOnPageChanged? carouselOnPageChanged;
  bool showIndicator;
  Color? indicatorColor;
  EdgeInsets? indicatorPadding;
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier(0);

  late double _itemWidth;
  late double _itemHeight;

  CarouselSliderWidget({
    Key? key,
    required this.dataList,
    required this.itemBuilder,
    this.emptyWidget,
    this.width,
    this.height,
    this.aspectRatio,
    this.spacing = 0,
    this.autoPlay = true,
    this.enableInfiniteScroll = true,
    this.numberItemShowed = 1,
    this.enlargeCenterPage = false,
    this.padEnds = false,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.carouselController,
    this.carouselOnPageChanged,
    this.showIndicator = false,
    this.indicatorColor,
    this.indicatorPadding,
  }) : super(key: key) {
    width ??= 200;
    _itemWidth = width! / numberItemShowed;
    _itemHeight = height ??
        getCarouselItemHeight(
            width: width!,
            numberItemShowed: numberItemShowed,
            spacing: spacing,
            aspectRatio: aspectRatio ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    if (dataList.isEmpty) {
      return emptyWidget ?? const SizedBox();
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: dataList.mapIndexed((index, data) {
            if (spacing > 0) {
              return Padding(
                padding: EdgeInsets.only(left: spacing),
                child: itemBuilder(index, data),
              );
            }
            return itemBuilder(index, data);
          }).toList(),
          options: CarouselOptions(
              autoPlay: autoPlay,
              enableInfiniteScroll: enableInfiniteScroll,
              height: _itemHeight,
              aspectRatio: _itemWidth / _itemHeight,
              viewportFraction: 1 / numberItemShowed,
              enlargeCenterPage: enlargeCenterPage,
              padEnds: padEnds,
              autoPlayInterval: autoPlayInterval,
              onPageChanged: (index, reason) {
                _currentPageNotifier.value = index;
                if (carouselOnPageChanged != null) {
                  carouselOnPageChanged!(index, reason);
                }
              }),
          carouselController: carouselController,
        ),
        Padding(
          padding:
              indicatorPadding ?? const EdgeInsets.all(Dimens.normalPadding),
          // child: ValueListenableProvider.value(
          //   value: _currentPageNotifier,
          //   child: Consumer<int>(
          //     builder: (context, index, child) {
          //       return PageIndicatorWidget(index, dataList.length,
          //           currentColor: indicatorColor,
          //           backgroundColor: indicatorColor?.withOpacity(0.2));
          //     },
          //   ),
          // ),
        ).show(showIndicator),
      ],
    );
  }

  double getCarouselItemHeight(
      {double? width,
      required double numberItemShowed,
      required double spacing,
      required double aspectRatio,
      double verticalPadding = 0}) {
    width ??= 200;
    double itemWidth = width / numberItemShowed;
    double itemHeight = (itemWidth - spacing) / aspectRatio;
    return itemHeight + verticalPadding;
  }
}
