import 'package:aac_core/aac_core.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  // bottomNavigateToTab(int index, {dynamic arguments}) =>
  //     cubit<BottomNavigationCubit>(this)
  //         .navigateToTab(index: index, arguments: arguments);
  //
  // bottomNavigateUpdateBadgeCounts() =>
  //     cubit<BottomNavigationCubit>(this).updateBadgeCounts();

  bool get isCurrentScreen => ModalRoute.of(this)?.isCurrent == true;

  RouteSettings? get routeSettings => ModalRoute.of(this)?.settings;

  String? get currentRouteName => routeSettings?.name;

  get arguments => routeSettings?.arguments;
}

typedef OnPressUpsert = void Function(Widget child);

extension WidgetX on Widget {
  Widget decor({
    Color? background,
    double? width,
    double? height,
    double? opacity,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxDecoration? boxDecoration,
  }) {
    Widget widget = Container(
      color: background,
      width: width,
      height: height,
      alignment: alignment,
      padding: padding ?? EdgeInsets.zero,
      child: this,
    );
    if (boxDecoration != null) {
      widget = ClipRRect(
        borderRadius: boxDecoration.borderRadius?.resolve(TextDirection.ltr) ??
            BorderRadius.zero,
        child: widget,
      );
    }
    widget = Container(
      padding: margin,
      decoration: boxDecoration,
      child: widget,
    );
    if (opacity != null) {
      widget = Opacity(opacity: opacity, child: widget);
    }
    return widget;
  }

  Widget show(bool? condition) =>
      Visibility(visible: condition ?? false, child: this);

  Widget circle({double? width, Color? color}) => decor(
      boxDecoration: boxDecoration.circle().stroke(width: width, color: color));

  Widget round(double? radius) =>
      decor(boxDecoration: boxDecoration.round(radius));

  Widget corner(
          {double? topLeft,
          double? topRight,
          double? bottomRight,
          double? bottomLeft}) =>
      decor(
          boxDecoration: boxDecoration.corner(
              topLeft: topLeft,
              topRight: topRight,
              bottomRight: bottomRight,
              bottomLeft: bottomLeft));

  Widget iconLeft(Widget icon,
          {double spacing = 0,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center}) =>
      Row(
          crossAxisAlignment: crossAxisAlignment,
          children: [icon, SizedBox(width: spacing), Flexible(child: this)]);

  Widget iconTop(Widget icon, {double spacing = 0}) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [icon, SizedBox(width: spacing), this]);

  Widget iconRight(Widget icon,
          {double spacing = 0,
          MainAxisAlignment mainAxisAlignment = MainAxisAlignment.end,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center}) =>
      Row(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: [this, SizedBox(width: spacing), icon]);

  Widget iconBottom(Widget icon, {double spacing = 0}) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [this, SizedBox(width: spacing), icon]);

  Widget get ignorePressed => IgnorePointer(
        child: this,
      );

  Widget onPressed(dynamic action) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (action is OnPressUpsert)
            ? () {
                action(this);
              }
            : action,
        child: this,
      );

  Widget onPressedInkWell(dynamic action) => InkWell(
        onTap: (action is OnPressUpsert)
            ? () {
                action(this);
              }
            : action,
        child: this,
      );

  Widget background(Widget background,
          {Alignment? alignment, EdgeInsetsGeometry? padding}) =>
      Stack(
        alignment: Alignment.center,
        children: [
          background,
          Padding(
            padding: padding ?? EdgeInsets.zero,
            child: this,
          )
        ],
      );
}
