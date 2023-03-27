import 'package:aac_core/aac_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/presenter/widget/rich_text_span_widget.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/extensions/context_extesion.dart';
import 'package:inabe_design/inabe_design.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PopupUtils {
  PopupUtils._();

  static const LOADING_DIALOG_ID = 'id-loading-dialog';
  static String? _currentDialogId;

  static bool _currentDialogShowing(BuildContext context, dynamic dialogId) {
    try {
      if (!context.isCurrentScreen &&
          _currentDialogId != null &&
          _currentDialogId == dialogId) {
        return true;
      }
    } catch (e) {
      print('PopupUtils _currentDialogShowing ------ $e');
    }
    return false;
  }

  static _resetOverlay(BuildContext context, String? newDialogId) {
    try {
      if (!context.isCurrentScreen) {
        context.pop();
      }
    } catch (e) {
      print('PopupUtils _resetOverlay ------ $e');
    }
    if (newDialogId != null) {
      _currentDialogId = newDialogId;
    } else {
      _currentDialogId = null;
    }
  }

  static hideLoadingDialog(BuildContext context) {
    print('PopupUtils hideLoadingDialog ------ $_currentDialogId');
    // var currentRoute = GoRouter.of(context);
    // var currentRoute = ModalRoute.of(context);
    // print('PopupUtils hideLoadingDialog ------ ${currentRoute}');
    try {
      // if (!context.isCurrentScreen && _currentDialogId == LOADING_DIALOG_ID) {
      //   context.pop();
      //   _currentDialogId = null;
      // }
      if (_currentDialogId == LOADING_DIALOG_ID) {
        context.pop();
        _currentDialogId = null;
      }
    } catch (e) {
      print('PopupUtils _resetOverlay ------ $e');
    }
  }

  static showLoadingDialog(
    BuildContext context, {
    bool barrierDismissible = true,
  }) async {
    await Future.delayed(Duration.zero);
    if (!context.mounted) return;
    if (_currentDialogShowing(context, LOADING_DIALOG_ID)) {
      return;
    }
    _resetOverlay(context, LOADING_DIALOG_ID);

    showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) => WillPopScope(
        // false: Prevents dialog dismiss on press of back button.
        onWillPop: () async => true,
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // titlePadding: EdgeInsets.zero,
          // contentPadding: EdgeInsets.zero,
          // buttonPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.all(context.screenWidth / 2 - 40),
          content: const SizedBox(
            width: 20,
            height: 20,
            child: Center(
              child: CupertinoActivityIndicator(
                  radius: 15, color: ColorName.primaryGreen),
            ),
          ),
        ),
      ),
    ).whenComplete(() {
      _currentDialogId = null;
    });
  }

  static Future<void> buildShowPopupGuide(BuildContext context,
      {Function()? nextFunc}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(Dimens.size12),
          title: Center(
            child: Text(
              str.resend_forget_mail,
              style: textStyle.large.w700.fill(ColorName.carbonGrey),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  str.forget_check_mail,
                  style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                ),
              ),
              const SizedBox(
                height: Dimens.size40,
              ),
              RichTextSpanWidget(
                str.resend_forget_mail_process_content,
                textAlign: TextAlign.start,
                richTextColor: ColorName.carbonGrey,
                normalTextStyle:
                    textStyle.medium.w700.fill(ColorName.carbonGrey),
                fontWeightRichText: FontWeight.w400,
                spanTexts: [
                  str.resend_forget_mail_process_rich_1,
                  str.resend_forget_mail_process_rich_2,
                ],
              ),
            ],
          ),
          actions: [
            Center(
              child: SizedBox(
                width: 170,
                child: OutlinedButton(
                  onPressed: () {
                    context.pop();
                    nextFunc?.call();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: ColorName.dividerGray),
                  ),
                  child: Text(
                    str.close,
                    style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static showSimpleInformation(BuildContext context,
      {Color? colorTitle,
      String? title,
      Widget? content,
      String? message,
      Widget? logo,
      bool barrierDismissible = true,
      dynamic onDismiss,
      List<Widget>? customButtonActions}) async {
    final _newDialogId = 'id-simple-dialog-$title-$message';
    if (_currentDialogShowing(context, _newDialogId)) {
      return;
    }
    _resetOverlay(context, _newDialogId);

    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (logo != null)
                Padding(
                  padding: const EdgeInsets.all(Dimens.normalPadding * 2),
                  child: logo,
                ),
              if (title != null)
                Text(title,
                    textAlign: TextAlign.center,
                    style: textStyle.xLarge
                        .fill(colorTitle ?? ColorName.primaryColor)),
            ],
          ),
          content: Text(message ?? '',
              textAlign: TextAlign.center,
              style: textStyle.large.w400.fill(ColorName.carbonGrey)),
          titlePadding: const EdgeInsets.all(Dimens.normalPadding),
          contentPadding: const EdgeInsets.all(Dimens.normalPadding),
          buttonPadding:
              const EdgeInsets.symmetric(horizontal: Dimens.normalPadding / 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          actions: customButtonActions,
          actionsPadding:
              const EdgeInsets.only(bottom: Dimens.normalPadding / 2),
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    ).whenComplete(() {
      _currentDialogId = null;
      if (onDismiss != null) {
        onDismiss();
      }
    });
  }

  static showSimpleAlert(
    BuildContext context, {
    Color? colorTitle,
    String? title,
    String? message,
    Widget? logo,
    bool barrierDismissible = true,
    dynamic onDismiss,
    List<AlertButtonAction>? alertButtonActions,
    List<Widget>? customButtonActions,
    Axis? actionButtonsDirection = Axis.vertical,
  }) async {
    final _newDialogId = 'id-simple-dialog-$title-$message';
    if (_currentDialogShowing(context, _newDialogId)) {
      return;
    }
    _resetOverlay(context, _newDialogId);

    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        List<Widget>? finalActions = (alertButtonActions != null)
            ? alertButtonActions
                .map((alertButtonAction) => DialogButton(
                      padding: actionButtonsDirection == Axis.horizontal
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(left: 6, right: 6),
                      // NormalButtonWidget(
                      //   text: alertButtonAction.text,
                      //   buttonTextStyle: alertButtonAction.buttonTextStyle,
                      //   fullWidthButton: true,
                      //   color: alertButtonAction.buttonColor,
                      //   strokeColor: alertButtonAction.buttonStrokeColor,
                      //   strokeWidth: alertButtonAction.buttonStrokeWidth,
                      // ),
                      onPressed: alertButtonAction.action ??
                          () {
                            context.pop();
                          },
                      child: ElevatedButton(
                        onPressed: () => {context.pop()},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorName.greenSnake),
                        child: Center(
                          child: Text(
                            alertButtonAction.text,

                            style: alertButtonAction.buttonTextStyle,
                            // style: textStyle.medium.w700.fill(Colors.white),
                          ),
                        ),
                      ),
                    ))
                .toList()
            : customButtonActions;
        if (actionButtonsDirection == Axis.horizontal) {
          return _alertDialogHorizontal(logo, title, message, finalActions);
        }
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (logo != null)
                Padding(
                  padding: const EdgeInsets.all(Dimens.normalPadding * 2),
                  child: logo,
                ),
              if (title != null)
                Text(title,
                    textAlign: TextAlign.center,
                    style: textStyle.xLarge
                        .fill(colorTitle ?? ColorName.primaryColor)),
            ],
          ),
          content: Text(message ?? '',
              textAlign: TextAlign.center,
              style: textStyle.large.w400.fill(ColorName.carbonGrey)),
          titlePadding: const EdgeInsets.all(Dimens.normalPadding),
          contentPadding: const EdgeInsets.all(Dimens.normalPadding),
          buttonPadding:
              const EdgeInsets.symmetric(horizontal: Dimens.normalPadding / 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          actions: finalActions,
          actionsPadding:
              const EdgeInsets.only(bottom: Dimens.normalPadding / 2),
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    ).whenComplete(() {
      _currentDialogId = null;
      if (onDismiss != null) {
        onDismiss();
      }
    });
  }

  static AlertDialog _alertDialogHorizontal(Widget? logo, String? title,
      String? message, List<Widget>? finalActions) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (logo != null)
            Padding(
              padding: const EdgeInsets.all(Dimens.normalPadding * 2),
              child: logo,
            ),
          if (title != null)
            Text(title,
                textAlign: TextAlign.center,
                style: textStyle.xLarge.fill(ColorName.primaryColor)),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.normalPadding / 2),
            child: Text(message ?? '',
                textAlign: TextAlign.center,
                style: textStyle.large.w400.fill(ColorName.boulder)),
          ),
          const SizedBox(height: Dimens.normalPadding),
          Row(
            children:
                finalActions?.map((e) => Flexible(child: e)).toList() ?? [],
          ),
        ],
      ),
      titlePadding: const EdgeInsets.all(Dimens.normalPadding),
      contentPadding: const EdgeInsets.all(Dimens.normalPadding / 2),
      buttonPadding:
          const EdgeInsets.symmetric(horizontal: Dimens.normalPadding / 2),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      actions: null,
      actionsPadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.center,
    );
  }

  // static showModalSheet(
  //     {required BuildContext context,
  //       required Widget child,
  //       dynamic whenComplete}) async {
  //
  //   if (Configs.widgetStyleIOS) {
  //     showCupertinoModalSheet(
  //       context: context,
  //       useRootNavigator: true,
  //       builder: (context) => Material(color: Colors.transparent, child: child),
  //     ).whenComplete(() => {whenComplete});
  //   } else {
  //     showMaterialModalBottomSheet(
  //       context: context,
  //       useRootNavigator: true,
  //       isDismissible: true,
  //       expand: true,
  //       backgroundColor: Colors.transparent,
  //       builder: (context) => child,
  //     ).whenComplete(() => {whenComplete});
  //   }
  // }

  // static showFullScreenModalSheet(
  //     {required BuildContext context,
  //       required Widget child,
  //       dynamic whenComplete}) async {
  //
  //   CupertinoScaffold.showCupertinoModalBottomSheet(
  //     context: context,
  //     expand: true,
  //     useRootNavigator: true,
  //     isDismissible: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => child,
  //   ).whenComplete(() => {whenComplete});
  // }

  // static showImagePicker(
  //     {required BuildContext context, OnImagePicked? onImagePicked}) async {
  //   PermissionUtils.request(
  //       [Permission.storage, Permission.camera, Permission.photos]);
  //
  //   showModalSheet(
  //     context: context,
  //     child: ImagePickerModalSheetWidget(
  //       onImagePicked: onImagePicked,
  //     ),
  //   );
  // }

  // static showFilePicker(
  //     {required BuildContext context, OnFilesPicked? onFilesPicked}) async {
  //   PermissionUtils.request(
  //       [Permission.storage, Permission.camera, Permission.photos]);
  //
  //   showModalSheet(
  //     context: context,
  //     child: FilePickerModalSheetWidget(
  //       onFilesPicked: onFilesPicked,
  //     ),
  //   );
  // }

  // static showDatePicker(
  //     {required BuildContext context,
  //       ValueChanged<DateTime>? onDateTimeChanged,
  //       DateTime? initialDateTime,
  //       DateTime? minimumDate,
  //       int? minimumYear,
  //       int? maximumYear}) async {
  //
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (context) => Material(
  //       child: Container(
  //         color: Colors.white,
  //         height: screenHeight / 3,
  //         padding: EdgeInsets.only(bottom: screenPadding.bottom),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           children: [
  //             Text(str.done,
  //                 style: textStyle.large.fill(ColorName.secondaryBlue))
  //                 .decor(padding: const EdgeInsets.all(Dimens.normalPadding))
  //                 .onPressed(() {
  //               if (onDateTimeChanged != null && initialDateTime != null) {
  //                 onDateTimeChanged(initialDateTime!);
  //               }
  //               navigator.pop();
  //             }),
  //             Flexible(
  //               child: CupertinoDatePicker(
  //                 initialDateTime: initialDateTime ?? DateTime.now(),
  //                 maximumYear: maximumYear ?? DateTime.now().year,
  //                 minimumYear: minimumYear ?? 1900,
  //                 minimumDate: minimumDate,
  //                 mode: CupertinoDatePickerMode.date,
  //                 onDateTimeChanged: (value) {
  //                   initialDateTime = value;
  //                   if (onDateTimeChanged != null) {
  //                     onDateTimeChanged(value);
  //                   }
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static showPicker(
  //     {required BuildContext context,
  //       required List<String> dataList,
  //       int initialItem = 0,
  //       ValueChanged<dynamic>? onSelectedItemChanged,
  //       String? emptyText}) async {
  //   if (dataList.isEmpty) {
  //     toast(emptyText ?? 'No data');
  //     return;
  //   }
  //
  //
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (context) => Material(
  //       child: Container(
  //         color: Colors.white,
  //         height: screenHeight / 3,
  //         padding: EdgeInsets.only(bottom: screenPadding.bottom),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           children: [
  //             Text(str.done,
  //                 style: textStyle.large.fill(ColorName.secondaryBlue))
  //                 .decor(padding: const EdgeInsets.all(Dimens.normalPadding))
  //                 .onPressed(() {
  //               if (onSelectedItemChanged != null && dataList.length == 1) {
  //                 onSelectedItemChanged(0);
  //               }
  //               navigator.pop();
  //             }),
  //             Flexible(
  //               child: CupertinoPicker(
  //                 itemExtent: 50,
  //                 scrollController:
  //                 FixedExtentScrollController(initialItem: initialItem),
  //                 children: dataList
  //                     .map((data) => Align(
  //                     alignment: Alignment.center,
  //                     child: Text(data,
  //                         style: textStyle.x2Large.fill(Colors.black))))
  //                     .toList(),
  //                 onSelectedItemChanged: (index) {
  //                   if (onSelectedItemChanged != null) {
  //                     onSelectedItemChanged(index);
  //                   }
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static showErrorAlert(BuildContext context, {String? message}) async {
    message.isNotEmpty
        ? showSimpleAlert(
            context,
            colorTitle: Colors.red,
            title: str.confirm_error,
            message: message,
            alertButtonActions: [AlertButtonAction(str.close)],
          )
        : null;
  }

  // static showPendingFeatureAlert(BuildContext context) async {
  //   showSimpleAlert(
  //     context,
  //     title: str.feature_pending,
  //     message: str.feature_pending_message,
  //     logo: Assets.images.community.logoPendingFeature.image(height: 100),
  //     barrierDismissible: true,
  //     alertButtonActions: [AlertButtonAction(str.close)],
  //   );
  // }

  // static showRestrictedFeatureAlert(BuildContext context,
  //     {VoidCallback? action}) async {
  //   showSimpleAlert(
  //     context,
  //     title: str.restricted_popup_title,
  //     message: str.restricted_popup_message,
  //     barrierDismissible: true,
  //     actionButtonsDirection: Axis.horizontal,
  //     alertButtonActions: [
  //       AlertButtonAction(str.close,
  //           buttonTextStyle: textStyle.large.fill(ColorName.primaryColor),
  //           buttonColor: Colors.white,
  //           buttonStrokeColor: ColorName.primaryColor,
  //           buttonStrokeWidth: 1),
  //       AlertButtonAction(str.authorization_contact_BQL, action: action),
  //     ],
  //   );
  // }

  static showMessDialog(BuildContext context, String message,
      {Duration? delay = const Duration(seconds: 5),
      VoidCallback? doSomething,
      bool barrierDismissible = true}) async {
    final _newDialogId = 'id-mess-dialog-$message';
    if (_currentDialogShowing(context, _newDialogId)) {
      return;
    }
    _resetOverlay(context, _newDialogId);

    if (delay != null) {
      Future.delayed(delay, () {
        _resetOverlay(context, _newDialogId);
        doSomething?.call();
      });
    }

    showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) => WillPopScope(
        // false: Prevents dialog dismiss on press of back button.
        onWillPop: () async => true,
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: CenterMessWidget(
            mess: message,
          ),
        ),
      ),
    ).whenComplete(() {
      _currentDialogId = null;
    });
  }

  static showCustomDialog({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
  }) {
    final _newDialogId = 'id-custom-dialog-${builder.runtimeType.toString()}';
    if (_currentDialogShowing(context, _newDialogId)) {
      return;
    }
    _resetOverlay(context, _newDialogId);

    showDialog(
      context: context,
      builder: (context) {
        final child = builder(context);
        return child;
      },
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
    );
  }
}

class AlertButtonAction {
  String text;
  TextStyle? buttonTextStyle;
  Color buttonColor;
  Color buttonStrokeColor;
  double buttonStrokeWidth;
  VoidCallback? action;

  AlertButtonAction(
    this.text, {
    this.buttonTextStyle,
    this.buttonColor = ColorName.primaryColor,
    this.buttonStrokeColor = Colors.transparent,
    this.buttonStrokeWidth = 0,
    this.action,
  }) {
    buttonTextStyle ??= textStyle.large.fill(ColorName.secondaryColor);
  }
}
