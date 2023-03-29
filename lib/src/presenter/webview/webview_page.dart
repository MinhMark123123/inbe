import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/utils/popup_utils.dart';
import 'package:inabe_design/inabe_design.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  final String url;

  const WebviewPage({Key? key, this.url = 'about:blank'}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late WebViewController _webViewController;
  late Uri uri;

  @override
  void initState() {
    uri = validateUrl(widget.url);
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            PopupUtils.showLoadingDialog(context);
          },
          onPageFinished: (String url) {
            PopupUtils.hideLoadingDialog(context);
          },
          onWebResourceError: (WebResourceError error) {
            PopupUtils.hideLoadingDialog(context);
          },
          onNavigationRequest: (NavigationRequest request) {
            PopupUtils.hideLoadingDialog(context);
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(uri);
    super.initState();
  }

  Uri validateUrl(String url) {
    if (!url.startsWith("http")) {
      return Uri.parse('${DomainConst.URL}$url');
    } else {
      return Uri.parse(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        onBackPressed: () => {context.pop()},
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return WebViewWidget(
      controller: _webViewController,
    );
  }
}
