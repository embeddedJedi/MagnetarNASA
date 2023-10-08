import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ReportM extends StatefulWidget {
  @override
  _ReportMState createState() => _ReportMState();
}

class _ReportMState extends State<ReportM> {
  String _imageUrl = "";
  String _imageUrl2 = "";

  Future<void> _getImage() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Firebase Storage'dan fotoğrafı al
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('yangin.jpg');
      final String downloadURL = await storageRef.getDownloadURL();

      final Reference storageRef2 =
          FirebaseStorage.instance.ref().child('yanginyok.jpg');
      final String downloadURL2 = await storageRef2.getDownloadURL();

      setState(() {
        _imageUrl = downloadURL;
        _imageUrl2 = downloadURL2;

        print("SDASFDASDFADFGSDGHSGDHSDGHSDFHSDFGSDFGSDF");
        print(_imageUrl);
        print(_imageUrl2);
      });
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata durumunda ekranda gösterebileceğiniz bir mesajı veya işlemi burada yapabilirsiniz.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageUrl.isNotEmpty
                ? Image.network(
                    _imageUrl,
                    width: 300,
                    height: 300,
                  )
                : Image.network(
                    _imageUrl,
                    width: 300,
                    height: 300,
                  ),
            _imageUrl2.isNotEmpty
                ? Image.network(
                    _imageUrl2,
                    width: 300,
                    height: 300,
                  )
                : Image.network(
                    _imageUrl2,
                    width: 300,
                    height: 300,
                  ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 18.0),
                  ElevatedButton(
                    onPressed: () {
                      _getImage();
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                          Size(300, 50)), // Genişlik: 150, Yükseklik: 50
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    child: Text(
                      "Fotoğrafı Al",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  _imageUrl.isNotEmpty
                      ? Text(
                          "Have Wildfire",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "Please wait for Analyze",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                  _imageUrl2.isNotEmpty
                      ? Text(
                          "Have not Wildfire",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "Please wait for Analyze",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
