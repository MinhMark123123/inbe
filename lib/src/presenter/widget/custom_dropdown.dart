import 'package:aac_core/aac_core.dart';
import 'package:inabe_design/inabe_design.dart';

class CustomDropDown extends StatelessWidget {
  final String? title;
  final String? value;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  final Function onChanged;

  const CustomDropDown({
    Key? key,
    this.title,
    this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.greenD6,
      padding: const EdgeInsets.all(Dimens.size10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title ?? "",
            style: textStyle.medium.w700.fill(ColorName.carbonGrey),
          ),
          const SizedBox(height: Dimens.mediumPadding),
          Container(
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(color: ColorName.boulder, width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.size12),
              child: DropdownButton<String>(
                value: value.isNotEmpty ? value : null,
                hint: Text(
                  hint,
                  style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                  overflow: TextOverflow.ellipsis,
                ),
                style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                items: items,
                onChanged: (item) {
                  onChanged(item);
                },
                isExpanded: true,
                underline: Container(),
                icon: Assets.images.icDropdown.svg(width: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
