import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/model/faq_model.dart';
import 'package:inabe_design/inabe_design.dart';

class FAQItemWidget extends StatelessWidget {
  final FAQModel faqModel;

  const FAQItemWidget({Key? key, required this.faqModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Dimens.size20),
        Row(
          children: [
            Container(
              width: Dimens.size4,
              height: Dimens.size20,
              color: ColorName.greenB7,
            ),
            const SizedBox(width: Dimens.size4),
            Text(
              faqModel.name ?? '',
              style: textStyle.medium.w700.fill(ColorName.carbonGrey),
            ),
          ],
        ),
        if (faqModel.faqs != null)
          ListWidget<Faqs>(
            shrinkWrap: true,
            dataList: faqModel.faqs!,
            itemBuilder: (index, item) {
              // return Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     Container(
              //       color: ColorName.grayF5,
              //       margin: const EdgeInsets.symmetric(vertical: Dimens.size10),
              //       padding: const EdgeInsets.all(Dimens.size10),
              //       child: Text(
              //         item.question ?? '',
              //         style: textStyle.medium.w700.fill(ColorName.carbonGrey),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(Dimens.size10),
              //       child: Text(
              //         item.answer ?? '',
              //         style: textStyle.medium.w400.fill(ColorName.carbonGrey),
              //       ),
              //     ).decor(
              //       boxDecoration: boxDecoration.stroke(
              //         width: 1,
              //         color: ColorName.grayF5,
              //       ),
              //     ),
              //   ],
              // );
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: Dimens.size10),
                  title: Text(
                    item.question ?? '',
                    style: textStyle.medium.w700.fill(ColorName.carbonGrey),
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  collapsedBackgroundColor: ColorName.grayF5,
                  collapsedTextColor: ColorName.carbonGrey,
                  collapsedIconColor: ColorName.greenB7,
                  iconColor: ColorName.grayC9,
                  backgroundColor: ColorName.grayF5,
                  // subtitle: Text(item.answer ?? ''),
                  // trailing: Icon(
                  //   _customTileExpanded
                  //       ? Icons.arrow_drop_down_circle
                  //       : Icons.arrow_drop_down,
                  // ),
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.all(Dimens.size10),
                    //   child: Text(
                    //     item.answer ?? '',
                    //     style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                    //   ),
                    // ).decor(
                    //   boxDecoration: BoxDecoration(
                    //       color: Colors.white,
                    //       border: Border.all(width: 1, color: ColorName.grayF5)
                    //   ),
                    // ),
                    // ListTile(
                    //   contentPadding: EdgeInsets.zero,
                    //   title: Padding(
                    //     padding: const EdgeInsets.all(Dimens.size10),
                    //     child: Text(
                    //       item.answer ?? '',
                    //       style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                    //     ),
                    //   ).decor(
                    //     boxDecoration: BoxDecoration(
                    //       color: Colors.white,
                    //       border: Border.all(width: 1, color: ColorName.grayF5)
                    //     ),
                    //   ),
                    //   // Text(
                    //   //   item.answer ?? '',
                    //   //   style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                    //   // ),
                    // ),
                    Container(
                      width: Configs.screenWidth,
                      padding: const EdgeInsets.all(Dimens.size10),
                      child: Text(
                        item.answer ?? '',
                        style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                      ),
                    ).decor(
                      boxDecoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: ColorName.grayF5)
                      ),
                    ),
                  ],
                  // onExpansionChanged: (bool expanded) {
                  //   setState(() => _customTileExpanded = expanded);
                  // },
                ),
              );
            },
          )
      ],
    );
  }
}
