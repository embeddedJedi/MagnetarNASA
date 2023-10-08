import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MapWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Alt başlık

            // Web içeriği
            Expanded(
              child: Center(
                // Web içeriği burada merkezlenir
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse(
                        'https://sites.google.com/view/magnetarfima/map'),
                  ),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      useShouldOverrideUrlLoading: true,
                      javaScriptEnabled: true,
                      useOnLoadResource: true,
                    ),
                    ios: IOSInAppWebViewOptions(
                      allowsInlineMediaPlayback: true,
                    ),
                  ),
                ),
              ),
            ),
            // Yazı
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'NASA FIRMS 2022 MODIS Datasets\n                      -Mapping-',
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 180,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Other Mapping (Observation Tower)',
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          right: 6.0,
          bottom: 50,
        ), // Ayarlayın
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.next_plan),
        ),
      ),
    );
  }
}
