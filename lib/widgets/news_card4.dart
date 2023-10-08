import 'package:flutter/material.dart';
import 'package:magnetar_fima/pages/webview/webview4.dart';

class NewsCard4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Köşeleri yumuşatma
                child: Image.asset(
                  "assets/images/news4.jpeg",
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Canada wildfires',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'At least 30,000 households in British \nColumbia told to evacuate...',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
          Positioned(
            bottom: 2.0,
            right: 8.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WebView4(), // DiğerSayfa yerine geçmek istediğiniz sayfanın adını kullanın
                  ),
                );
              },
              child: Text('Read'),
            ),
          ),
        ],
      ),
    );
  }
}
