import 'package:flutter/material.dart';
import 'package:magnetar_fima/pages/fire_report.dart';
import 'package:magnetar_fima/pages/resources.dart';
import 'package:magnetar_fima/widgets/news_card1.dart';
import 'package:magnetar_fima/widgets/news_card2.dart';
import 'package:magnetar_fima/widgets/news_card3.dart';
import 'package:magnetar_fima/widgets/news_card4.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Color(0xFF0077FF),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.1,
                    0.4,
                    1.0,
                  ],
                  colors: [
                    Colors.blue,
                    Colors.blueAccent,
                    Colors.lightBlueAccent
                  ]),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7), // Gölge rengi
                  spreadRadius: 10, // Gölge genişliği
                  blurRadius: 7, // Gölge bulanıklığı
                  offset: Offset(0, 3), // Gölge yönlendirme (x, y)
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 18.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ReportPage(), // DiğerSayfa yerine geçmek istediğiniz sayfanın adını kullanın
                            ),
                          );
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size(300, 50)), // Genişlik: 150, Yükseklik: 50
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        child: Text(
                          "Report Wildfires",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 18.0),
                      ElevatedButton(
                        onPressed: () {
                          MaterialPageRoute(
                            builder: (context) =>
                                ForestFireApp(), // DiğerSayfa yerine geçmek istediğiniz sayfanın adını kullanın
                          );
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size(300, 50)), // Genişlik: 150, Yükseklik: 50
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child: Text(
                          "Resources",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "    Announcements & News",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                NewsCard(),
                NewsCard2(),
                NewsCard3(),
                NewsCard4(),
                SizedBox(
                  width: 20,
                  height: 13,
                ),
                Text(
                  "Resources",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // Kutu içeriği buraya eklenir
          ),
        ),
      ),
    );
  }
}
