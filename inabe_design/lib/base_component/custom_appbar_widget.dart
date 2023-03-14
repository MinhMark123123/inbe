import 'package:aac_core/aac_core.dart';

class CustomAppBarWidget extends AppBar {
  bool showBack;
  Color? titleColor;
  dynamic onBackPressed;
  final Widget? centerWidget;

  CustomAppBarWidget({
    Key? key,
    String? title,
    Widget? leading,
    Widget? flexibleSpace,
    PreferredSizeWidget? bottom,
    this.showBack = true,
    bool centerTitle = true,
    double elevation = 0.0,
    double? titleSpacing = 0.0,
    double toolbarHeight = 46.0,
    this.titleColor,
    Color? backgroundColor,
    List<Widget>? actions,
    this.onBackPressed,
    this.centerWidget,
    titleTextStyle,
    ShapeBorder? shape,
    bool enableLeadingSplashRadiusBackground = false,
  }) : super(
          key: key,
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor ?? const Color(0xFFF7F3EF),
          centerTitle: centerTitle,
          elevation: elevation,
          toolbarHeight: toolbarHeight,
          titleSpacing: showBack ? null : titleSpacing,
          leading: showBack
              ? IconButton(
                  splashRadius: 20,
                  icon: CircleAvatar(
                    radius: 20,
                    backgroundColor: enableLeadingSplashRadiusBackground
                        ? Colors.white.withOpacity(0.2)
                        : Colors.transparent,
                    child:
                        leading ?? Assets.images.icArrowBack.image(width: 16),
                  ),
                  onPressed: onBackPressed ?? () => {})
              : null,
          title: centerWidget ??
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: titleTextStyle ?? textStyle.mLarge.w700.fill(titleColor),
              ),
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          shape: shape,
          actions: actions,
        );
}
