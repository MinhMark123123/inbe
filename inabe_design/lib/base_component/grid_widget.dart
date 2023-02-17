import 'package:aac_core/aac_core.dart';
import 'package:inabe_design/base_component/list_delegate_controller.dart';

class GridWidget<T> extends StatelessWidget {
  List<T> dataList;
  final ItemBuilder<T> itemBuilder;
  Widget? emptyWidget;
  bool shrinkWrap;
  int crossAxisCount;
  double crossAxisSpacing;
  double mainAxisSpacing;
  double childAspectRatio;
  ScrollPhysics? physics;
  EdgeInsetsGeometry? padding;
  final OnClickItem<T>? onClickItem;

  GridWidget(
      {Key? key,
      required this.dataList,
      required this.itemBuilder,
      required this.crossAxisCount,
      this.emptyWidget,
      this.shrinkWrap = false,
      this.crossAxisSpacing = 0,
      this.mainAxisSpacing = 0,
      this.childAspectRatio = 1,
      this.physics,
      this.padding,
      this.onClickItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (dataList.isEmpty) {
      return emptyWidget ?? const SizedBox();
    }
    return GridView.builder(
      primary: false,
      physics: physics ?? const BouncingScrollPhysics(),
      shrinkWrap: shrinkWrap,
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) {
        return itemBuilder(index, dataList[index]).onPressed(() {
          if (onClickItem != null) {
            onClickItem!(index, dataList[index]);
          }
        });
      },
      itemCount: dataList.length,
    );
  }
}
