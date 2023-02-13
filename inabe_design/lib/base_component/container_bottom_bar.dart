import 'dart:math';
import 'package:flutter/material.dart';
import 'package:inabe_design/dimens.dart';


class ContainerBottomBar extends StatelessWidget {
  final Widget child;
  final bool enableShadow;
  const ContainerBottomBar({
    Key? key,
    required this.child,
    this.enableShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double bottomPadding = max(Dimens.normalPadding, screenPadding.bottom);
    double bottomPadding = Dimens.normalPadding;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: enableShadow
            ? null
            : [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: Dimens.smallRadius,
                ),
              ],
      ),
      padding: EdgeInsets.only(
          left: Dimens.normalPadding,
          top: Dimens.normalPadding,
          right: Dimens.normalPadding,
          bottom: bottomPadding),
      child: child,
    );
  }
}
