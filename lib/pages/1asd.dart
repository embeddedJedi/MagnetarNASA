import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orman Yangınları: Sebepler, Etkiler ve Önleme'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Orman Yangınları: Sebepler, Etkiler ve Önleme',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Orman yangınları, doğal ve insan kaynaklı etkenlerle tetiklenen yangınlar olarak tanımlanır ve hem doğal ekosistemlere hem de insan yaşamına ciddi zararlar verebilirler. İşte orman yangınlarına dair temel bilgiler:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Sebepler:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. Doğal Faktörler: Şimşek çarpmaları gibi doğal olaylar orman yangınlarının başlamasına neden olabilir.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. İnsan Faaliyetleri: İhmalkarca yapılan ateş yakma, piknikler sırasında kontrolsüz ateşler, sigara izmariti atma gibi insan faaliyetleri yangınların kaynağı olabilir.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. Kuraklık: Uzun süren kurak dönemler, bitki örtüsünün kurumasına ve yangın riskinin artmasına yol açar.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Etkiler:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. Ekosistem Zararı: Yangınlar, doğal yaşam alanlarına zarar verir, bitki ve hayvan türlerini etkiler ve bazılarını tehlikeye atar.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Hava Kalitesi Sorunları: Yangınlar duman ve partikül madde oluşturur, bu da hava kalitesini düşürür ve solunum sorunlarına neden olabilir.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. Toprak Erozyonu: Bitki örtüsünün kaybı toprak erozyonunu artırır ve su kaynaklarını kirletebilir.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Önleme ve Kontrol:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. Dikkatli Davranış: Ormanlık alanlarda ateş yakarken, sigara içerken ve piknik yaparken dikkatli olunmalıdır.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Ateş Yasağı ve İzinler: Yerel yönetimler ateş yasağı ilan edebilir ve ateş yakmak isteyenlerden izin alınması gerekebilir.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. Yangın Kontrol Ekipleri: Yangınla mücadele ekipleri, yangınları hızla kontrol altına almak için çalışır.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '4. Orman Yangını İzleme: Teknolojik araçlar, yangınları erken teşhis etmek ve izlemek için kullanılır.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
