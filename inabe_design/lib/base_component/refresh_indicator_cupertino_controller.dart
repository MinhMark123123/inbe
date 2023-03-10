import 'package:flutter/cupertino.dart';
import 'package:aac_core/aac_core.dart';

const double _kActivityIndicatorRadius = 14.0;
const double _kActivityIndicatorMargin = _kActivityIndicatorRadius / 2;

class RefreshIndicatorCupertinoController {
  static double topOffset = 0.0;

  static Widget buildRefreshIndicator(
      BuildContext context,
      RefreshIndicatorMode refreshState,
      double pulledExtent,
      double refreshTriggerPullDistance,
      double refreshIndicatorExtent) {
    final double percentageComplete =
        (pulledExtent / refreshTriggerPullDistance).clamp(0.0, 1.0);

    // Place the indicator at the top of the sliver that opens up. Note that we're using
    // a Stack/Positioned widget because the CupertinoActivityIndicator does some internal
    // translations based on the current size (which grows as the user drags) that makes
    // Padding calculations difficult. Rather than be reliant on the internal implementation
    // of the activity indicator, the Positioned widget allows us to be explicit where the
    // widget gets placed. Also note that the indicator should appear over the top of the
    // dragged widget, hence the use of Overflow.visible.
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: _kActivityIndicatorMargin + topOffset,
            left: 0.0,
            right: 0.0,
            child: _buildIndicatorForRefreshState(
                refreshState, _kActivityIndicatorRadius, percentageComplete),
          ),
        ],
      ),
    );
  }

  static Widget _buildIndicatorForRefreshState(
      RefreshIndicatorMode refreshState,
      double radius,
      double percentageComplete) {
    switch (refreshState) {
      case RefreshIndicatorMode.drag:
        // While we're dragging, we draw individual ticks of the spinner while simultaneously
        // easing the opacity in. Note that the opacity curve values here were derived using
        // Xcode through inspecting a native app running on iOS 13.5.
        const Curve opacityCurve = Interval(0.0, 0.35, curve: Curves.easeInOut);
        return Opacity(
          opacity: opacityCurve.transform(percentageComplete),
          child: CupertinoActivityIndicator.partiallyRevealed(
              radius: radius,
              progress: percentageComplete,
              color: ColorName.primaryGreen),
        );
      case RefreshIndicatorMode.armed:
      case RefreshIndicatorMode.refresh:
        // Once we're armed or performing the refresh, we just show the normal spinner.
        return CupertinoActivityIndicator(
            radius: radius, color: ColorName.primaryGreen);
      case RefreshIndicatorMode.done:
        // When the user lets go, the standard transition is to shrink the spinner.
        return CupertinoActivityIndicator(
            radius: radius * percentageComplete, color: ColorName.primaryGreen);
      case RefreshIndicatorMode.inactive:
        // Anything else doesn't show anything.
        return const SizedBox();
    }
  }
}
