import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ReportM extends StatefulWidget {
  @override
  _ReportMState createState() => _ReportMState();
}

class _ReportMState extends State<ReportM> {
  String _imageUrl = "";

  Future<void> _getImage() async {
    // Firebase Storage'dan fotoğrafı al
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('images/your_image.jpg');
    final String downloadURL = await storageRef.getDownloadURL();

    setState(() {
      _imageUrl = downloadURL;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fotoğraf ve Yazı'),
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
                : Placeholder(
                    fallbackHeight: 300,
                    fallbackWidth: 300,
                  ),
            SizedBox(height: 20),
            Text('Altında görüntülenmesini istediğiniz yazı buraya gelecek.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Fotoğrafı Al'),
            ),
          ],
        ),
      ),
    );
  }
}
