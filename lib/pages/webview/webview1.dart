import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetar - News'),
      ),
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(
                'https://www.aljazeera.com/news/2023/7/17/whats-the-latest-on-canadas-record-wildfire-season'), // URL
          ),
        ),
      ),
    );
  }
}
