import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../config/colors.dart';

class WebViewNotification extends StatefulWidget {
  String? url;
  WebViewNotification(this.url);


  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewNotification> {
  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.red,
        title: const Text("webview"),
      ),
      body: WebView(
        initialUrl: "https://hurrybuzz.com/${widget.url}",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}