import 'package:aac_core/aac_core.dart';
import 'package:inabe_design/inabe_design.dart';

class TopBodyWidget extends StatelessWidget {
  final String title;

  const TopBodyWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Text(
              title,
              style: textStyle.large.w700.fill(ColorName.greenSnake),
            ),
          ),
          const Divider(
            height: 1,
            color: ColorName.dividerGray,
          ),
        ],
      ),
    );
  }
}
