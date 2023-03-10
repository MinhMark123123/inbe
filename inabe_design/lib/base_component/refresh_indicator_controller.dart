import 'dart:async';
import 'package:aac_core/aac_core.dart';

typedef RequestLoading = Future<void> Function();

Completer<void> _refreshCompleter = Completer();

class RefreshIndicatorController {
  GlobalKey<RefreshIndicatorState>? refreshIndicatorKey;

  RefreshIndicatorController() {
    refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  }

  showRefreshIndicator({Function? request}) {
    hideRefreshIndicator();
    if (request == null) {
      return;
    }
    _refreshCompleter = Completer();

    /// Request
    request();
    return _refreshCompleter.future;
  }

  hideRefreshIndicator() {
    if (!_refreshCompleter.isCompleted) {
      _refreshCompleter.complete();
    }
  }
}
