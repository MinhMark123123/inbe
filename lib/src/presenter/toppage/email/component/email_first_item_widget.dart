import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/presenter/widget/rich_text_span_widget.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class EmailFirstItemWidget extends StatelessWidget {
  final EmailModel emailModel;

  const EmailFirstItemWidget({Key? key, required this.emailModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(bottom: Dimens.size10),
      padding: const EdgeInsets.all(Dimens.size10),
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.greenSnake),
        borderRadius:
        const BorderRadius.all(Radius.circular(Dimens.materialTiny)),
      ),
      child: RichTextSpanWidget(
        str.email_first_information,
        textAlign: TextAlign.start,
        normalTextStyle: textStyle.medium.w500.fill(ColorName.carbonGrey),
        richTextColor: ColorName.greenSnake,
        spanTexts: [str.email_first_information_link],
        onPressedActions: [
          () => {
                UriUtils.launchActionOutside(
                    data: str.email_first_information_link)
              }
        ],
      ),
    );
  }
}
