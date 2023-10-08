import 'package:flutter/material.dart';
import 'package:magnetar_fima/pages/1asd.dart';

class ForestFireApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orman Yangınları',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Resources(),
    );
  }
}

class Resources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hoş Geldiniz!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Orman yangınları hakkında bilgi almak ve eğitimler almak için bu uygulamayı kullanabilirsiniz. Aşağıdaki seçeneklerden birini seçin:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SummaryPage(), // DiğerSayfa yerine geçmek istediğiniz sayfanın adını kullanın
                  ),
                );
              },
              child: Text('Orman Yangınları Hakkında Bilgi Al'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Eğitim sayfasına yönlendirme yapılabilir.
              },
              child: Text('Orman Yangını Eğitimleri'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Kılavuzlar sayfasına yönlendirme yapılabilir.
              },
              child: Text('Orman Yangını Kılavuzları'),
            ),
          ],
        ),
      ),
    );
  }
}
