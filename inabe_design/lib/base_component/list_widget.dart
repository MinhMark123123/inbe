import 'package:aac_core/aac_core.dart';
import 'package:inabe_design/base_component/list_delegate_controller.dart';

class ListWidget<T> extends StatelessWidget {
  List<T> dataList;
  final ItemBuilder<T> itemBuilder;
  Widget? emptyWidget;
  bool shrinkWrap;
  Color? dividerColor;
  double? dividerHeight;
  ScrollPhysics? physics;
  EdgeInsetsGeometry? padding;
  final OnClickItem<T>? onClickItem;

  ListWidget(
      {Key? key,
      required this.dataList,
      required this.itemBuilder,
      this.emptyWidget,
      this.shrinkWrap = false,
      this.dividerColor = Colors.transparent,
      this.dividerHeight = 0,
      this.physics,
      this.padding = EdgeInsets.zero,
      this.onClickItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (dataList.isEmpty) {
      return emptyWidget ?? const SizedBox();
    }
    return ListView.builder(
      primary: false,
      shrinkWrap: shrinkWrap,
      scrollDirection: Axis.vertical,
      physics: physics ?? const BouncingScrollPhysics(),
      padding: padding,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            itemBuilder(index, dataList[index]).onPressed(() {
              if (onClickItem != null) {
                onClickItem!(index, dataList[index]);
              }
            }),
            Divider(
                height: dividerHeight,
                thickness: dividerHeight,
                color: dividerColor)
          ],
        );
      },
      itemCount: dataList.length,
    );
  }
}
