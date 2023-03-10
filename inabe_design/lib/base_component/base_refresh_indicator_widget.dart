import 'package:aac_core/aac_core.dart';
import 'package:inabe_design/base_component/refresh_indicator_controller.dart';
import 'package:inabe_design/base_component/refresh_indicator_cupertino_controller.dart';
import 'package:inabe_design/base_component/refresh_indicator_loadmore_widget.dart';
import 'package:inabe_design/dimens.dart';

abstract class BaseRefreshIndicatorWidget extends StatelessWidget {
  final Color? indicatorColor;
  final Color? indicatorBackgroundColor;
  final bool showScrollBar;
  final double topOffset;
  final EdgeInsets padding;
  final RequestLoading? onRefresh;
  final RequestLoading? onLoadMore;
  ScrollController? scrollController;
  late RefreshIndicatorController refreshIndicatorController;
  late ValueNotifier<bool> _isLoadingMoreController;

  BaseRefreshIndicatorWidget({
    Key? key,
    this.indicatorColor = ColorName.primaryGreen,
    this.indicatorBackgroundColor = Colors.white,
    this.showScrollBar = false,
    this.topOffset = 0.0,
    this.padding = EdgeInsets.zero,
    this.onRefresh,
    this.onLoadMore,
    this.scrollController,
  }) : super(key: key) {
    RefreshIndicatorCupertinoController.topOffset = topOffset;
    refreshIndicatorController = RefreshIndicatorController();
    _isLoadingMoreController = ValueNotifier(false);

    scrollController ??= ScrollController();
    scrollController?.addListener(() async {
      print("ttt addListener: $onLoadMore:::${_isLoadingMoreController.value}:::$_isBottom");
      if (onLoadMore != null &&
          _isLoadingMoreController.value == false &&
          _isBottom) {
        _doLoadMore();
      }
    });
  }

  bool get _isTop {
    return scrollController!.offset <= 0;
  }

  bool get _isBottom {
    if (!scrollController!.hasClients) return false;
    final maxScroll = scrollController?.position.maxScrollExtent ?? 0;
    final currentScroll = scrollController?.offset ?? 0;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // _buildApiBlocListener(context),
        Configs.widgetStyleIOS
            ? buildIOSStyleIndicator
            : buildAndroidStyleIndicator,
      ],
    );
  }

  Widget get buildIOSStyleIndicator;

  Widget get buildAndroidStyleIndicator;

  Widget get buildLoadMoreWidget => onLoadMore == null
      ? const SizedBox()
      : ValueListenableBuilder(
          valueListenable: _isLoadingMoreController,
          builder: (context, isLoadingMore, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const RefreshIndicatorLoadMoreWidget().show(isLoadingMore),
                const SizedBox(height: Dimens.normalPadding),
              ],
            );
          },
        );

  // : ValueListenableProvider.value(
  //     value: _isLoadingMoreController,
  //     child: Consumer<bool>(
  //       builder: (context, isLoadingMore, child) {
  //         return Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             const RefreshIndicatorLoadMoreWidget().show(isLoadingMore),
  //             const SizedBox(height: Dimens.normalPadding),
  //           ],
  //         );
  //       },
  //     ),
  //   );

  // Widget _buildApiBlocListener(BuildContext context) {
  //   try {
  //     /// Exception if no ApiBloc
  //     bloc<ApiBloc>(context);
  //
  //     return ApiBlocListener(
  //       listenerCondition: (state) {
  //         if (state.status == ApiStatus.error ||
  //             state.status == ApiStatus.success) {
  //           refreshIndicatorController.hideRefreshIndicator();
  //         }
  //         return false;
  //       },
  //     );
  //   } catch (e) {
  //     log('BaseRefreshIndicatorWidget ----- has no ApiBloc');
  //   }
  //   return const SizedBox();
  // }

  Future<void> doRefresh() async {
    Future.delayed(const Duration(seconds: 3), () {
      refreshIndicatorController.hideRefreshIndicator();
    });
    return refreshIndicatorController.showRefreshIndicator(request: onRefresh);
  }

  Future<void> _doLoadMore() async {
    _isLoadingMoreController.value = true;
    if (onLoadMore != null) {
      onLoadMore!();
    }
    await Future.delayed(const Duration(seconds: 2));
    _isLoadingMoreController.value = false;
  }
}
