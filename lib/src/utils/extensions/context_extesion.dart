import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQueryData => MediaQuery.of(this);

  Size get screenSize => mediaQueryData.size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  EdgeInsets get screenPadding => mediaQueryData.padding;
}
