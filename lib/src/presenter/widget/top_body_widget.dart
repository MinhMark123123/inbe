import 'package:aac_core/aac_core.dart';
import 'package:inabe_design/inabe_design.dart';

class TopBodyWidget extends StatelessWidget {
  final String title;
  final bool? isLineBottom;

  TopBodyWidget({
    Key? key,
    required this.title,
    this.isLineBottom,
  }) : super(key: key) {
    isLineBottom ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: textStyle.large.w700.fill(ColorName.greenSnake),
              ),
            ),
          ),
          if(isLineBottom == true)
          const Divider(
            height: 2,
            color: ColorName.dividerGray,
          ),
        ],
      ),
    );
  }
}
