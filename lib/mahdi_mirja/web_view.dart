import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemo extends StatefulWidget {
  const WebViewDemo({Key? key}) : super(key: key);

   @override
  _WebViewDemoState createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State<WebViewDemo> {
  late final WebViewController controller;
  var loadingPercentage=0;

  @override
  void initState() {
    super.initState();
 // controller=WebViewController().loadRequest(Uri.parse('https://flutter.dev'))  ;

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WebView(
        initialUrl: 'https://flutter.dev',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          controller = webViewController;
        },
      ),
    ));
  }
}
