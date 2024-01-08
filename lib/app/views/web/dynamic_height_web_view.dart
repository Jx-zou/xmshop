import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

const String heightJavaScript = 'document.querySelector("#webView").offsetHeight';

class DynamicHeightWebView extends StatefulWidget {
  final String data;

  const DynamicHeightWebView({
    super.key,
    required this.data,
  });

  @override
  State<DynamicHeightWebView> createState() => _DynamicHeightWebViewState();
}

class _DynamicHeightWebViewState extends State<DynamicHeightWebView> {
  double _height = 0.0;

  late final WebViewController webViewController;
  late final WebViewWidget webViewWidget;

  void _loadData() {
    webViewController.loadHtmlString('''<html lang="en">
                                          <meta name="viewport" content="initial-scale=1.0 maximum-scale=1.0 minimum-scale=1.0 user-scalable=no">
                                          <style>
                                             html, body { margin: 0; padding: 0; }
                                             img { max-width: 100%; height: auto; }
                                          </style>
                                          <body>
                                            <div id="webView">${widget.data}</div>
                                          </body>
                                        </html>''');
  }

  void _updateHeight() async {
    int height = await webViewController.runJavaScriptReturningResult(heightJavaScript) as int;
    if (height.toDouble() != _height) {
      setState(() {
        _height = height.toDouble();
      });
    }
  }

  void _init() {
    webViewController = WebViewController()
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(onPageFinished: (String url) => _updateHeight()),
      );

    PlatformWebViewWidgetCreationParams params =
        PlatformWebViewWidgetCreationParams(
      controller: webViewController.platform,
      layoutDirection: TextDirection.ltr,
      gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
    );

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewWidgetCreationParams.fromPlatformWebViewWidgetCreationParams(params);
    } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
      params = AndroidWebViewWidgetCreationParams.fromPlatformWebViewWidgetCreationParams(params);
    }

    webViewWidget = WebViewWidget.fromPlatformCreationParams(params: params);
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
    return SizedBox(height: _height, child: webViewWidget);
  }

  @override
  void initState() {
    _init();
    super.initState();
  }
}
