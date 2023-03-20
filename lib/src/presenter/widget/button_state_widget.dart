import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/constants/enums.dart';

class ButtonStateWidget extends StatelessWidget {
  final String text;
  final double? width;
  final TextEditingController controller;
  final Function()? onPress;
  final ButtonStateType type;

  const ButtonStateWidget(
    this.text, {
    Key? key,
    this.width,
    required this.controller,
    required this.type,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ttt _build ButtonStateWidget 1111");
    return ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, textValue, __) {
          print("ttt _build ButtonStateWidget 22222  :::");
          return SizedBox(
            width: width,
            child: ElevatedButton(
              onPressed: type.validate(controller).isNotEmpty ? null : onPress,
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorName.greenSnake),
              child: Center(
                child: Text(
                  text,
                  style: textStyle.medium.w700.fill(Colors.white),
                ),
              ),
            ),
          );
        });
  }
}
