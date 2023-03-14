import 'package:aac_core/aac_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:inabe_design/base_component/base_refresh_indicator_widget.dart';
import 'package:inabe_design/base_component/refresh_indicator_controller.dart';
import 'package:inabe_design/base_component/refresh_indicator_cupertino_controller.dart';
import 'package:inabe_design/inabe_design.dart';

class RefreshIndicatorDataListWidget<T> extends BaseRefreshIndicatorWidget {
  final List<T> dataList;
  final ItemBuilder<T> itemBuilder;
  SeparatorBuilder? separatorBuilder;
  final OnClickItem<T>? onClickItem;
  final Widget? emptyWidget;
  final Color dividerColor;
  final double dividerHeight;

  RefreshIndicatorDataListWidget({
    Key? key,
    required this.dataList,
    required this.itemBuilder,
    this.separatorBuilder,
    this.onClickItem,
    this.emptyWidget,
    this.dividerHeight = 0,
    this.dividerColor = Colors.transparent,
    Color? indicatorColor = ColorName.primaryGreen,
    Color? indicatorBackgroundColor = Colors.white,
    bool showScrollBar = false,
    double topOffset = 10.0,
    EdgeInsets padding = EdgeInsets.zero,
    RequestLoading? onRefresh,
    RequestLoading? onLoadMore,
    ScrollController? scrollController,
  }) : super(
          key: key,
          indicatorColor: indicatorColor,
          indicatorBackgroundColor: indicatorBackgroundColor,
          showScrollBar: showScrollBar,
          topOffset: topOffset,
          padding: padding,
          onRefresh: onRefresh,
          onLoadMore: onLoadMore,
          scrollController: scrollController,
        ) {
    if (separatorBuilder == null && dividerHeight > 0) {
      separatorBuilder = (index) => Divider(
            height: dividerHeight,
            /*thickness: dividerHeight,*/
            color: dividerColor,
          );
    }
  }

  @override
  Widget get buildIOSStyleIndicator => CupertinoScrollbar(
        controller: scrollController,
        thickness: showScrollBar ? CupertinoScrollbar.defaultThickness : 0,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          controller: scrollController,
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: doRefresh,
              builder:
                  RefreshIndicatorCupertinoController.buildRefreshIndicator,
            ),
            SliverPadding(
              padding: padding,
              sliver: dataList.isEmpty
                  ? SliverToBoxAdapter(child: emptyWidget)
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              itemBuilder(index, dataList[index]),
                              separatorBuilder != null
                                  ? separatorBuilder!(index)
                                  : const SizedBox(),
                            ],
                          ).onPressed(() {
                            if (onClickItem != null) {
                              onClickItem!(index, dataList[index]);
                            }
                          });
                        },
                        childCount: dataList.length,
                      ),
                    ),
            ),
            SliverToBoxAdapter(child: buildLoadMoreWidget),
          ],
        ),
      );

  @override
  Widget get buildAndroidStyleIndicator => RefreshIndicator(
        key: refreshIndicatorController.refreshIndicatorKey,
        color: indicatorColor,
        backgroundColor: indicatorBackgroundColor,
        onRefresh: doRefresh,
        child: CupertinoScrollbar(
          controller: scrollController,
          thickness: showScrollBar ? CupertinoScrollbar.defaultThickness : 0,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: padding,
                sliver: dataList.isEmpty
                    ? SliverToBoxAdapter(child: emptyWidget)
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                itemBuilder(index, dataList[index]),
                                separatorBuilder != null
                                    ? separatorBuilder!(index)
                                    : const SizedBox(),
                              ],
                            ).onPressed(() {
                              if (onClickItem != null) {
                                onClickItem!(index, dataList[index]);
                              }
                            });
                          },
                          childCount: dataList.length,
                        ),
                      ),
              ),
              SliverToBoxAdapter(child: buildLoadMoreWidget),
            ],
          ),
        ),
      );
}
