import 'package:inabe_design/inabe_design.dart';

class CenterMessWidget extends StatelessWidget {
  Color color;
  String mess;

  CenterMessWidget({Key? key, this.color = Colors.black, required this.mess})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.materialMedium, vertical: Dimens.size12),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color.withOpacity(0.7),
          borderRadius:
              const BorderRadius.all(Radius.circular(Dimens.materialSmall)),
        ),
        child: Text(
          mess,
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
