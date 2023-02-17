import 'package:aac_core/aac_core.dart';

class PageIndicatorWidget extends StatelessWidget {
  int currentIndex;
  int count;
  Color? currentColor;
  Color? backgroundColor;
  double dotWidth;
  double dotHeight;
  double spacing;

  PageIndicatorWidget(this.currentIndex, this.count,
      {Key? key,
      this.currentColor,
      this.backgroundColor,
      this.dotWidth = 13,
      this.dotHeight = 4.5,
      this.spacing = 6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    currentColor ??= Colors.white.withOpacity(0.9);
    backgroundColor ??= Colors.white.withOpacity(0.5);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(count, (int index) {
        return _buildIndicator(index);
      }),
    );
  }

  Widget _buildIndicator(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing / 2),
      child: Container(
        width: dotWidth,
        height: dotHeight,
        decoration: boxDecoration
            .circle()
            .fill((index == currentIndex) ? currentColor : backgroundColor),
      ),
    );
  }
}
