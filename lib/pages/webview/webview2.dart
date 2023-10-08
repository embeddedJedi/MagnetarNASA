import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView2 extends StatelessWidget {
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
                'https://www.nbcnews.com/science/environment/wildfires-are-destroying-decades-clean-air-efforts-us-rcna105140'), // URL
          ),
        ),
      ),
    );
  }
}
