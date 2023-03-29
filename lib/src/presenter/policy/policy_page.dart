import 'dart:io';

import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    String path = '/Users/mubeo/Development/Japan/Inabe/assets/policy.html';

    print("ttt ::: path : $path");
    _controller = WebViewController();
      // ..setNavigationDelegate(
      //   NavigationDelegate(
      //     onProgress: (int progress) {
      //       // Update loading bar.
      //     },
      //     onPageStarted: (String url) {
      //       PopupUtils.showLoadingDialog(context!);
      //     },
      //     onPageFinished: (String url) {
      //       PopupUtils.hideLoadingDialog(context!);
      //     },
      //     onWebResourceError: (WebResourceError error) {
      //       PopupUtils.hideLoadingDialog(context!);
      //     },
      //     onNavigationRequest: (NavigationRequest request) {
      //       PopupUtils.hideLoadingDialog(context!);
      //       if (request.url.startsWith('https://www.youtube.com/')) {
      //         return NavigationDecision.prevent;
      //       }
      //       return NavigationDecision.navigate;
      //     },
      //   ),
      // )

    loadHtmlAssets(_controller);
    // _controller.loadFile('assets/policy.html');

  }

  Future<void> loadHtmlAssets(WebViewController controller) async {
    String fileText = await rootBundle.loadString("assets/policy.html");
    _controller.loadHtmlString(fileText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWidget(
          backgroundColor: ColorName.main,
          onBackPressed: () => {context.pop()},
        ),
        body: WebViewWidget(
          controller: _controller,
        )

        // Padding(
        //   padding: const EdgeInsets.all(Dimens.size10),
        //   child: Column(
        //     children: [
        //       TopBodyWidget(title: str.privacy_policy),
        //       WebViewWidget(
        //         controller: _controller,
        //         // javascriptChannels: getJavascriptChannels(),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
